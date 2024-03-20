import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class CubitConnection extends Cubit<DataStateConnection>{
  CubitConnection() : super(DataConnection(false));
  connectCheck(BuildContext context, dynamic connection) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(DataConnection(true));
      }
    } on SocketException catch (_) {
      await connection(context);
      emit(DataConnection(false));
    }
  }
}