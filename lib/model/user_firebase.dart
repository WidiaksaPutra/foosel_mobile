// To parse this JSON data, do
//
//     final firebaseUsers = firebaseUsersFromJson(jsonString);

import 'dart:convert';

class FirebaseUsers {
    FirebaseUsers({
        this.nama,
        this.gambar,
        this.email,
        this.status,
        this.lastTime,
        this.tokenNotive,
        this.chats,
    });

    final String? nama;
    final String? gambar;
    final String? email;
    final String? status;
    final String? lastTime;
    final String? tokenNotive;
    final List<Chat>? chats;

    factory FirebaseUsers.fromRawJson(String str) => FirebaseUsers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirebaseUsers.fromJson(Map<String, dynamic> json) => FirebaseUsers(
        nama: json["nama"] == null ? "-" : json["nama"].toString(),
        gambar: json["gambar"] == null ? "-" : json["gambar"].toString(),
        email: json["email"] == null ? "-" : json["email"].toString(),
        status: json["status"] == null ? "-" : json["status"].toString(),
        lastTime: json["lastTime"] == null ? "-" : json["lastTime"].toString(),
        tokenNotive: json["token_notive"] == null ? "-" : json["token_notive"].toString(),
        chats: json["chats"] == null ? [] : 
        json["chats"] == List.empty() ? [] :
        List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama == null ? "-" : nama.toString(),
        "gambar": gambar == null ? "-" : gambar.toString(),
        "email": email == null ? "-" : email.toString(),
        "status": status == null ? "-" : status.toString(),
        "lastTime": lastTime == null ? "-" : lastTime.toString(),
        "token_notive": tokenNotive == null ? "-" : tokenNotive.toString(),
        "chats": chats == null ? [] :
        chats == List.empty() ? [] :
        List<dynamic>.from(chats!.map((x) => x.toJson())),
    };
}

class Chat {
    Chat({
        this.connection,
        this.chatId,
    });

    final String? connection;
    final String? chatId;

    factory Chat.fromRawJson(String str) => Chat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        connection: json["connection"] == null ? "-" : json["connection"].toString(),
        chatId: json["chat_id"] == null ? "-" : json["chat_id"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "connection": connection == null ? "-" : connection.toString(),
        "chat_id": chatId == null ? "-" : chatId.toString(),
    };
}
