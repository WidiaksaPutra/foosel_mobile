// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:foosel/blocs/bloc_default/default/size_device.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/page/home_up/home_up_button.dart';
import 'package:foosel/ui/page/home_up/home_up_profile.dart';
import 'package:foosel/ui/page/user_penjual/home_menu_user/body_home_menu.dart';
import 'package:foosel/ui/page/user_penjual/home_menu_user/body_home_menu_klasifikasi.dart';
import 'package:foosel/ui/widgets/componen_carousel_slider_image_sliver.dart';

class HomeMenuUser extends StatelessWidget with sizeDevice{
  HomeMenuUser({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeBox(context);
    getsizeDevice(context);
    late double heightPage = sizeHeight;
    if(heightPage < 0.0){heightPage = 0.0;};
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: themeBox.defaultHeightBox90,
            bottom: PreferredSize( 
              preferredSize: Size.fromHeight(0),
              child: Container(
                height: themeBox.defaultHeightBox80,
                padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20, horizontal: themeBox.defaultWidthBox20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(themeBox.defaultRadius30),
                    topRight: Radius.circular(themeBox.defaultRadius30),
                  ),
                ),
                child: HomeUpButton(),
              ),
            ),
            pinned: true,
            backgroundColor: kPrimaryColor,
            expandedHeight: themeBox.defaultHeightBox200,
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
            child: BlocBuilder<cubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
              => (stateDesign.currentBody == 0) 
              ? BodyHomeMenu(hightListView: heightPage) 
              : BodyHomeMenuKlasifikasi(hightListView: heightPage),
            ),
          ),
        ],
      ),
    );
  }
}