import 'dart:convert';

Basic basicFromMap(String str) => Basic.fromMap(json.decode(str));

String basicToMap(Basic data) => json.encode(data.toMap());

class Basic {
  Basic({
    required this.image,
    required this.name,
    required this.age,
    required this.city,
    required this.state,
    required this.slogan,
    required this.bio,
  });

  final String image;
  final String name;
  final String age;
  final String city;
  final String state;
  final String slogan;
  final String bio;

  factory Basic.fromMap(Map<String, dynamic> json) => Basic(
        image: json["image"],
        name: json["name"],
        age: json["age"],
        city: json["city"],
        state: json["state"],
        slogan: json["slogan"],
        bio: json["bio"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "name": name,
        "age": age,
        "city": city,
        "state": state,
        "slogan": slogan,
        "bio": bio,
      };
}
