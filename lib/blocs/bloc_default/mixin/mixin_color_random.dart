import 'package:flutter/material.dart';
import 'dart:math' as math;

mixin ColorRandom{
  late String colorData;
  void prosesColorRandom(){
    String _colorRandom = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0).toString();
    List<String> _colorSplit = _colorRandom.split(RegExp(r'[()]'));
    List<String> _colorSplit2 = _colorSplit[1].split('0xff');
    if(_colorSplit2[1].toUpperCase() == 'FFFFFF' || _colorSplit2[1].toUpperCase() == '000000'){
      prosesColorRandom();
    }
    colorData = _colorSplit2[1].toUpperCase();
  }
}