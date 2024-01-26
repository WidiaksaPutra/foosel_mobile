// ignore_for_file: must_be_immutable
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';

class ConnectionBasic extends StatelessWidget{
  late dynamic childConnect, childDisconnect, connection, buttonConnection;
  ConnectionBasic({Key? key, 
    required this.childConnect, 
    required this.childDisconnect, 
    required this.connection,
    required this.buttonConnection,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    dynamic nullAcces = null;

    Widget statusConnect() => childConnect;
    
    Widget statusDisconnect(){
      connection(context: context, onTap: (){}, buttonConnection: buttonConnection);
      return childDisconnect;
    }

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            return statusConnect();
          } else{
            return statusDisconnect();
          }
        }
        else{
          nullAcces = const ComponenLoadingBasic(colors: kPurpleColor);
          nullAcces = BlocBuilder<cubitConnectionExample, DataStateConnection>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? statusConnect()
            : statusDisconnect(),
          );
          Future.delayed(const Duration(milliseconds: 3000));
          return nullAcces;
        }
      } 
    );
  }
}