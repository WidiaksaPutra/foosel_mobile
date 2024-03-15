import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/interface/interface_local/firebase/interface_get_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class cubitJumlahBadges extends Cubit<DataStateBadges> with defaultSharedPref{
  final interfaceGetChatFirebase dataGetChatFirebase = getItInstance<interfaceGetChatFirebase>();
  cubitJumlahBadges() : super(DataBadges(notivBadges: [], totalBadges: 0, loading: false));
  getBadgesMessage(List data) async{
    late List listData = [];
    late int total = 0;
    sharedPref();
    emit(DataBadges(notivBadges: listData, totalBadges: total, loading: true));
    for(int i = 0; i < data.length; i++){
      listData.add(await dataGetChatFirebase.GetJumlahFalseMessage(
      emailPengirim: prefs.getString('email').toString(),
      emailPenerima: data[i].email.toString()));
      total += double.parse(listData[i].toString()).toInt();
    }
    emit(DataBadges(notivBadges: listData, totalBadges: total, loading: false));
  }
}