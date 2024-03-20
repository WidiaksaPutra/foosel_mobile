import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class CubitConnectionBasic extends Cubit<DataStateConnection>{
  CubitConnectionBasic() : super(DataConnection(false));
  connectCheck(BuildContext context) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(DataConnection(true));
      }
    } on SocketException catch (_) {
      emit(DataConnection(false));
    }
  }
}