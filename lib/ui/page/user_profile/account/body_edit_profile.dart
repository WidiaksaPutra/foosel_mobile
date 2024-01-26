import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_list_view.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_text_2/componen_text.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_text_2/componen_text_form_field.dart';

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
              sizeHeightBox: constraint.maxHeight-70.0, 
              content: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Image.network(
                        stateUserConn.dataUser.profilePhotoPath.toString().toLowerCase(),
                        width: themeBox.defaultHeightBox100,
                        height: themeBox.defaultWidthBox100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ComponenTextFormField2(hiddenText: false, hintText: stateUserConn.dataUser.name.toString(), keyboardType: TextInputType.text, labelText: "Name", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30, nameController: 'fullNameUpdate',),
                  ComponenTextFormField2(hiddenText: false, hintText: stateUserConn.dataUser.username.toString(), keyboardType: TextInputType.text, labelText: "Username", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30, nameController: 'usernameUpdate',),
                  // ComponenTextFormField2(hiddenText: false, hintText: stateUserConn.dataUser.email.toString(), keyboardType: TextInputType.text, labelText: "Email Address", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30, nameController: 'emailUpdate',),
                  ComponenTextFormField2(hiddenText: false, hintText: stateUserConn.dataUser.alamat.toString(), keyboardType: TextInputType.text, labelText: "Alamat Address", paddingTextFormFieldBottom: themeBox.defaultHeightBox24, paddingTextFormFieldLeft: themeBox.defaultWidthBox30, paddingTextFormFieldRight: themeBox.defaultWidthBox30, nameController: 'alamatUpdate',),
                ],
              ),
          )
          : ComponenLoadingHashDataMap(boolLoading: stateUserConn.loading, data: stateUserConn.dataUser),
          childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-70.0, 
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
          : ComponenLoadingHashDataMap(boolLoading: stateUserDisconn.loading, data: stateUserDisconn.dataUser),
        );
      }
    );
  }
}