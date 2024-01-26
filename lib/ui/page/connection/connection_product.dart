import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/event_all_products.dart';import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/bloc_main_all_products_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/cubit_main_list_all_products_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_product_basic.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';

// ignore: must_be_immutable
class ConnectionProduct extends StatelessWidget with defaultSharedPref, loadingScrollData{
  late dynamic childProduct, childProductDisconnect, connection;
  ConnectionProduct({Key? key,
    required this.connection,
    required this.childProduct,
    required this.childProductDisconnect,
  }) : super(key: key);
  
  dynamic nullAcces = null;

  void shared(ConnectivityResult? data) async{
    await sharedPref();
    if(data == ConnectivityResult.none){
      await prefs.setBool('homeUpConnect', false);
    }else{
      await prefs.setBool('homeUpConnect', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget statusConnect(ConnectivityResult? data){
      shared(data);
      return ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          BlocConsumer<BlocAllProductConnect, DataStateProductBasic>(
            listener:(context, state) {
              if(state.loadingApi == true){
                Center(child: CircularProgressIndicator(color: kPurpleColor));
              }
            },
            builder: childProduct,
          ),
        ],
      );
    }

    Widget statusDisconnect(ConnectivityResult? data){
      connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
      shared(data);
      return ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          BlocConsumer<CubitMainListAllProductsDisconnect, DataStateProductBasic>(
            listener:(context, state) {
              if(state.loadingApi == true){
                Center(child: CircularProgressIndicator(color: kPurpleColor));
              }
            },
            builder: childProductDisconnect
          ),
        ],
      );
    }

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot){
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
            context.read<BlocAllProductConnect>().add(Product()); 
            Future.delayed(const Duration(milliseconds: 1000));
            return BlocBuilder<BlocAllProductConnect, DataStateProductBasic>(
              builder: (context, fresh) => statusConnect(snapshot.data)
            );
          }
          else{
            context.read<CubitMainListAllProductsDisconnect>().GetListDataAllProduct();
            Future.delayed(const Duration(milliseconds: 1000));
            return statusDisconnect(snapshot.data);
          }
        }else{
          context.read<cubitConnectionExample>().connectCheck(
            readBlocConnect: {context.read<BlocAllProductConnect>().add(Product())}, 
            readBlocDisconnect: {context.read<CubitMainListAllProductsDisconnect>().GetListDataAllProduct()}
          );
          Future.delayed(const Duration(milliseconds: 1000));
          nullAcces = const ComponenLoadingBasic(colors: kPurpleColor);
          nullAcces = BlocBuilder<cubitConnectionExample, DataStateConnection>(
            builder: (context, state) => (state.connectionBoolean == true)
            ? statusConnect(ConnectivityResult.wifi)
            : statusDisconnect(ConnectivityResult.none),
          );
          Future.delayed(const Duration(milliseconds: 3000));
          return nullAcces;
        }
      }
    );
  }
}