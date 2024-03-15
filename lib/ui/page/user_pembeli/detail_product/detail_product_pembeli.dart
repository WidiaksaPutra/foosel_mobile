// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/page/connection/connection_basic.dart';
import 'package:foosel/ui/page/user_pembeli/detail_product/detail_body_connection_product_pembeli.dart';
import 'package:foosel/ui/page/user_pembeli/detail_product/detail_body_disconnect_product_pembeli.dart';
import 'package:foosel/ui/page/user_pembeli/detail_product/detail_bottom_navigation_bar_connection_product_pembeli.dart';

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
      bottomNavigationBar: BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
        builder: (context2, state){
          return ConnectionBasic(
            connection: connection.basicConnection, 
            childConnect: (state.jenisDetail.toString() == "AllProduct" || state.jenisDetail.toString() == "Like") 
              ? DetailBottomNavigationBarConnectionProductPembeli()
              : SizedBox(),
            childDisconnect: SizedBox(),
            buttonConnection: true,
          );
        }
      )
    );
  }
}