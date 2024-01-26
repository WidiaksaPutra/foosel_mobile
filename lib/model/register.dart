import 'dart:convert';

Register registerUserFromJson(String str) => Register.fromJson(json.decode(str));

String registerUserToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        this.meta,
        this.data,
    });

    final Meta? meta;
    final Data? data;

    factory Register.fromRawJson(String str) => Register.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta == null ? "-" : meta!.toJson(),
        "data": data == null ? "-" : data!.toJson(),
    };
}

class Data {
    Data({
        this.accessToken,
        this.typeToken,
        this.user,
    });

    final String? accessToken;
    final String? typeToken;
    final User? user;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"] == null ? "-" : json["access_token"].toString(),
        typeToken: json["type_token"] == null ? "-" : json["type_token"].toString(),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? "-" : accessToken.toString(),
        "type_token": typeToken == null ? "-" : typeToken.toString(),
        "user": user == null ? null : user!.toJson(),
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.alamat,
        this.username,
        this.phone,
        this.roles,
        this.emailVerifiedAt,
        this.twoFactorConfirmedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.profilePhotoUrl,
    });

    final int? id;
    final String? name;
    final String? email;
    final String? alamat;
    final String? username;
    final String? phone;
    final String? roles;
    final String? emailVerifiedAt;
    final String? twoFactorConfirmedAt;
    final String? currentTeamId;
    final String? profilePhotoPath;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? profilePhotoUrl;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? 0 : json["id"].toInt(),
        name: json["name"] == null ? "-" : json["name"].toString(),
        email: json["email"] == null ? "-" : json["email"].toString(),
        alamat: json["alamat"] == null ? "-" : json["alamat"].toString(),
        username: json["username"] == null ? "-" : json["username"].toString(),
        phone: json["phone"] == null ? "-" : json["phone"].toString(),
        roles: json["roles"] == null ? "-" : json["roles"].toString(),
        emailVerifiedAt: json["email_verified_at"] == null ? "-" : json["email_verified_at"].toString(),
        twoFactorConfirmedAt: json["two_factor_confirmed_at"] == null ? "-" : json["two_factor_confirmed_at"].toString(),
        currentTeamId: json["current_team_id"] == null ? "-" : json["current_team_id"].toString(),
        profilePhotoPath: json["profile_photo_path"] == null ? "-" : json["profile_photo_path"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] == null ? "-" : json["profile_photo_url"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id?.toInt(),
        "name": name == null ? "-" : name.toString(),
        "email": email == null ? "-" : email.toString(),
        "alamat": alamat == null ? "-" : alamat.toString(),
        "username": username == null ? "-" : username.toString(),
        "phone": phone == null ? "-" : phone.toString(),
        "roles": roles == null ? "-" : roles.toString(),
        "email_verified_at": emailVerifiedAt == null ? "-" : emailVerifiedAt.toString(),
        "two_factor_confirmed_at": twoFactorConfirmedAt == null ? "-" : twoFactorConfirmedAt.toString(),
        "current_team_id": currentTeamId == null ? "-" : currentTeamId.toString(),
        "profile_photo_path": profilePhotoPath == null ? "-" : profilePhotoPath.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "profile_photo_url": profilePhotoUrl == null ? "-" : profilePhotoUrl.toString(),
    };
}

class Meta {
    Meta({
        this.code,
        this.status,
        this.message,
    });

    final int? code;
    final String? status;
    final String? message;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"] == null ? 0 : json["code"].toInt(),
        status: json["status"] == null ? "-" : json["status"].toString(),
        message: json["message"] == null ? "-" : json["message"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? 0 : code?.toInt(),
        "status": status == null ? "-" : status.toString(),
        "message": message == null ? "-" : message.toString(),
    };
}