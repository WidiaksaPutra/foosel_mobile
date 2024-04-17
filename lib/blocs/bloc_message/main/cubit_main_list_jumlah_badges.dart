import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_get_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitJumlahBadges extends Cubit<DataStateBadges> with SharedPref{
  final InterfaceGetChatFirebase _dataGetChatFirebase = getItInstance<InterfaceGetChatFirebase>();
  CubitJumlahBadges() : super(DataBadges(notivBadges: [], totalBadges: 0, loading: false));
  Future<void> getBadgesMessage(List data) async{
    late List _listData = [];
    late int _total = 0;
    sharedPref();
    emit(DataBadges(notivBadges: _listData, totalBadges: _total, loading: true));
    for(int i = 0; i < data.length; i++){
      _listData.add(await _dataGetChatFirebase.getJumlahFalseMessage(
      emailPengirim: prefs.getString('email').toString(),
      emailPenerima: data[i].email.toString()));
      _total += double.parse(_listData[i].toString()).toInt();
    }
    emit(DataBadges(notivBadges: _listData, totalBadges: _total, loading: false));
  }
}