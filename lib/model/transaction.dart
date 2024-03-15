// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class Transaksi {
    final Meta? meta;
    final List<Datum> data;

    Transaksi({
        this.meta,
        required this.data,
    });

    factory Transaksi.fromRawJson(String str) => Transaksi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? []
        : json["data"] == [] ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? []
        : data == [] ? []
        : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String? transactionsId;
    final String? usersEmailPembeli;
    final String? usersEmailPenjual;
    final String? productsId;
    final int? categoryId;
    final String? latitude;
    final String? longitude;
    final int? total;
    final int? totalPrice;
    final int? shippingPrice;
    final int? quantity;
    final String? status;
    final DateTime? deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? productsName;
    final String? productsUrlImage;
    final int? productPrice;
    final String? productsDescription;
    final String? productCategoriesName;
    final String? usersNamePenjual;
    final String? usersUsernamePenjual;
    final String? usersPhonePenjual;
    final String? usersRolesPenjual;
    final String? usersAlamatPenjual;
    final String? usersPhotoPenjual;
    final String? usersNamePembeli;
    final String? usersUsernamePembeli;
    final String? usersPhonePembeli;
    final String? usersRolesPembeli;
    final String? usersAlamatPembeli;
    final String? usersPhotoPembeli;

    Datum({
        this.transactionsId,
        this.usersEmailPembeli,
        this.usersEmailPenjual,
        this.productsId,
        this.categoryId,
        this.latitude,
        this.longitude,
        this.total,
        this.totalPrice,
        this.shippingPrice,
        this.quantity,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.productsName,
        this.productsUrlImage,
        this.productPrice,
        this.productsDescription,
        this.productCategoriesName,
        this.usersNamePenjual,
        this.usersUsernamePenjual,
        this.usersPhonePenjual,
        this.usersRolesPenjual,
        this.usersAlamatPenjual,
        this.usersPhotoPenjual,
        this.usersNamePembeli,
        this.usersUsernamePembeli,
        this.usersPhonePembeli,
        this.usersRolesPembeli,
        this.usersAlamatPembeli,
        this.usersPhotoPembeli,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        transactionsId: json["transactions_id"] == null ? "-" : json["transactions_id"].toString(),
        usersEmailPembeli: json["users_email_pembeli"] == null ? "-" : json["users_email_pembeli"].toString(),
        usersEmailPenjual: json["users_email_penjual"] == null ? "-" : json["users_email_penjual"].toString(),
        productsId: json["products_id"] == null ? "-" : json["products_id"].toString(),
        categoryId: json["category_id"] == null ? 1 : json["category_id"].toInt(),
        latitude: json["latitude"] == null ? "-" : json["latitude"].toString(),
        longitude: json["longitude"] == null ? "-" : json["longitude"].toString(),
        total: json["total"] == null ? 0 : json["total"].toInt(),
        totalPrice: json["total_price"] == null ? 0 : json["total_price"].toInt(),
        shippingPrice: json["shipping_price"] == null ? 0 : json["shipping_price"].toInt(),
        quantity: json["quantity"] == null ? 0 : json["quantity"].toInt(),
        status: json["status"] == null ? "-" : json["status"].toString(),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        productsName: json["products_name"] == null ? "-" : json["products_name"].toString(),
        productsUrlImage: json["products_urlImage"] == null ? "-" : json["products_urlImage"].toString(),
        productPrice: json["product_price"] == null ? 0 : json["product_price"].toInt(),
        productsDescription: json["products_description"] == null ? "-" : json["products_description"].toString(),
        productCategoriesName: json["product_categories_name"] == null ? "-" : json["product_categories_name"].toString(),
        usersNamePenjual: json["users_name_penjual"] == null ? "-" : json["users_name_penjual"].toString(),
        usersUsernamePenjual: json["users_username_penjual"] == null ? "-" : json["users_username_penjual"].toString(),
        usersPhonePenjual: json["users_phone_penjual"] == null ? "-" : json["users_phone_penjual"].toString(),
        usersRolesPenjual: json["users_roles_penjual"] == null ? "-" : json["users_roles_penjual"].toString(),
        usersAlamatPenjual: json["users_alamat_penjual"] == null ? "-" : json["users_alamat_penjual"].toString(),
        usersPhotoPenjual: json["users_photo_penjual"] == null ? "-" : json["users_photo_penjual"].toString(),
        usersNamePembeli: json["users_name_pembeli"] == null ? "-" : json["users_name_pembeli"].toString(),
        usersUsernamePembeli: json["users_username_pembeli"] == null ? "-" : json["users_username_pembeli"].toString(),
        usersPhonePembeli: json["users_phone_pembeli"] == null ? "-" : json["users_phone_pembeli"].toString(),
        usersRolesPembeli: json["users_roles_pembeli"] == null ? "-" : json["users_roles_pembeli"].toString(),
        usersAlamatPembeli: json["users_alamat_pembeli"] == null ? "-" : json["users_alamat_pembeli"].toString(),
        usersPhotoPembeli: json["users_photo_pembeli"] == null ? "-" : json["users_photo_pembeli"].toString(),
    
    );

    Map<String, dynamic> toJson() => {
        "transactions_id": transactionsId == null ? "-" : transactionsId.toString(),
        "users_email_pembeli": usersEmailPembeli == null ? "-" : usersEmailPembeli.toString(),
        "users_email_penjual": usersEmailPenjual == null ? "-" : usersEmailPenjual.toString(),
        "products_id": productsId == null ? "-" : productsId.toString(),
        "category_id": categoryId == null ? 1 : categoryId!.toInt(),
        "latitude": latitude == null ? "-" : latitude.toString(),
        "longitude": longitude == null ? "-" : longitude.toString(),
        "total": total == null ? 0 : total!.toInt(),
        "total_price": totalPrice == null ? 0 : totalPrice!.toInt(),
        "shipping_price": shippingPrice == null ? 0 : shippingPrice!.toInt(),
        "quantity": quantity == null ? 0 : quantity!.toInt(),
        "status": status == null ? "-" : status.toString(),
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products_name": productsName == null ? "-" : productsName.toString(),
        "products_urlImage": productsUrlImage == null ? "-" : productsUrlImage.toString(),
        "product_price": productPrice == null ? 0 : productPrice!.toInt(),
        "products_description": productsDescription == null ? "-" : productsDescription.toString(),
        "product_categories_name": productCategoriesName == null ? "-" : productCategoriesName.toString(),
        "users_name_penjual": usersNamePenjual == null ? "-" : usersNamePenjual.toString(),
        "users_username_penjual": usersUsernamePenjual == null ? "-" : usersUsernamePenjual.toString(),
        "users_phone_penjual": usersPhonePenjual == null ? "-" : usersPhonePenjual.toString(),
        "users_roles_penjual": usersRolesPenjual == null ? "-" : usersRolesPenjual.toString(),
        "users_alamat_penjual": usersAlamatPenjual == null ? "-" : usersAlamatPenjual.toString(),
        "users_photo_penjual": usersPhotoPenjual == null ? "-" : usersPhotoPenjual.toString(),
        "users_name_pembeli": usersNamePembeli == null ? "-" : usersNamePembeli.toString(),
        "users_username_pembeli": usersUsernamePembeli == null ? "-" : usersUsernamePembeli.toString(),
        "users_phone_pembeli": usersPhonePembeli == null ? "-" : usersPhonePembeli.toString(),
        "users_roles_pembeli": usersRolesPembeli == null ? "-" : usersRolesPembeli.toString(),
        "users_alamat_pembeli": usersAlamatPembeli == null ? "-" : usersAlamatPembeli.toString(),
        "users_photo_pembeli": usersPhotoPembeli == null ? "-" : usersPhotoPembeli.toString(),
    };
}

class Meta {
    final int? code;
    final String? status;
    final String? message;

    Meta({
        this.code,
        this.status,
        this.message,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"] == null ? 0 : json["code"].toInt(),
        status: json["status"] == null ? "-" : json["status"].toString(),
        message: json["message"] == null ? "-" : json["message"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? 0 : code!.toInt(),
        "status": status == null ? "-" : status.toString(),
        "message": message == null ? "-" : message.toString(),
    };
}