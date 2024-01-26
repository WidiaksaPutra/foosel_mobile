// To parse this JSON data, do
//
//     final firebaseMessage = firebaseMessageFromJson(jsonString);

import 'dart:convert';

class FirebaseMessage {
    final bool? isRead;
    final String? penerima;
    final String? pengirim;
    final String? pesan;
    final String? time;

    FirebaseMessage({
        this.isRead,
        this.penerima,
        this.pengirim,
        this.pesan,
        this.time,
    });

    factory FirebaseMessage.fromRawJson(String str) => FirebaseMessage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirebaseMessage.fromJson(Map<String, dynamic> json) => FirebaseMessage(
        isRead: json["isRead"],
        penerima: json["penerima"] == null ? "-" : json["penerima"].toString(),
        pengirim: json["pengirim"] == null ? "-" : json["pengirim"].toString(),
        pesan: json["pesan"] == null ? "-" : json["pesan"].toString(),
        time: json["time"] == null ? "-" : json["time"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "isRead": isRead,
        "penerima": penerima == null ? "-" : penerima.toString(),
        "pengirim": pengirim == null ? "-" : pengirim.toString(),
        "pesan": pesan == null ? "-" : pesan.toString(),
        "time": time == null ? "-" : time.toString(),
    };
}
