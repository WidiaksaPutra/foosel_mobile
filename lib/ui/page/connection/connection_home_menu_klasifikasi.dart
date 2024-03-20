// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_default/bloc/cubit_connection_navigasi.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';

class ConnectionHomeMenuKlasifikasi extends StatelessWidget{
  late dynamic childDisconnect, childConnect, connection;
  ConnectionHomeMenuKlasifikasi({Key? key, 
    required this.childDisconnect, 
    required this.childConnect,
    required this.connection,
  }) : super(key: key);  

  @override
  Widget build(BuildContext context){

    Widget statusConnect(){
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<BlocKlasifikasiCategoriesConnect, DataStateCategori>(
          builder: childConnect,
        ),
      );
    }

    Widget statusDisconnect(){
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<BlocKlasifikasiCategoriesDisconnect, DataStateCategori>(
          builder: childDisconnect,
        ),
      );
    }

    // return statusConnect();
    context.read<CubitConnectionNavigasi>().klasifikasiConnection('homeUpConnect');
    return BlocBuilder<CubitConnectionNavigasi, DataStateConnection>(
      builder: (context, state){
        if(state.connectionBoolean == true){
          return statusConnect();
        }else{
          connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
          return statusDisconnect();
        }
      }
    );
  }
}