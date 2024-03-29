import 'package:flutter/material.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:go_router/go_router.dart';

class FloatingButtonNav extends StatelessWidget {
  const FloatingButtonNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        context.go(RouteName.cart);
      },
      backgroundColor: kBlueColor2,
      child: Image.asset(
        "asset/icon/cart_Icon.png",
        width: 20.0,
        height: 22.0,
      ),
    );
  }
}