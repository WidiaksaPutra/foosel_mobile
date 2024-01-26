import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/size_device.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_menu_user/body_home_menu.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_menu_user_klasifikasi/body_home_menu_klasifikasi.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_up/home_up_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_up/home_up_profile.dart';

class HomeMenuUser extends StatelessWidget with sizeDevice{
  HomeMenuUser({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getsizeDevice(context);
    return Container(
      margin: EdgeInsets.only(left: themeBox.defaultWidthBox30),
      child: SafeArea(
        child: Column(
          children: [
            HomeUpProfile(),
            HomeUpButton(),
            Expanded(
              child: BlocBuilder<cubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
                => (stateDesign.currentBody == 0) 
                ? BodyHomeMenu(hightListView: sizeHeight-themeBox.defaultHeightBox340,) 
                : BodyHomeMenuKlasifikasi(hightListView: sizeHeight-themeBox.defaultHeightBox340,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}