import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/interfaces/interfaces_cubit_connection_basic.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class CubitConnectionBasic extends Cubit<DataStateConnection> implements InterfacesCubitConnectionBasic{
  CubitConnectionBasic() : super(DataConnection(false));
  @override
  Future<void> connectCheck(BuildContext context) async{
    try {
      final _result = await InternetAddress.lookup('example.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        emit(DataConnection(true));
      }
    } on SocketException catch (_) {
      emit(DataConnection(false));
    }
  }
}