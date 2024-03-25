import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_all_products/event_all_products.dart';import 'package:foosel/blocs/bloc_all_products/main/bloc_main_all_products_connect.dart';
import 'package:foosel/blocs/bloc_all_products/main/cubit_main_list_all_products_disconnect.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

// ignore: must_be_immutable
class ConnectionProduct extends StatelessWidget with SharedPref{
  late dynamic childProduct, childProductDisconnect, connection;
  ConnectionProduct({Key? key,
    required this.connection,
    required this.childProduct,
    required this.childProductDisconnect,
  }) : super(key: key);
  
  dynamic nullAcces = null;

  // void shared(ConnectivityResult? data) async{
  //   await sharedPref();
  //   if(data == ConnectivityResult.none){
  //     await prefs.setBool('homeUpConnect', false);
  //   }else{
  //     await prefs.setBool('homeUpConnect', true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    Widget statusConnect(ConnectivityResult? data){
      // shared(data);
      return BlocConsumer<BlocAllProductConnect, DataStateProductBasic>(
        listener:(context, state) {
          if(state.loadingApi == true){
            Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200));
          }
        },
        builder: childProduct,
      );
    }

    Widget statusDisconnect(ConnectivityResult? data){
      connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
      // shared(data);
      return BlocConsumer<CubitMainListAllProductsDisconnect, DataStateProductBasic>(
        listener:(context, state) {
          if(state.loadingApi == true){
            Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200));
          }
        },
        builder: childProductDisconnect
      );
    }

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot){
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){ 
            Future.delayed(
              const Duration(milliseconds: 1000),
              () => context.read<BlocAllProductConnect>().add(Product()),
            );
            return statusConnect(snapshot.data);
          }
          else{
            Future.delayed(
              const Duration(milliseconds: 1000),
              () => context.read<CubitMainListAllProductsDisconnect>().getListDataAllProduct(),
            );
            return statusDisconnect(snapshot.data);
          }
        }else{
          Future.delayed(
            const Duration(milliseconds: 1000),
            (){
              context.read<CubitConnectionExample>().connectCheck(
                readBlocConnect: {context.read<BlocAllProductConnect>().add(Product())}, 
                readBlocDisconnect: {context.read<CubitMainListAllProductsDisconnect>().getListDataAllProduct()}
              );
              nullAcces = ComponenLoadingLottieBasic(height: 100);
            }
          );
          nullAcces = BlocBuilder<CubitConnectionExample, DataStateConnection>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? statusConnect(ConnectivityResult.wifi)
            : statusDisconnect(ConnectivityResult.none),
          );
          return nullAcces;
        }
      }
    );
  }
}