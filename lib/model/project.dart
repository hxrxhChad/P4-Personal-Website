import 'dart:convert';

Project projectFromMap(String str) => Project.fromMap(json.decode(str));

String projectToMap(Project data) => json.encode(data.toMap());

class Project {
  Project({
    this.id,
    required this.projectName,
    required this.projectDesc,
    required this.projectImage,
  });

  String? id;
  final String projectName;
  final String projectDesc;
  final String projectImage;

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        projectName: json["projectName"],
        projectDesc: json["projectDesc"],
        projectImage: json["projectImage"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "projectName": projectName,
        "projectDesc": projectDesc,
        "projectImage": projectImage,
      };
}
