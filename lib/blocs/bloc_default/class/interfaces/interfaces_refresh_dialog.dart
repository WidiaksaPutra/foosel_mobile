import 'package:flutter/material.dart';

abstract class InterfacesRefreshDialog{
  void basicRefresh({
    required BuildContext context,
    required VoidCallback onTap,
  });
}