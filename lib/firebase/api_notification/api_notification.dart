import 'dart:convert';

import 'package:foosel/firebase/api_notification/interface_insert_notification_firebase.dart';
import 'package:http/http.dart' as http;

class NotificationFirebase implements InterfaceInsertNotificationFirebase{
  @override
  Future insertNotificationFirebase({
    required String? deviceToken, 
    required String title, 
    required String body,
  }) async{
    try{
      const post = 'https://fcm.googleapis.com/fcm/send';
      final data = {
        "to": deviceToken.toString(),
        "notification": {
          "body": body,
          "title": title
        }
      };

      final headers = {
        "content-type": "application/json",
        "Authorization": "key=AAAAVxBCjgM:APA91bG_PIyI0dL7VDXpQ3soHuzPCwrfMRfC_gG7x46gIUq03o3ok7dI8lorsBR1TmtFd03w8fGPgKwJhjte6ZxNnWxlMxrVPzGpajR3uBfD14XTlr0BJr3tbBrhMljXhKjStYsDzf5v"
      };

      final response = await http.post(Uri.parse(post),
        body:  json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers,
      );

      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch (e) {
      return "error";
    }
  }
}