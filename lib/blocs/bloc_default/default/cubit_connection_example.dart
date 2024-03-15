import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';

class cubitConnectionExample extends Cubit<DataStateConnection>{
  cubitConnectionExample() : super(DataConnection(false));
  connectCheck({required dynamic readBlocConnect, required dynamic readBlocDisconnect}) async{  
    try {
      final result = await InternetAddress.lookup("example.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
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