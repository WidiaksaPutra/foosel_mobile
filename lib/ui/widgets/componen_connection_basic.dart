import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection.dart';
import 'package:go_router/go_router.dart';

class ComponenConnectionBasic extends StatelessWidget{
  final Widget disconnect, connect;
  // ignore: prefer_typing_uninitialized_variables
  final connection;
  const ComponenConnectionBasic({Key? key, required this.disconnect, required this.connect, required this.connection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            return connect;
          }
          else{
            connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
            return disconnect; 
          }
        }
        else{
          context.read<CubitConnection>().connectCheck(context, connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false));
          return BlocBuilder<CubitConnection, dynamic>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? connect
            : disconnect,
          ); 
        }
      } 
    );
  }
}

class ComponenConnectionBasicSingle extends StatelessWidget{
  final Widget connect;
  final String navBack;
  final BuildContext contextGo;
  // ignore: prefer_typing_uninitialized_variables
  final connection;
  const ComponenConnectionBasicSingle({Key? key,
    required this.connect, 
    required this.connection,
    required this.navBack,
    required this.contextGo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            return connect;
          }
          else{
            Future.delayed(
              const Duration(milliseconds: 1000),
              (){
                connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
              }
            );
            contextGo.go(navBack);
            return const Text(""); 
          }
        }
        else{
          context.read<CubitConnection>().connectCheck(context, connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false));
          return BlocBuilder<CubitConnection, dynamic>(
            builder: (context, state) {
              if(state.connectionBoolean == true){
                return connect;
              }else{
                contextGo.go(navBack);
                return const Text("");
              }  
            }
          ); 
        }
      } 
    );
  }
}

