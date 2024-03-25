import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class CubitConnectionNameCategories extends Cubit<DataStateConnection> implements InterfacesConnectionNameCategories{
  CubitConnectionNameCategories() : super(DataConnection(false));
  @override
  Future<void> connectCheck(BuildContext context, dynamic connection) async{
    try {
      final _result = await InternetAddress.lookup('example.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
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