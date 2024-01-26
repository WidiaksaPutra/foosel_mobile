// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/main/firebase_init.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/size_device.dart';

class MainScreen extends StatelessWidget with sizeDevice{
  MainScreen({Key? key}) : super(key: key);
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    late Size size = MediaQuery.of(context).size;
    late double screenW = size.width;
    late double screenH = size.height;
    return ScreenUtilInit(
      designSize: Size(screenW , screenH),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) =>
      FirebaseInit(
        initialization: initialization,
      ),
    );
  }
}