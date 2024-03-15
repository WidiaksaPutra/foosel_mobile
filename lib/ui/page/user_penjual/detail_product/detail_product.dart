// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/page/connection/connection_basic.dart';
import 'package:foosel/ui/page/user_penjual/detail_product/detail_body_connection_product_penjual.dart';
import 'package:foosel/ui/page/user_penjual/detail_product/detail_body_disconnect_product_penjual.dart';
import 'package:foosel/ui/page/user_penjual/detail_product/detail_bottom_navigation_bar_connection_product_penjual.dart';

class DetailProductPenjual extends StatelessWidget{
  DetailProductPenjual({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ClassConnectionDialog connection = ClassConnectionDialog(); 
    return Scaffold(
      backgroundColor: kGreyColor6,
      body: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBodyConnectionProductPenjual(), 
        childDisconnect: DetailBodyDisconnectProductPenjual(),
        buttonConnection: true,
      ),
      bottomNavigationBar: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBottomNavigationBarConnectionProductPenjual(), 
        childDisconnect: SizedBox(),
        buttonConnection: true,
      ),
    );
  }
}