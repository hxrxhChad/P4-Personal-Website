import 'dart:convert';

Message messageFromMap(String str) => Message.fromMap(json.decode(str));

String messageToMap(Message data) => json.encode(data.toMap());

class Message {
  Message({
    this.id,
    required this.name,
    required this.email,
    required this.message,
  });

  String? id;
  final String name;
  final String email;
  final String message;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "message": message,
      };
}
