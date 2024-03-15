// ignore_for_file: must_be_immutable, unused_element
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/cubit_connection_name_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:foosel/blocs/bloc_default/default/cubit_connection_basic.dart';
import 'package:foosel/blocs/bloc_default/default/size_device.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/home_up/home_up_button.dart';
import 'package:foosel/ui/page/user_guest/home_menu_user/body_home_menu.dart';
import 'package:foosel/ui/page/user_guest/home_menu_user/body_home_menu_klasifikasi.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:foosel/ui/widgets/componen_carousel_slider_image_sliver.dart';
import 'package:foosel/ui/widgets/componen_head_home_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class MenuGuest extends HookWidget with sizeDevice{
  @override
  Widget build(BuildContext context) {
    themeBox(context);
    getsizeDevice(context);
    late double heightPage = sizeHeight;
    if(heightPage < 0.0){heightPage = 0.0;};
    context.read<cubitConnectionBasic>().connectCheck(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: BlocBuilder<cubitConnectionBasic, DataStateConnection>(
          builder:(context, state) => (state.connectionBoolean == true)
          ? CustomScrollView(
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
                        Container(
                          margin: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox20),
                          child: ComponenHeadHomeMenu(
                            button: (){
                              context.go(RouteName.login);
                              cubitUpButton().close();
                              BlocNameCategoriesConnect().close();
                              BlocNameCategoriesDisconnect().close();
                              cubitConnectionNameCategories().close();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: BlocBuilder<cubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
                    => (stateDesign.currentBody == 0) 
                    ? BodyHomeMenu(heightPage: heightPage) 
                    : BodyHomeMenuKlasifikasi(heightPage: heightPage),
                  ),
                ),
              ],
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