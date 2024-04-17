// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_user.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_register/main/bloc_main_button_register.dart';
import 'package:foosel/blocs/bloc_register/main/bloc_main_data_register.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_user.dart';
import 'package:foosel/blocs/bloc_default/state/state_multipe_form.dart';
import 'package:foosel/blocs/bloc_default/state/state_snackBar_form.dart';
import 'package:foosel/blocs/bloc_register/main/cubit_main_form_register.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_black).dart';
import 'package:foosel/ui/widgets/componen_button_bar.dart';
import 'package:foosel/ui/widgets/componen_connection_basic.dart';
import 'package:foosel/ui/widgets/componen_end_form.dart';
import 'package:foosel/ui/widgets/componen_form_kosong.dart';
import 'package:foosel/ui/widgets/componen_head_form.dart';
import 'package:foosel/ui/widgets/componen_list_view.dart';
import 'package:foosel/ui/widgets/componen_text_button_315x50.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Register extends HookWidget with SharedPref, DialogBasic{
  Register({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    ThemeBox(context);
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
        SizedBox(height: ThemeBox.defaultHeightBox12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: LabeledRadio(
                label: 'Pembeli',
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                value: true,
                groupValue: _isRadioSelected.value,
                onChanged: (bool value) => _isRadioSelected.value = value,
              ),
            ), 
            Expanded(
              child: LabeledRadio(
                label: 'Penjual',
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                value: false,
                groupValue: _isRadioSelected.value,
                onChanged: (bool value) => _isRadioSelected.value = value
              ),
            ),
          ],
        ),
      ],
    );
    Widget buttonRegister() => BlocBuilder<BlocButtonRegisterData, StateSnackBar>(
      builder: (context, state) => (state.loading == false)
      ? ComponenTextButton_315x50( 
        textButton: TextButton(
          onPressed: () {
            print(environment);
            print(_isRadioSelected.value);
            (environment == "LIVE" && _isRadioSelected.value == false)
            ? voidDialogBasic(
                context: context, 
                margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
                borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
                color: kBlackColor6,
                closeIconStatus: true,
                barrierDismissible: true,
                contentDialog: ComponenContentDialog_ImageAndTitleText(
                  image: 'asset/animations/peringatan_lottie.json',
                  text: 'user penjual ini sementara tidak dapat digunakan, menunggu persetujuan admin...',
                ), onTapCloseDialog: () => Navigator.of(context).pop(),
              )
            : Future.delayed(
                const Duration(milliseconds: 1000),
                (){
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
                  context.read<BlocButtonRegisterData>().add(ButtonFormUser(
                    email: prefs.getString('emailRegister').toString(),
                    password: prefs.getString('passwordRegister').toString(),
                    fullName: prefs.getString('fullNameRegister').toString(), 
                    username: prefs.getString('usernameRegister').toString(), 
                    navigation: RouteName.login,
                    context: context, userRole: _isRadioSelected.value, 
                    alamat: prefs.getString('alamatRegister').toString(),
                  ));
                }
              );
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
                        sizeHeightBox: constraint.maxHeight-ThemeBox.defaultHeightBox70, 
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox60),
                              child: Column(
                                children: [
                                  labelFullName(),
                                  outputFullName(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  labelUsername(),
                                  outputUsername(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  labelEmail(),
                                  outputEmail(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  labelAlamat(),
                                  outputAlamat(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  labelPassword(),
                                  outputPassword(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  jenisUser(),
                                  SizedBox(height: ThemeBox.defaultHeightBox30),
                                  buttonRegister(),
                                ],
                              ), 
                            ),
                            ComponenEndForm(
                              labelGray: "Login Akun ?", 
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