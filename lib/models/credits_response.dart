// To parse this JSON data, do
//
//     final creditResponse = creditResponseFromMap(jsonString);

import 'dart:convert';

class CreditResponse {
  CreditResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditResponse.fromJson(String str) =>
      CreditResponse.fromMap(json.decode(str));

  factory CreditResponse.fromMap(Map<String, dynamic> json) => CreditResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    this.department,
    required this.job,
  });

  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String character;
  String creditId;
  int order;
  String? department;
  String? job;

  get fullProfilePath {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    } else {
      return 'https://via.placeholder.com/300x400';
    }
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] ?? 'null',
        castId: json["cast_id"] ?? 0,
        character: json["character"] ?? 'null',
        creditId: json["credit_id"],
        order: json["order"] ?? 0,
        department: json["department"] == null ? null : '0',
        job: json["job"] == null ? null : '0',
      );
}
