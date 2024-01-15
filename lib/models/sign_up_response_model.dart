import 'dart:convert';

SignUpResponseModel signUpModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  final String? id;
  final String name;
  final String email;
  final String gender;
  final String status;

  SignUpResponseModel({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id" : id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}
