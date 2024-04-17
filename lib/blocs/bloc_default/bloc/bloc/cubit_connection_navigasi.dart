import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/interfaces/interfaces_cubit_connection_navigasi.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
class CubitConnectionNavigasi extends Cubit<DataStateConnection> with SharedPref implements InterfacesCubitConnectionNavigasi{
  CubitConnectionNavigasi() : super(DataConnection(false));
  @override
  Future<void> klasifikasiConnection(String key) async{
    await sharedPref();
    bool _sharedHasil = prefs.getBool(key) as bool;
    emit(DataConnection(_sharedHasil));
  }
}