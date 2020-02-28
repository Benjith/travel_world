// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int id;
    String username;
    String fullname;
    int phone;
    String email;
    String password;

    UserModel({
        this.id,
        this.username,
        this.fullname,
        this.phone,
        this.email,
        this.password,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        // "id": id == null ? null : id,
        "username": username == null ? null : username,
        "fullname": fullname == null ? null : fullname,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
    };
}
