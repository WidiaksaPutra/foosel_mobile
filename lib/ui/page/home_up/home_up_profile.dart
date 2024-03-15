// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/default/size_device.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/page/connection/connection_profile.dart';
import 'package:foosel/ui/widgets/componen_head_home.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class HomeUpProfile extends StatelessWidget with sizeDevice{
  HomeUpProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeBox(context);
    ClassConnectionDialog connection = ClassConnectionDialog();
    return Padding(
      padding: EdgeInsets.only(left: themeBox.defaultWidthBox20),
      child: ConnectionHomeProfile(
        connection: connection.basicConnection,
        childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
        ? ComponenHeadHome(
            label1:"Hallo, ${stateUserConn.dataUser.name.toString()}", 
            label2: stateUserConn.dataUser.username.toString(), 
            image: stateUserConn.dataUser.profilePhotoPath.toString(),
            connect: true,
          )
        : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100)),
        childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.dataUser['nama'] == null)
        ? Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100))
        : (stateUserDisconn.loading == true)
        ? ComponenHeadHome(
            label1:"Hallo, ${stateUserDisconn.dataUser['nama'].toString()}", 
            label2: stateUserDisconn.dataUser['username'].toString(), 
            image: "asset/icon/profile_user.png",
            connect: false,
          )
        : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100)),
      ),
    );
  }
}