import 'dart:convert';

Experience experienceFromMap(String str) =>
    Experience.fromMap(json.decode(str));

String experienceToMap(Experience data) => json.encode(data.toMap());

class Experience {
  Experience({
    this.id,
    required this.experienceName,
    required this.experienceDetail,
    required this.experienceTime,
    required this.experienceImage,
  });

  String? id;
  final String experienceName;
  final String experienceDetail;
  final String experienceTime;
  final String experienceImage;

  factory Experience.fromMap(Map<String, dynamic> json) => Experience(
        id: json["id"],
        experienceName: json["experienceName"],
        experienceDetail: json["experienceDetail"],
        experienceTime: json["experienceTime"],
        experienceImage: json["experienceImage"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "experienceName": experienceName,
        "experienceDetail": experienceDetail,
        "experienceTime": experienceTime,
        "experienceImage": experienceImage,
      };
}
