// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/detail_product/detail_body_connection_product_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/detail_product/detail_body_disconnect_product_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/detail_product/detail_bottom_navigation_bar_connection_product_pembeli.dart';

class DetailProductPembeli extends StatelessWidget{
  DetailProductPembeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassConnectionDialog connection = ClassConnectionDialog();
    return Scaffold(
      backgroundColor: kGreyColor6,
      body: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBodyConnectionProductPembeli(), 
        childDisconnect: DetailBodyDisconnectProductPembeli(),
        buttonConnection: true,
      ),
      bottomNavigationBar: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBottomNavigationBarConnectionProductPembeli(), 
        childDisconnect: SizedBox(),
        buttonConnection: true,
      ),
    );
  }
}