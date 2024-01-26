import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FloatingButtonNav extends StatelessWidget {
  const FloatingButtonNav({Key? key}) : super(key: key);

  void closeBloc() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('emailPenerima');
  }

  @override
  Widget build(BuildContext context) {
    closeBloc();
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