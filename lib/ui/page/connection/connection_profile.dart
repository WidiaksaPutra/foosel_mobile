import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';
import 'package:foosel/blocs/bloc_user/cubit_connection_main_user.dart';
import 'package:foosel/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:foosel/blocs/bloc_user/main/disconnect/cubit_main_user_disconnect.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';

class ConnectionHomeProfile extends StatelessWidget {
  final dynamic childConnect, childDisconnect, connection; 
  const ConnectionHomeProfile({Key? key, 
    required this.childConnect, 
    required this.childDisconnect,
    required this.connection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget statusConnect() => BlocBuilder<CubitMainUserConnect, DataStateUser>(
      builder: childConnect,
    );

    Widget statusDisconnect() => BlocBuilder<CubitMainUserDisconnect, DataStateUser>(
      builder: childDisconnect
    );

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot){
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            context.read<CubitMainUserConnect>().fetchUser();
            return statusConnect();
          } else{
            connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
            context.read<CubitMainUserDisconnect>().fetchUser();
            return statusDisconnect();
          }
        }
        else{
          context.read<cubitConnectionMainUser>().connectCheck(context);
          return BlocBuilder<cubitConnectionMainUser, DataStateConnection>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? statusConnect()
            : statusDisconnect(),
          ); 
        } 
      }
    );
  }
}