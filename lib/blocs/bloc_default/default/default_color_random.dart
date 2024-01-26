import 'package:flutter/material.dart';
import 'dart:math' as math;

mixin colorRandom{
  late String colorData;
  prosesColorRandom() async{
    String colorRandom = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0).toString();
    List<String> colorSplit = colorRandom.split(RegExp(r'[()]'));
    List<String> colorSplit2 = colorSplit[1].split('0xff');
    if(colorSplit2[1].toUpperCase() == 'FFFFFF' || colorSplit2[1].toUpperCase() == '000000'){
      prosesColorRandom();
    }
    colorData = colorSplit2[1].toUpperCase();
  }
}