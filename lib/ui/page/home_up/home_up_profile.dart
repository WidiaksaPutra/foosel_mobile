import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_head_home.dart';

class HomeUpProfile extends StatelessWidget {
  const HomeUpProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassConnectionDialog connection = ClassConnectionDialog();
    return ConnectionHomeProfile(
      connection: connection.basicConnection,
      childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
      ? ComponenHeadHome(
          label1:"Hallo, ${stateUserConn.dataUser.name.toString()}", 
          label2: stateUserConn.dataUser.username.toString(), 
          image: stateUserConn.dataUser.profilePhotoPath.toString(),
        )
      : Center(child: CircularProgressIndicator(color: kPurpleColor)),
      childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.dataUser['nama'] == null)
      ? Center(child: CircularProgressIndicator(color: kPurpleColor))
      : (stateUserDisconn.loading == true)
      ? ComponenHeadHome(
          label1:"Hallo, ${stateUserDisconn.dataUser['nama'].toString()}", 
          label2: stateUserDisconn.dataUser['username'].toString(), 
          image: "asset/icon/profile_user.png",
        )
      : Center(child: CircularProgressIndicator(color: kPurpleColor)),
    );
  }
}