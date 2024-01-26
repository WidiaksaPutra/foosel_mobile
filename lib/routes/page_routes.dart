import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_guest/detail_product_guest/detail_product_guest.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_guest/menu_guest/menu_guest.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/login/login.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/message/detail_message/head_detail_message.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/message/message_list.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/register/register.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/splash_screen/splash_screen.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/bottomNav/bottom_nav.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/cart/cart_detail.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/cart/cart_history.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/cart/cart_list.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/detail_product/detail_product_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/cart/cart_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/insert_barang/button_insert/add_insert/head_insert_add_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/bottomNav/bottom_nav.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/detail_product/detail_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/insert_barang/button_insert/update_insert/head_insert_update_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/insert_barang/button_insert/update_insert/insert_update_barang.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_profile/account/head_edit_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_profile/profile.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes{
  static GoRouter pages = GoRouter(
    routes: [
      GoRoute(path: RouteName.splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(path: RouteName.homeGuest, builder: (context, state) => MenuGuest()),
      GoRoute(path: RouteName.login, builder: (BuildContext context, GoRouterState state) => Login()),
      GoRoute(path: RouteName.register, builder: (context, state) => Register()),
      GoRoute(path: RouteName.detailMessage, builder: (context, state) => DetailMessage()),
      GoRoute(path: RouteName.editProfile, builder: (context, state) => EditProfile()),
      GoRoute(path: RouteName.cartDetail, builder: (context, state) => CartDetail()),
      GoRoute(path: RouteName.cart, builder: (context, state) => Cart()),
      GoRoute(path: RouteName.listMessage, builder: (context, state) => MessageList()),
      GoRoute(path: RouteName.bottomNavPenjual, builder: (context, state) => BottomNavPenjual()),
      GoRoute(path: RouteName.bottomNavPembeli, builder: (context, state) => BottomNavPembeli()),
      GoRoute(path: RouteName.detailProductGuest, builder: (context, state) => DetailProductGuest()),
      GoRoute(path: RouteName.detailProductPenjual, builder: (context, state) => DetailProductPenjual()),
      GoRoute(path: RouteName.detailProductPembeli, builder: (context, state) => DetailProductPembeli()),
      GoRoute(path: RouteName.profile, builder: (context, state) => Profile()),
      GoRoute(path: RouteName.headAddImage, builder: (context, state) => HeadInsertAddImage()),
      GoRoute(path: RouteName.headUpdateImage, builder: (context, state) => HeadInsertUpdateImage()),
      GoRoute(path: RouteName.updateBarangPenjual, builder: (context, state) => InsertUpdateBarangPenjual()),
      GoRoute(path: RouteName.cartHistory, builder: (context, state) => CartHistory()),
    ]
  );
}