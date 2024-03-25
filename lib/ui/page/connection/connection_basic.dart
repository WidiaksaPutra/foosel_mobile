// ignore_for_file: must_be_immutable
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

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
          ThemeBox(context);
          nullAcces = ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
          nullAcces = BlocBuilder<CubitConnectionExample, DataStateConnection>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? statusConnect()
            : statusDisconnect(),
          );
          return nullAcces;
        }
      } 
    );
  }
}