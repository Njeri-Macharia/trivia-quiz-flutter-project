import 'dart:async';
import 'dart:convert';
import 'package:finalproject/constants/constant.dart';
import '../../views/customContainer.dart';
import '../../views/custom_button.dart';
import '../../views/options.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List questions = [];
  int scores = 0;
  int number = 0;
  int points = 10;
  bool showDialogOnce = true;
  int counter = 15;
  List<String> shuffleoption = [];
  Timer? timer;
  String selectedOption = "";
  String correctAnswer = "";

  void handleOptionSelection(String option) {
    setState(() {
      selectedOption = option;
      // Check if selected option matches correct answer
      if (option == questions[number]['correct_answer']) {
        scores += points;
        // Update score on correct answer
      }
      // Highlight the selected and correct options
      correctAnswer = questions[number]['correct_answer'];
      nextQuestion();
    });
  }

  void startTimer() {
    // Cancel the previous timer instance if it exists
    timer?.cancel();

    counter = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        nextQuestion();
      }
    });
  }

  Future fetchQuestions() async {
    try {
      final response =
          await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));

      if (response.statusCode == 200) {
        final responseBody = response.body;

        if (responseBody.isNotEmpty) {
          final data = jsonDecode(responseBody)['results'];

          setState(() {
            questions = data;
            updateoption();
          });
        } else {
          throw Exception('Empty response body');
        }
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      rethrow;
    }
  }

  void completed() {
    if (showDialogOnce) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Results'),
            content: Text('You have scored $scores'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    showDialogOnce = false;
                  });
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }

  void nextQuestion() {
    if (number < questions.length - 1) {
      setState(() {
        selectedOption = "";
        correctAnswer = "";
        startTimer();
        number = number + 1;
        updateoption();
      });
    } else {
      completed();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuestions();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    // completed(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 410,
                child: Stack(
                  children: [
                    const CustomContainer(
                      height: 220,
                      width: 350,
                      color: primarycolor,
                    ),
                    Positioned(
                      bottom: 70,
                      left: 22,
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: secondarycolor,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${number + 1}",
                                    style: const TextStyle(
                                      color: blackcolor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${questions.length}",
                                    style: const TextStyle(
                                      color: blackcolor,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Center(
                                child: Text(
                                  "Question ${number + 1}/${questions.length}",
                                  style: const TextStyle(color: Colors.brown),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(questions.isNotEmpty
                                  ? questions[number]['question']
                                  : "loading>>>")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 200,
                      left: 130,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: secondarycolor,
                        child: Center(
                          child: Text(
                            "${counter.toString()}",
                            style: const TextStyle(
                              color: Colors.brown,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: (questions.isNotEmpty &&
                        questions[number]['incorrect_answers'] != null)
                    ? shuffleoption.map((option) {
                        Color backgroundColor = option == selectedOption
                            ? (option == correctAnswer
                                ? Colors.green
                                : Colors.red)
                            : primarycolor; // Set background color based on selection and correctness
                        return Options(
                          option: option.toString(),
                          backgroundColor: backgroundColor,
                          onTap: () => handleOptionSelection(option),
                        );
                      }).toList()
                    : [],
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  label: (number + 1) == 10 ? "see result" : "Next Question",
                  backgroundcolor: primarycolor,
                  size: const Size(100, 70),
                  action: nextQuestion,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateoption() {
    setState(() {
      shuffleoption = shuffleoptions([
        questions[number]['correct_answer'],
        ...(questions[number]['incorrect_answers'] as List)
      ]);
    });
  }

  List<String> shuffleoptions(List<String> option) {
    List<String> shuffleoption = List.from(option);
    shuffleoption.shuffle();
    return shuffleoption;
  }
}
