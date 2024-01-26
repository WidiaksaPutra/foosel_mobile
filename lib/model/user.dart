// To parse this JSON data, do
//
//     final fetchProfil = fetchProfilFromJson(jsonString);
import 'dart:convert';

class Profil {
    Profil({
        this.data,
    });

    final Data? data;

    factory Profil.fromRawJson(String str) => Profil.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Profil.fromJson(Map<String, dynamic> json) => Profil(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
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

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
