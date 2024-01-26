// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/event_default/event_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/bloc_main_button_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/bloc_main_data_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_multipe_form.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_snackBar_form.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/cubit_main_form_register.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_black).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_button_bar.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_end_form.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_form_kosong.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_head_form.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_list_view.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_text_button_315x50.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Register extends HookWidget with defaultSharedPref{
  Register({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var _isRadioSelected = useState<bool>(true);
    sharedPref();
    
    Widget labelFullName() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Full Name",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Full Name",
      nameController: "fullNameRegister",
      iconText: "asset/icon/username_Icon.png",
      contextForm: context.read<CubitFormRegister>().fullNameValidasiEmpty,
    );

    Widget outputFullName() => BlocBuilder<BlocButtonRegisterUser, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisibleFullName == true) 
      ? ComponenFormKosong(formVisible: state.formVisibleFullName, message: state.messageFullName)
      : BlocBuilder<CubitFormRegister, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleFullName, message: state1.message),
        ),
    );

    Widget labelAlamat() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Alamat",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Alamat",
      nameController: "alamatRegister",
      iconText: "asset/icon/username_Icon.png",
      contextForm: context.read<CubitFormRegister>().alamatValidasiEmpty,
    );

    Widget outputAlamat() => BlocBuilder<BlocButtonRegisterUser, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisibleAlamat == true) 
      ? ComponenFormKosong(formVisible: state.formVisibleAlamat, message: state.messageAlamat)
      : BlocBuilder<CubitFormRegister, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleAlamat, message: state1.message),
        ),
    );

    Widget labelUsername() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Username",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Username",
      nameController: "usernameRegister",
      iconText: "asset/icon/union_Icon.png",
      contextForm: context.read<CubitFormRegister>().usernameValidasiEmpty,
    );

    Widget outputUsername() => BlocBuilder<BlocButtonRegisterUser, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisibleUsername == true) 
      ? ComponenFormKosong(formVisible: state.formVisibleUsername, message: state.messageUsername)
      : BlocBuilder<CubitFormRegister, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleUsername, message: state1.message,),
        ),
    );

    Widget labelEmail() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Email Address",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Email Address",
      nameController: "emailRegister",
      iconText: "asset/icon/email_Icon.png",
      contextForm: context.read<CubitFormRegister>().emailValidasiEmpty,
    );

    Widget outputEmail() => BlocBuilder<BlocButtonRegisterUser, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisibleEmail == true) 
      ? ComponenFormKosong(formVisible: state.formVisibleEmail, message: state.messageEmail)
      : BlocBuilder<CubitFormRegister, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleEmail, message: state1.message,),
        ),
    );

    Widget labelPassword() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
      labelText: "Password",
      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
      hintText: "Your Password",
      nameController: "passwordRegister",
      iconText: "asset/icon/password_Icon.png",
      contextForm: context.read<CubitFormRegister>().passwordValidasiEmpty,
    );
    
    Widget outputPassword() => BlocBuilder<BlocButtonRegisterUser, DataStateMultiFormUser>(
      builder: (context, state) => (state.formVisiblePassword == true) 
      ? ComponenFormKosong(formVisible: state.formVisiblePassword, message: state.messagePassword)
      : BlocBuilder<CubitFormRegister, DataStateFormUser>(
          builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisiblePassword, message: state1.message,),
        ),
    );

    Widget jenisUser() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Digunakan Sebagai :", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
        SizedBox(height: themeBox.defaultHeightBox12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LabeledRadio(
              label: 'Pembeli',
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              value: true,
              groupValue: _isRadioSelected.value,
              onChanged: (bool value) => _isRadioSelected.value = value,
            ),
            LabeledRadio(
              label: 'Penjual',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: false,
              groupValue: _isRadioSelected.value,
              onChanged: (bool value) => _isRadioSelected.value = value
            ),
          ],
        ),
      ],
    );

    Widget buttonRegister() => BlocBuilder<BlocButtonRegisterData, StateSnackBar>(
      builder: (context, state) => (state.loading == false)
      ? ComponenTextButton_315x50( 
        textButton: TextButton(
          onPressed: () {//form login gabisa di restart
            context.read<BlocButtonRegisterUser>().add(ButtonFormUser(
              email: prefs.getString('emailRegister').toString(), 
              password: prefs.getString('passwordRegister').toString(),
              fullName: prefs.getString('fullNameRegister').toString(), 
              username: prefs.getString('usernameRegister').toString(), 
              navigation: RouteName.login,
              context: context, 
              userRole: _isRadioSelected.value, 
              alamat: prefs.getString('alamatRegister').toString(),
            ));
            Future.delayed(const Duration(milliseconds: 1000));
            BlocButtonRegisterUser().close();
            context.read<BlocButtonRegisterData>().add(ButtonFormUser(
              email: prefs.getString('emailRegister').toString(),
              password: prefs.getString('passwordRegister').toString(),
              fullName: prefs.getString('fullNameRegister').toString(), 
              username: prefs.getString('usernameRegister').toString(), 
              navigation: RouteName.login,
              context: context, userRole: _isRadioSelected.value, 
              alamat: prefs.getString('alamatRegister').toString(),
            ),);
            Future.delayed(const Duration(milliseconds: 1000));
            BlocButtonRegisterData().close();
          }, 
          child: Text("Sign Up", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
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

    ClassConnectionDialog connection = ClassConnectionDialog();
    return ComponenConnectionBasicSingle(
        connection: connection.basicConnection, 
        connect: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
              //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
              builder: (context, constraint){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponenHeadForm(labelWhite: "Sign Up", labelGrey: "Register and Happy Shoping"),
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
                                  labelFullName(),
                                  outputFullName(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  labelUsername(),
                                  outputUsername(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  labelEmail(),
                                  outputEmail(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  labelAlamat(),
                                  outputAlamat(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  labelPassword(),
                                  outputPassword(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  jenisUser(),
                                  SizedBox(height: themeBox.defaultHeightBox30),
                                  buttonRegister(),
                                ],
                              ), 
                            ),
                            ComponenEndForm(
                              labelGray: "Already have an account?", 
                              labelPurple: "Sign In", 
                              navigasiPage: RouteName.login, 
                              contextGo: context, 
                              navBack: RouteName.login,
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
        ),
      ), 
      contextGo: context, 
      navBack: RouteName.login,
    );
  }
}