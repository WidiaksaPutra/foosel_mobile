import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/event_default/event_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/bloc_main_button_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/bloc_main_data_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/cubit_main_form_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_multipe_form.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_snackBar_form.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_black).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_end_form.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_form_kosong.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_head_form.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_list_view.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_text_button_315x50.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget with defaultSharedPref{
  Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    sharedPref();
    
    Widget labelEmail() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Email Address",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Email Address",
      nameController: "emailLogin",
      iconText: "asset/icon/email_Icon.png",
      contextForm: context.read<CubitFormLogin>().emailValidasiEmpty,
    );

    Widget outputEmail() => BlocBuilder<BlocButtonLogin, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisibleEmail == true) 
      ? ComponenFormKosong(formVisible: state.formVisibleEmail, message: state.messageEmail)
      : BlocBuilder<CubitFormLogin, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleEmail, message: state1.message,),
        ),
    );

    Widget labelPassword() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Password",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Password",
      nameController: "passwordLogin",
      iconText: "asset/icon/password_Icon.png",
      contextForm: context.read<CubitFormLogin>().passwordValidasiEmpty,
      hiddenText: true,
    );
    
    Widget outputPassword() => BlocBuilder<BlocButtonLogin, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisiblePassword == true) 
      ? ComponenFormKosong(formVisible: state.formVisiblePassword, message: state.messagePassword)
      : BlocBuilder<CubitFormLogin, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisiblePassword, message: state1.message,),
        ),
    );

    Widget buttonLogin() => BlocBuilder<BlocButtonLoginData, StateSnackBar>(
      builder: (context, state) => (state.loading == false)
      ? ComponenTextButton_315x50(
        textButton: TextButton(
          onPressed: () {//form login gabisa di restart
            context.read<BlocButtonLogin>().add(ButtonFormUser(email: prefs.getString('emailLogin').toString(), 
            password: prefs.getString('passwordLogin').toString(), navigation: '', 
            context: context, fullName: '', username: '', userRole: null, alamat: ''));
            Future.delayed(const Duration(milliseconds: 1000));
            BlocButtonLogin().close();
            // context.read<BlocButtonLogin>().buttonLogin(prefs.getString('email').toString(), prefs.getString('password').toString(), RouteName.bottomNav);
            context.read<BlocButtonLoginData>().add(ButtonFormUser(email: prefs.getString('emailLogin').toString(), 
            password: prefs.getString('passwordLogin').toString(), navigation: '', 
            context: context, fullName: '', username: '', userRole: null, alamat: ''));
            Future.delayed(const Duration(milliseconds: 1000));
            BlocButtonLoginData().close();
          },
          child: Text("Sign In", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
        ), 
        colorButton: kPurpleColor, 
      )
      : ComponenTextButton_315x50( 
        textButton: TextButton( 
          onPressed: () {},
          child: Text("Loading...", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
        ),
        colorButton: kOrangeColor, 
      )
    );

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
          //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
          builder: (context, constraint){
            ClassConnectionDialog connection = ClassConnectionDialog();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ComponenHeadForm(labelWhite: "Login", labelGrey: "Sign In to Countinue"),
                Expanded(
                  child: ComponenListViewVertical(
                    sizeHeightBox: constraint.maxHeight-70.0, 
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox60),
                          child: Column(
                            children: [
                              labelEmail(),
                              outputEmail(),
                              SizedBox(height: themeBox.defaultHeightBox30),
                              labelPassword(),
                              outputPassword(),
                              SizedBox(height: themeBox.defaultHeightBox30),
                              buttonLogin(),
                            ],
                          ), 
                        ),
                        ComponenConnectionBasic(
                          connection: connection.basicConnection,
                          connect: ComponenEndForm(labelGray: "Don't have an account?", labelPurple: "Sign up", navigasiPage: RouteName.register, contextGo: context, navBack: RouteName.login),
                          disconnect: Text("")
                        ),
                      ],
                    ),     
                  ),
                ),
              ],
            );           
          },
        ),
      ),
    );
  }
}