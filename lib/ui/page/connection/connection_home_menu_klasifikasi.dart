// ignore_for_file: must_be_immutable
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
class ConnectionHomeMenuKlasifikasi extends StatelessWidget with SharedPref, SizeDevice{
  late dynamic childDisconnect, childConnect, connection;
  ConnectionHomeMenuKlasifikasi({Key? key, 
    required this.childDisconnect, 
    required this.childConnect,
    required this.connection,
  }) : super(key: key);  

  dynamic nullAcces = null;

  @override
  Widget build(BuildContext context){
    void readKlasifikasiCategoriesConnect() async{
      await sharedPref();
      ThemeBox(context);
      getsizeDevice(context);
      final int columnCount = (sizeWidth / ThemeBox.defaultWidthBox215).round();
      late double heightPage = sizeHeight - ThemeBox.defaultHeightBox50;
      final int rowCount = (heightPage / ThemeBox.defaultWidthBox215).round();
      if(heightPage < 0.0){heightPage = 0.0;};
      context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: prefs.getString("categoriesIdConnect").toString()));
    }

    void readKlasifikasiCategoriesDisconnect() async{
      await sharedPref();
      context.read<BlocKlasifikasiCategoriesDisconnect>().add(KlasifikasiCategories(categoryKey: prefs.getString("categoriesIdDisconnect").toString()));
    }
    
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
    
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot){
        if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
          if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){ 
            Future.delayed(
              const Duration(milliseconds: 1000),
              () => readKlasifikasiCategoriesConnect(),
            );
            return statusConnect();
          }
          else{
            Future.delayed(
              const Duration(milliseconds: 1000),
              () => readKlasifikasiCategoriesDisconnect(),
            );
            return statusDisconnect();
          }
        }else{
          Future.delayed(
            const Duration(milliseconds: 1000),
            (){
              context.read<CubitConnectionExample>().connectCheck(
                readBlocConnect: {readKlasifikasiCategoriesConnect()}, 
                readBlocDisconnect: {readKlasifikasiCategoriesDisconnect()}
              );
              nullAcces = ComponenLoadingLottieBasic(height: 100);
            }
          );
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