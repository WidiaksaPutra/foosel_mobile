import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';

class cubitConnectionBasic extends Cubit<DataStateConnection>{
  cubitConnectionBasic() : super(DataConnection(false));
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