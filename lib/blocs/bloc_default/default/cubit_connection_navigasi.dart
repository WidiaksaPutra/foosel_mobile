import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';

class cubitConnectionNavigasi extends Cubit<DataStateConnection> with defaultSharedPref{
  cubitConnectionNavigasi() : super(DataConnection(false));
  klasifikasiConnection(String key) async{
    await sharedPref();
    bool sharedHasil = prefs.getBool(key) as bool;
    emit(DataConnection(sharedHasil));
  }
}