// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';
import 'package:foosel/main/firebase_init.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget with SizeDevice{
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
      builder: (context, _) => FirebaseInit(
        initialization: initialization,
      ),
    );
  }
}