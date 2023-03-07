import 'dart:convert';

Social socialFromMap(String str) => Social.fromMap(json.decode(str));

String socialToMap(Social data) => json.encode(data.toMap());

class Social {
  Social({
    required this.githubLink,
    required this.gmailLink,
    required this.instagramLink,
    required this.linkdinLink,
  });

  final String githubLink;
  final String gmailLink;
  final String instagramLink;
  final String linkdinLink;

  factory Social.fromMap(Map<String, dynamic> json) => Social(
        githubLink: json["githubLink"],
        gmailLink: json["gmailLink"],
        instagramLink: json["instagramLink"],
        linkdinLink: json["linkdinLink"],
      );

  Map<String, dynamic> toMap() => {
        "githubLink": githubLink,
        "gmailLink": gmailLink,
        "instagramLink": instagramLink,
        "linkdinLink": linkdinLink,
      };
}
