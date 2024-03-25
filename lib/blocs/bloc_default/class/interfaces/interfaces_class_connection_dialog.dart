import 'package:flutter/material.dart';

abstract class InterfacesClassConnectionDialog{
  void basicConnection({
    required BuildContext context,
    required VoidCallback onTap,
    required bool buttonConnection,
  });
}