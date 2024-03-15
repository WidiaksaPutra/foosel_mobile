import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/interface/interface_local/firebase/interface_get_user_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class cubitListMessageConnect extends Cubit<DataStateListMessage> with defaultSharedPref{
  final interfaceGetUserFirebase dataGetUserFirebase = getItInstance<interfaceGetUserFirebase>();
  final interfaceUpdateUserFirebase dataUpdateUserFirebase = getItInstance<interfaceUpdateUserFirebase>();
  cubitListMessageConnect() : super(DataListMessage([], true));
  getListMessage(dynamic users) async{
    await sharedPref();
    final userList = await dataGetUserFirebase.GetUserFirebase(email: prefs.getString('email').toString(), users: users);
    emit(await DataListMessage(userList, false));
  }

  updateListMessage() async{
    await sharedPref();
    await dataUpdateUserFirebase.UpdateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Online");
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getStreamFirebaseListMessage{
    return firestore.collection('users').snapshots();
  }
}