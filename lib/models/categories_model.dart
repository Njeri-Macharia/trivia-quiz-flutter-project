class Categories {
  var id;
  var name;
  var image;

  Categories({required this.id, required this.name, required this.image});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(id: json['id'], name: json['name'], image: json['image']);
  }
}
