// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class Categories {
    final Data? data;

    Categories({
        this.data,
    });

    factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    final List<Datum> data;
    final int? total;

    Data({
        required this.data,
        this.total,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null ? []
        : json["data"] == [] ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? 0 : json["total"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? []
        : data == [] ? []
        : List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total == null ? 0 : total!.toInt(),
    };
}

class Datum {
    final int? id;
    final String? name;
    final DateTime? deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.name,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? 0 : json["id"].toInt(),
        name: json["name"] == null ? "-" : json["name"].toString(),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id!.toInt(),
        "name": name == null ? "-" : name.toString(),
        "deleted_at": deletedAt == null ? null : deletedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    };
}