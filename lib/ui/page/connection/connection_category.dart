// ignore_for_file: must_be_immutable
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class ConnectionCategory extends StatelessWidget{
  late dynamic childConnect, childDisconnect, connection;
  ConnectionCategory({Key? key, 
    required this.childConnect, 
    required this.childDisconnect, 
    required this.connection
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    dynamic nullAcces = null;

    Widget statusConnect(){
      return BlocBuilder<BlocNameCategoriesConnect, DataStateNameCategories>(
        builder: childConnect,
      );
    }
    
    Widget statusDisconnect() => BlocBuilder<BlocNameCategoriesDisconnect, DataStateNameCategories>(
      builder: childDisconnect
    );

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            context.read<BlocNameCategoriesConnect>().add(NameCategories());
            return statusConnect();
          } else{
            connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
            Future.delayed(
              Duration(milliseconds: 1000),
              () => context.read<BlocNameCategoriesDisconnect>().add(NameCategories()),
            );
            return statusDisconnect();
          }
        }
        else{
          Future.delayed(
            Duration(milliseconds: 1000),
            () => context.read<CubitConnectionExample>().connectCheck(
              readBlocConnect: {context.read<BlocNameCategoriesConnect>().add(NameCategories())}, 
              readBlocDisconnect: {context.read<BlocNameCategoriesDisconnect>().add(NameCategories())}
            ),
          );
          nullAcces = ComponenLoadingLottieBasic(height: 100);
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