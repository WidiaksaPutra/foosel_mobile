// ignore_for_file: must_be_immutable, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/cubit_connection_name_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/size_device.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_menu_user/body_home_menu.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_menu_user_klasifikasi/body_home_menu_klasifikasi.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_up/home_up_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_head_home_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class MenuGuest extends HookWidget with sizeDevice{
  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    context.read<cubitConnectionBasic>().connectCheck(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: BlocBuilder<cubitConnectionBasic, DataStateConnection>(
          builder:(context, state) => (state.connectionBoolean == true)
          ? Container(
              margin: EdgeInsets.only(left: themeBox.defaultWidthBox30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: themeBox.defaultHeightBox30),
                    child: ComponenHeadHomeMenu(
                      search: () {}, 
                      button: (){
                        context.go(RouteName.login);
                        cubitUpButton().close();
                        BlocNameCategoriesConnect().close();
                        BlocNameCategoriesDisconnect().close();
                        cubitConnectionNameCategories().close();
                      },
                    ),
                  ),
                  HomeUpButton(),
                  Expanded(
                    child: BlocBuilder<cubitUpButton, dynamic>(builder: (context, stateDesign) 
                      => (stateDesign.currentBody == 0) 
                      ? BodyHomeMenu(hightListView: sizeHeight-themeBox.defaultHeightBox250) 
                      : BodyHomeMenuKlasifikasi(hightListView: sizeHeight-themeBox.defaultHeightBox250),
                    ),  
                  ),
                ],
              ),
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'asset/animations/vektor_search_lottie.json',
                height: themeBox.defaultHeightBox340,
              ),
              Text("device tidak terkoneksi ke internet...", style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: 14)),
              SizedBox(height: themeBox.defaultHeightBox12,),
              Row(
                children: [
                  SizedBox(width: themeBox.defaultWidthBox10,),
                  Expanded(
                    child: ComponenBasicButton(
                      content: Text("Login", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)), 
                      primaryColor: kPurpleColor,
                      secondaryColor: kBlueColor,
                      borderRadius: themeBox.defaultRadius8, 
                      paddingVertical: themeBox.defaultHeightBox5,
                      onPressed: () => context.go(RouteName.login), 
                    ),
                  ),
                  SizedBox(width: themeBox.defaultWidthBox10,),
                ],
              ),
            ],),
        ),
      ),
    );
  }
}