// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class DetailProducts {
    final Data? data;

    DetailProducts({
        this.data,
    });

    factory DetailProducts.fromRawJson(String str) => DetailProducts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailProducts.fromJson(Map<String, dynamic> json) => DetailProducts(
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
        data: json["data"] == null ? [] 
        : json["data"] == [] ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        to: json["to"] == null ? 0 : json["to"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? 0 : currentPage!.toInt(),
        "data": data == null ? [] 
        : data == [] ? []
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
    final List<Gallery>? galleries;
    final User? user;

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
        this.galleries,
        this.user,
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
        galleries: json["galleries"] == null ? [] 
        : json["galleries"] == [] ? [] 
        : List<Gallery>.from(json["galleries"]!.map((x) => Gallery.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "deleted_at": deletedAt == null ? null : deletedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "category": category == null ? null : category?.toJson(),
        "galleries": galleries == null ? []
        : galleries == [] ? []
        : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "user": user == null ? []
        : user == [] ? [] 
        : user!.toJson(),
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

class Gallery {
    final String? tokenIdGalleries;
    final String? tokenIdProduct;
    final String? url;
    final DateTime? deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Gallery({
        this.tokenIdGalleries,
        this.tokenIdProduct,
        this.url,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        tokenIdGalleries: json["token_id_galleries"] == null ? "-" : json["token_id_galleries"].toString(),
        tokenIdProduct: json["token_id_product"] == null ? "-" : json["token_id_product"].toString(),
        url: json["url"] == null ? "-" : json["url"].toString(),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "token_id_galleries": tokenIdGalleries == null ? "-" : tokenIdGalleries.toString(),
        "token_id_product": tokenIdProduct == null ? "-" : tokenIdProduct.toString(),
        "url": url == null ? "-" : url.toString(),
        "deleted_at": deletedAt == null ? null : deletedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? username;
    final String? phone;
    final String? roles;
    final String? alamat;
    final String? emailVerifiedAt;
    final String? twoFactorConfirmedAt;
    final String? currentTeamId;
    final String? profilePhotoPath;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? profilePhotoUrl;

    User({
        this.id,
        this.name,
        this.email,
        this.username,
        this.phone,
        this.roles,
        this.alamat,
        this.emailVerifiedAt,
        this.twoFactorConfirmedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.profilePhotoUrl,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? 0 : json["id"].toInt(),
        name: json["name"] == null ? "-" : json["name"].toString(),
        email: json["email"] == null ? "-" : json["email"].toString(),
        username: json["username"] == null ? "-" : json["username"].toString(),
        phone: json["phone"] == null ? "-" : json["phone"].toString(),
        roles: json["roles"] == null ? "-" : json["roles"].toString(),
        alamat: json["alamat"] == null ? "-" : json["alamat"].toString(),
        emailVerifiedAt: json["email_verified_at"] == null ? "-" : json["email_verified_at"].toString(),
        twoFactorConfirmedAt: json["two_factor_confirmed_at"] == null ? "-" : json["two_factor_confirmed_at"].toString(),
        currentTeamId: json["current_team_id"] == null ? "-" : json["current_team_id"].toString(),
        profilePhotoPath: json["profile_photo_path"] == null ? "-" : json["profile_photo_path"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] == null ? "-" : json["profile_photo_url"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? 0 : id!.toInt(),
        "name": name == null ? "-" : name.toString(),
        "email": email == null ? "-" : email.toString(),
        "username": username == null ? "-" : username.toString(),
        "phone": phone == null ? "-" : phone.toString(),
        "roles": roles == null ? "-" : roles.toString(),
        "alamat": alamat == null ? "-" : alamat.toString(),
        "email_verified_at": emailVerifiedAt == null ? "-" : emailVerifiedAt.toString(),
        "two_factor_confirmed_at": twoFactorConfirmedAt == null ? "-" : twoFactorConfirmedAt.toString(),
        "current_team_id": currentTeamId == null ? "-" : currentTeamId.toString(),
        "profile_photo_path": profilePhotoPath == null ? "-" : profilePhotoPath.toString(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "profile_photo_url": profilePhotoUrl == null ? "-" : profilePhotoUrl.toString(),
    };
}