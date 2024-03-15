// To parse this JSON data, do
//
//     final firebaseChats = firebaseChatsFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class FirebaseChats {
    FirebaseChats({
        required this.connection,
        this.totalChats,
        this.totalRead,
        this.totalUnread,
        required this.chat,
        this.lastTime,
    });

    final List<dynamic> connection;
    final int? totalChats;
    final int? totalRead;
    final int? totalUnread;
    final List<dynamic> chat;
    final String? lastTime;

    factory FirebaseChats.fromRawJson(String str) => FirebaseChats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirebaseChats.fromJson(Map<String, dynamic> json) => FirebaseChats(
        connection: json["connection"] == null ? [] : 
        json["connection"] == null ? List.empty() :
        List<dynamic>.from(json["connection"].map((x) => x)),
        totalChats: json["total_chats"] == null ? 0 : json["total_chats"].toInt(),
        totalRead: json["total_read"] == null ? 0 : json["total_read"].toInt(),
        totalUnread: json["total_unread"] == null ? 0 : json["total_unread"].toInt(),
        chat: json["chat"] == null ? [] : 
        json["chat"] == List.empty() ? [] :
        List<dynamic>.from(json["chat"].map((x) => x)),
        lastTime: json["lastTime"] == null ? "-" : json["lastTime"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "connection": connection == null ? [] : 
        connection == List.empty() ? [] :
        List<dynamic>.from(connection.map((x) => x)),
        "total_chats": totalChats == null ? 0 : totalChats!.toInt(),
        "total_read": totalRead == null ? 0 : totalRead!.toInt(), 
        "total_unread": totalUnread == null ? 0 : totalUnread!.toInt(),
        "chat": chat == null ? [] :
        chat == List.empty() ? [] :
        List<dynamic>.from(chat.map((x) => x)),
        "lastTime": lastTime == null ? "-" : lastTime.toString(),
    };
}
