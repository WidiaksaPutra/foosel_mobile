import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';

class cubitConnectionNameCategories extends Cubit<DataStateConnection>{
  cubitConnectionNameCategories() : super(DataConnection(false));
  connectCheck(BuildContext context, dynamic connection) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        context.read<BlocNameCategoriesConnect>().add(NameCategories());
        emit(DataConnection(true));
      }
    } on SocketException catch (_) {
      await connection(context);
      context.read<BlocNameCategoriesDisconnect>().add(NameCategories());
      emit(DataConnection(false));
    }
  }
}