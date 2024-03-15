import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
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
    return LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
    //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
      builder: (context, constraint) {
        ClassConnectionDialog connection = ClassConnectionDialog();
        return ConnectionHomeProfile(
          connection: connection.basicConnection,
          childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
          ? ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-themeBox.defaultHeightBox70, 
              content: Container(
                margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: themeBox.defaultHeightBox30),
                    ClipOval(
                      child: Image.network(
                        stateUserConn.dataUser.profilePhotoPath.toString().toLowerCase(),
                        width: themeBox.defaultHeightBox100,
                        height: themeBox.defaultWidthBox100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: themeBox.defaultHeightBox30),
                    ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
                      contextForm: null, 
                      labelText: "Name",
                      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
                      hintText: stateUserConn.dataUser.name.toString(), 
                      nameController: 'fullNameUpdate',
                    ),
                    SizedBox(height: themeBox.defaultHeightBox30),
                    ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
                      contextForm: null, 
                      labelText: "Username",
                      labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
                      hintText: stateUserConn.dataUser.username.toString(), 
                      nameController: 'usernameUpdate',
                    ),
                    SizedBox(height: themeBox.defaultHeightBox30),
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
          : ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200),
          childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-themeBox.defaultHeightBox70, 
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "asset/icon/profile_user.png",
                      height: themeBox.defaultHeightBox100,
                      width: themeBox.defaultWidthBox100,
                    ),
                  ),
                  ComponenText2(hintText: stateUserDisconn.dataUser['nama'].toString(), labelText: "Name", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30),
                  ComponenText2(hintText: stateUserDisconn.dataUser['username'].toString(), labelText: "Username", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30),
                  // ComponenText2(hintText: stateUserDisconn.dataUser['email'].toString(), labelText: "Email Address", paddingTextFormFieldBottom: 0, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30),
                  ComponenText2(hintText: stateUserDisconn.dataUser['username'].toString(), labelText: "Username", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30),
                ],
              ),
          )
          : ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200),
        );
      }
    );
  }
}