// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/page/home_up/home_up_button.dart';
import 'package:foosel/ui/page/home_up/home_up_profile.dart';
import 'package:foosel/ui/page/user_penjual/home_menu_user/body_home_menu.dart';
import 'package:foosel/ui/page/user_penjual/home_menu_user/body_home_menu_klasifikasi.dart';
import 'package:foosel/ui/widgets/componen_carousel_slider_image_sliver.dart';

class HomeMenuUser extends StatelessWidget{
  HomeMenuUser({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: ThemeBox.defaultHeightBox90,
            bottom: PreferredSize( 
              preferredSize: Size.fromHeight(0),
              child: Container(
                height: ThemeBox.defaultHeightBox80,
                padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20, horizontal: ThemeBox.defaultWidthBox20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ThemeBox.defaultRadius30),
                    topRight: Radius.circular(ThemeBox.defaultRadius30),
                  ),
                ),
                child: HomeUpButton(),
              ),
            ),
            pinned: true,
            backgroundColor: kPrimaryColor,
            expandedHeight: ThemeBox.defaultHeightBox200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ComponenCarouselSliderImageSliver(
                    connect: false,
                    imageProduct: coverFoosel,
                  ),
                  HomeUpProfile(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<CubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
              => (stateDesign.currentBody == 0) 
              ? BodyHomeMenu() 
              : BodyHomeMenuKlasifikasi(),
            ),
          ),
        ],
      ),
    );
  }
}