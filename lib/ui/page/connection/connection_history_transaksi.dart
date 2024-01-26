// ignore_for_file: must_be_immutable
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';

class ConnectionHistoryTransaksi extends HookWidget{
  late dynamic childConnect, childDisconnect, connection;
  ConnectionHistoryTransaksi({Key? key, 
    required this.childConnect, 
    required this.childDisconnect, 
    required this.connection,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var connectTransaksi = useState(false);
    dynamic nullAcces = null;

    Widget statusConnect(){
      return BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
        builder: childConnect,
      );
    }

    Widget statusDisconnect(){
      connection(context: context, onTap: (){Navigator.of(context).pop();}, buttonConnection: false);
      return BlocBuilder<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
        builder: childDisconnect
      );
    }

    void connectTransaksiProduct() async{
      await context.read<CubitGetTransaksiProduct>().GetDataTransaksiHistory();
    }

    void connectTransaksiProductLocal() async{
      await context.read<CubitGetTransaksiProductLocal>().GetDataTransaksi();
    }

    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        context.read<cubitConnectionExample>().connectCheck(
          readBlocConnect: {
            if(connectTransaksi.value == false){
              connectTransaksi.value = true,
              connectTransaksiProduct(),
            }
          }, 
          readBlocDisconnect: {connectTransaksiProductLocal()}
        );
        Future.delayed(const Duration(milliseconds: 1000));
        nullAcces = const ComponenLoadingBasic(colors: kPurpleColor);
        nullAcces = BlocBuilder<cubitConnectionExample, DataStateConnection>(
          builder: (context, state) => (state.connectionBoolean == true)
          ? statusConnect()
          : statusDisconnect(),
        );
        Future.delayed(const Duration(milliseconds: 3000));
        return nullAcces;
      } 
    );
  }
}