import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/connection/connection_profile.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_black).dart';
import 'package:foosel/ui/widgets/componen_list_view.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_text_2/componen_text.dart';

class BodyEditProfile extends StatelessWidget {
  const BodyEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
    //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
      builder: (context, constraint) {
        ClassConnectionDialog connection = ClassConnectionDialog();
        return ConnectionHomeProfile(
          connection: connection.basicConnection,
          childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
          ? ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-ThemeBox.defaultHeightBox70, 
              content: Container(
                margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: ThemeBox.defaultHeightBox30),
                    ClipOval(
                      child: Image.network(
                        stateUserConn.dataUser.profilePhotoPath.toString().toLowerCase(),
                        width: ThemeBox.defaultHeightBox100,
                        height: ThemeBox.defaultWidthBox100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: ThemeBox.defaultHeightBox30),
                    ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
                      contextForm: null, 
                      labelText: "Name",
                      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
                      hintText: stateUserConn.dataUser.name.toString(), 
                      nameController: 'fullNameUpdate',
                    ),
                    SizedBox(height: ThemeBox.defaultHeightBox30),
                    ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
                      contextForm: null, 
                      labelText: "Username",
                      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
                      hintText: stateUserConn.dataUser.username.toString(), 
                      nameController: 'usernameUpdate',
                    ),
                    SizedBox(height: ThemeBox.defaultHeightBox30),
                    ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
                      contextForm: null, 
                      labelText: "Alamat Address",
                      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
                      hintText: stateUserConn.dataUser.alamat.toString(), 
                      nameController: 'alamatUpdate',
                    ),
                  ],
                )
              ),
            )
          : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200),
          childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-ThemeBox.defaultHeightBox70, 
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox30),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "asset/icon/profile_user.png",
                      height: ThemeBox.defaultHeightBox100,
                      width: ThemeBox.defaultWidthBox100,
                    ),
                  ),
                  ComponenText2(hintText: stateUserDisconn.dataUser['nama'].toString(), labelText: "Name", paddingTextFormFieldBottom: ThemeBox.defaultHeightBox24, paddingTextFormFieldLeft: ThemeBox.defaultWidthBox30, paddingTextFormFieldRight: ThemeBox.defaultWidthBox30),
                  ComponenText2(hintText: stateUserDisconn.dataUser['username'].toString(), labelText: "Username", paddingTextFormFieldBottom: ThemeBox.defaultHeightBox24, paddingTextFormFieldLeft: ThemeBox.defaultWidthBox30, paddingTextFormFieldRight: ThemeBox.defaultWidthBox30),
                  // ComponenText2(hintText: stateUserDisconn.dataUser['email'].toString(), labelText: "Email Address", paddingTextFormFieldBottom: 0, paddingTextFormFieldLeft: ThemeBox.defaultWidthBox30, paddingTextFormFieldRight: ThemeBox.defaultWidthBox30),
                  ComponenText2(hintText: stateUserDisconn.dataUser['username'].toString(), labelText: "Username", paddingTextFormFieldBottom: ThemeBox.defaultHeightBox24, paddingTextFormFieldLeft: ThemeBox.defaultWidthBox30, paddingTextFormFieldRight: ThemeBox.defaultWidthBox30),
                ],
              ),
          )
          : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200),
        );
      }
    );
  }
}