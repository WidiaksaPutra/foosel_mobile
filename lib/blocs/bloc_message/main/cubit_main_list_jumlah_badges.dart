import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_get_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitJumlahBadges extends Cubit<DataStateBadges> with SharedPref{
  final InterfaceGetChatFirebase dataGetChatFirebase = getItInstance<InterfaceGetChatFirebase>();
  CubitJumlahBadges() : super(DataBadges(notivBadges: [], totalBadges: 0, loading: false));
  getBadgesMessage(List data) async{
    late List listData = [];
    late int total = 0;
    sharedPref();
    emit(DataBadges(notivBadges: listData, totalBadges: total, loading: true));
    for(int i = 0; i < data.length; i++){
      listData.add(await dataGetChatFirebase.getJumlahFalseMessage(
      emailPengirim: prefs.getString('email').toString(),
      emailPenerima: data[i].email.toString()));
      total += double.parse(listData[i].toString()).toInt();
    }
    emit(DataBadges(notivBadges: listData, totalBadges: total, loading: false));
  }
}