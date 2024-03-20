import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:foosel/blocs/bloc_user/main/disconnect/cubit_main_user_disconnect.dart';

class CubitConnectionMainUser extends Cubit<DataStateConnection> with SharedPref{
  CubitConnectionMainUser() : super(DataConnection(false));
  connectCheck(BuildContext context) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await context.read<CubitMainUserConnect>().fetchUser();
        emit(DataConnection(true));
      }
    } on SocketException catch (_) {
      await context.read<CubitMainUserDisconnect>().fetchUser();
      emit(DataConnection(false));
    }
  }
}