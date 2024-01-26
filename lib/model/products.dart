// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class Products {
    final Data? data;

    Products({
        this.data,
    });

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    final int? currentPage;
    final List<Datum> data;
    final int? to;

    Data({
        this.currentPage,
        required this.data,
        this.to,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? 0 : json["current_page"].toInt(),
        data: json["data"] == [] ? [] 
          : json["data"] == null ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        to: json["to"] == null ? 0 : json["to"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? 0 : currentPage!.toInt(),
        "data": data == [] ? [] 
          : data == null ? []
          : List<dynamic>.from(data.map((x) => x.toJson())),
        "to": to == null ? 0 : to!.toInt(),
    };
}

class Datum {
    final String? tokenId;
    final String? email;
    final String? name;
    final int? price;
    final String? description;
    final String? urlImage;
    final String? tags;
    final int? categoriesId;
    final DateTime? deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Category? category;

    Datum({
        this.tokenId,
        this.email,
        this.name,
        this.price,
        this.description,
        this.urlImage,
        this.tags,
        this.categoriesId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.category,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tokenId: json["token_id"] == null ? "-" : json["token_id"].toString(),
        email: json["email"] == null ? "-" : json["email"].toString(),
        name: json["name"] == null ? "-" : json["name"].toString(),
        price: json["price"] == null ? 0 : json["price"].toInt(),
        description: json["description"] == null ? "-" : json["description"].toString(),
        urlImage: json["url_image"] == null ? "-" : json["url_image"].toString(),
        tags: json["tags"] == null ? "-" : json["tags"].toString(),
        categoriesId: json["categories_id"] == null ? 0 : json["categories_id"].toInt(),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "token_id": tokenId == null ? "-" : tokenId.toString(),
        "email": email == null ? "-" : email.toString(),
        "name": name == null ? "-" : name.toString(),
        "price": price == null ? 0 : price!.toInt(),
        "description": description == null ? "-" : description.toString(),
        "url_image": urlImage == null ? "-" : urlImage.toString(),
        "tags": tags == null ? "-" : tags.toString(),
        "categories_id": categoriesId == null ? 0 : categoriesId!.toInt(),
        "deleted_at": deletedAt == null ? null :deletedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "category": category == null ? null : category?.toJson(),
    };
}

class Category {
    final int? id;
    final String? name;
    final DateTime? deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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