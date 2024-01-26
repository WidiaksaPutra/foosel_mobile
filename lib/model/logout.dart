import 'dart:convert';

Logout logoutUserFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutUserToJson(Logout data) => json.encode(data.toJson());

class Logout {
    final Meta? meta;
    final String? data;

    Logout({
        this.meta,
        this.data,
    });

    factory Logout.fromRawJson(String str) => Logout.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Logout.fromJson(Map<String, dynamic> json) => Logout(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data,
    };
}

class Meta {
    final int? code;
    final String? status;
    final dynamic message;

    Meta({
        this.code,
        this.status,
        this.message,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
    };
}