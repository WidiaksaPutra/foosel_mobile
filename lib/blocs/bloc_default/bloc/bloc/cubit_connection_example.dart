import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/interfaces/interfaces_cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class CubitConnectionExample extends Cubit<DataStateConnection> implements InterfacesCubitConnectionExample{
  CubitConnectionExample() : super(DataConnection(false));
  @override
  Future<void> connectCheck({
    required dynamic readBlocConnect, 
    required dynamic readBlocDisconnect,
  }) async{  
    try {
      final _result = await InternetAddress.lookup("example.com");
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        readBlocConnect;
        emit(DataConnection(true));
      }else{
        readBlocDisconnect;
        emit(DataConnection(false));
      }
    } on SocketException catch (_) {
      readBlocDisconnect;
      emit(DataConnection(false));
    }
  }
}