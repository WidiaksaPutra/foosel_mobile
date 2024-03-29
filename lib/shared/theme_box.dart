import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';

class ThemeBox with SizeDevice{
  // radius
  static late double defaultRadius12 = 12.0.r;
  static late double defaultRadius20 = 20.0.r;
  static late double defaultRadius8 = 8.0.r;
  static late double defaultRadius5 = 5.0.r;
  static late double defaultRadius50 = 50.0.r;
  static late double defaultRadius10 = 10.0.r;
  static late double defaultRadius24 = 24.0.r;
  static late double defaultRadius4 = 4.0.r;
  static late double defaultRadius6 = 6.0.r;
  static late double defaultRadius30 = 30.0.r;
  static late double defaultRadius15 = 15.0.r;

  //height
  static late double defaultHeightBox50;
  static late double defaultHeightBox25;
  static late double defaultHeightBox292;
  static late double defaultHeightBox120x3;
  static late double defaultHeightBox120;
  static late double defaultHeightBox278;
  static late double defaultHeightBox6;
  static late double defaultHeightBox215;
  static late double defaultHeightBox44;
  static late double defaultHeightBox200;
  static late double defaultHeightBox90;
  static late double defaultHeightBox70;
  static late double defaultHeightBox67;
  static late double defaultHeightBox54;
  static late double defaultHeightBox84;
  static late double defaultHeightBox60;
  static late double defaultHeightBox34;
  static late double defaultHeightBox64;
  static late double defaultHeightBox124;
  static late double defaultHeightBox20;
  static late double defaultHeightBox16;
  static late double defaultHeightBox12;
  static late double defaultHeightBox30;
  static late double defaultHeightBox14;
  static late double defaultHeightBox13;
  static late double defaultHeightBox100;
  static late double defaultHeightBox24;
  static late double defaultHeightBox80;
  static late double defaultHeightBox10;
  static late double defaultHeightBox11;
  static late double defaultHeightBox62;
  static late double defaultHeightBox22;
  static late double defaultHeightBox340;
  static late double defaultHeightBox4;
  static late double defaultHeightBox17;
  static late double defaultHeightBox46;
  static late double defaultHeightBox19;
  static late double defaultHeightBox2;
  static late double defaultHeightBox33;
  static late double defaultHeightBox32;
  static late double defaultHeightBox8;
  static late double defaultHeightBox5;
  static late double defaultHeightBox150;
  static late double defaultHeightBox250;
  static late double defaultHeightBox40;
  static late double defaultHeightBox300;
  static late double defaultHeightBox140;
  static late double defaultHeightBox170;

  //width
  static late double defaultWidthBox152;
  static late double defaultWidthBox70;
  static late double defaultWidthBox54;
  static late double defaultWidthBox6;
  static late double defaultWidthBox60;
  static late double defaultWidthBox34;
  static late double defaultWidthBox120;
  static late double defaultWidthBox215;
  static late double defaultWidthBox64;
  static late double defaultWidthBox20;
  static late double defaultWidthBox12;
  static late double defaultWidthBox30;
  static late double defaultWidthBox14;
  static late double defaultWidthBox18;
  static late double defaultWidthBox100;
  static late double defaultWidthBox16;
  static late double defaultWidthBox10;
  static late double defaultWidthBox40;
  static late double defaultWidthBox90;
  static late double defaultWidthBox4;
  static late double defaultWidthBox23;
  static late double defaultWidthBox76;
  static late double defaultWidthBox24;
  static late double defaultWidthBox46;
  static late double defaultWidthBox13;
  static late double defaultWidthBox62;
  static late double defaultWidthBox8;
  static late double defaultWidthBox45;
  static late double defaultWidthBox38;
  static late double defaultWidthBox130;
  static late double defaultWidthBox19;
  static late double defaultWidthBox5;
  static late double defaultWidthBox2;
  static late double defaultWidthBox0;
  static late double defaultWidthBox1;
  static late double defaultWidthBox05;
  static late double defaultWidthBox80;
  static late double defaultWidthBox50;
  static late double defaultWidthBox02;
  static late double defaultWidthBox35;
  static late double defaultWidthBox22;
  static late double defaultWidthBox1_5;

  ThemeBox(BuildContext context){
    getsizeDevice(context);
    //height
    defaultHeightBox50 = getHaight(50.0).h;
    defaultHeightBox25 = getHaight(25.0).h;
    defaultHeightBox292 = getHaight(292.0).h;
    defaultHeightBox120x3 = getHaight(120.0 * 3.0).h;
    defaultHeightBox120 = getHaight(120.0).h;
    defaultHeightBox278 = getHaight(278.0).h;
    defaultHeightBox6 = getHaight(6.0).h;
    defaultHeightBox215 = getHaight(215.0).h;
    defaultHeightBox44 = getHaight(44.0).h;
    defaultHeightBox200 = getHaight(200.0).h;
    defaultHeightBox90 = getHaight(90.0).h;
    defaultHeightBox70 = getHaight(70.0).h;
    defaultHeightBox67 = getHaight(67.0).h;
    defaultHeightBox54 = getHaight(54.0).h;
    defaultHeightBox84 = getHaight(84.0).h;
    defaultHeightBox60 = getHaight(60.0).h;
    defaultHeightBox34 = getHaight(34.0).h;
    defaultHeightBox64 = getHaight(64.0).h;
    defaultHeightBox124 = getHaight(124.0).h;
    defaultHeightBox20 = getHaight(20.0).h;
    defaultHeightBox16 = getHaight(16.0).h;
    defaultHeightBox12 = getHaight(12.0).h;
    defaultHeightBox30 = getHaight(30.0).h;
    defaultHeightBox14 = getHaight(14.0).h;
    defaultHeightBox13 = getHaight(13.0).h;
    defaultHeightBox100 = getHaight(100.0).h;
    defaultHeightBox24 = getHaight(24.0).h;
    defaultHeightBox80 = getHaight(80.0).h;
    defaultHeightBox10 = getHaight(10.0).h;
    defaultHeightBox11 = getHaight(11.0).h;
    defaultHeightBox62 = getHaight(62.0).h;
    defaultHeightBox22 = getHaight(22.0).h;
    defaultHeightBox340 = getHaight(340.0).h;
    defaultHeightBox4 = getHaight(4.0).h;
    defaultHeightBox17 = getHaight(17.0).h;
    defaultHeightBox46 = getHaight(46.0).h;
    defaultHeightBox19 = getHaight(19.0).h;
    defaultHeightBox2 = getHaight(2.0).h;
    defaultHeightBox33 = getHaight(33.0).h;
    defaultHeightBox32 = getHaight(32.0).h;
    defaultHeightBox8 = getHaight(8.0).h;
    defaultHeightBox5 = getHaight(5.0).h;
    defaultHeightBox150 = getHaight(150.0).h;
    defaultHeightBox250 = getHaight(250.0).h;
    defaultHeightBox40 = getHaight(40.0).h;
    defaultHeightBox300 = getHaight(300.0).h;
    defaultHeightBox140 = getHaight(140.0).h;
    defaultHeightBox170 = getHaight(170.0).h;
    //width
    defaultWidthBox152 = getWidth(152.0).w;
    defaultWidthBox70 = getWidth(70.0).w;
    defaultWidthBox54 = getWidth(54.0).w;
    defaultWidthBox6 = getWidth(6.0).w;
    defaultWidthBox60 = getWidth(60.0).w;
    defaultWidthBox34 = getWidth(34.0).w;
    defaultWidthBox120 = getWidth(120.0).w;
    defaultWidthBox215 = getWidth(215.0).w;
    defaultWidthBox64 = getWidth(64.0).w;
    defaultWidthBox20 = getWidth(20.0).w;
    defaultWidthBox12 = getWidth(12.0).w;
    defaultWidthBox30 = getWidth(30.0).w;
    defaultWidthBox14 = getWidth(14.0).w;
    defaultWidthBox18 = getWidth(18.0).w;
    defaultWidthBox100 = getWidth(100.0).w;
    defaultWidthBox16 = getWidth(16.0).w;
    defaultWidthBox10 = getWidth(10.0).w;
    defaultWidthBox40 = getWidth(40.0).w;
    defaultWidthBox90 = getWidth(90.0).w;
    defaultWidthBox4 = getWidth(4.0).w;
    defaultWidthBox23 = getWidth(23.0).w;
    defaultWidthBox76 = getWidth(76.0).w;
    defaultWidthBox24 = getWidth(24.0).w;
    defaultWidthBox46 = getWidth(46.0).w;
    defaultWidthBox13 = getWidth(13.0).w;
    defaultWidthBox62 = getWidth(62.0).w;
    defaultWidthBox8 = getWidth(8.0).w;
    defaultWidthBox45 = getWidth(45.0).w;
    defaultWidthBox38 = getWidth(38.0).w;
    defaultWidthBox130 = getWidth(130.0).w;
    defaultWidthBox19 = getWidth(19.0).w;
    defaultWidthBox5 = getWidth(5.0).w;
    defaultWidthBox2 = getWidth(2.0).w;
    defaultWidthBox0 = getWidth(0.0).w;
    defaultWidthBox1 = getWidth(1.0).w;
    defaultWidthBox05 = getWidth(0.5).w;
    defaultWidthBox80 = getWidth(80.0).w;
    defaultWidthBox50 = getWidth(50.0).w;
    defaultWidthBox02 = getWidth(2.0).w;
    defaultWidthBox35 = getWidth(35.0).w;
    defaultWidthBox22 = getWidth(22.0).w;
    defaultWidthBox1_5 = getWidth(1.5).w;
  }
}