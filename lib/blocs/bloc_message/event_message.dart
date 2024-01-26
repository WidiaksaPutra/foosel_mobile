import 'package:flutter/material.dart';

mixin DataEventMessage{}

class DataEventPostMessage with DataEventMessage{
  final String tokenPenerima;
  late String message;
  DataEventPostMessage({required this.message, required this.tokenPenerima}){
    if(message == "null"){
      message = "";
    }
  }
}