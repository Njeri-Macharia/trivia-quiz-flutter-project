import 'package:finalproject/constants/constant.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.get_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Userprofile extends StatelessWidget {
  Userprofile({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    // String userName = storage.read('user_name') ?? "";
    // String userEmail = storage.read('email') ?? "";

    return Scaffold(
      backgroundColor: secondarycolor,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        forceMaterialTransparency: true,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: whitecolor, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/think.png'),
                ),
                title: Text("joanbaaru@gmail.com"),
                subtitle: Text("you can update"),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: updateprofile,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: whitecolor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Dark mode'),
                    trailing: Switch(
                      value:
                          true, // You can add logic to control the switch value
                      onChanged: (value) => print(value),
                    ),
                  ),
                  ListTile(
                      title: const Text('Notifications'),
                      trailing: Switch(
                        value: true,
                        onChanged: ((value) => print(value)),
                      )),
                  const ListTile(
                    title: Text('Language'),
                    subtitle: Text('English'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(
                    thickness: .5,
                  ),
                  const ListTile(
                    title: Text('FAQ'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text('About us'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text('Terms of service'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateprofile() {
    Get.toNamed("/profile");
  }
}
