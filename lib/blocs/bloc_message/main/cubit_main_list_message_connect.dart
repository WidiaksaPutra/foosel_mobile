import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_get_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitListMessageConnect extends Cubit<DataStateListMessage> with SharedPref{
  final InterfaceGetUserFirebase dataGetUserFirebase = getItInstance<InterfaceGetUserFirebase>();
  final InterfaceUpdateUserFirebase dataUpdateUserFirebase = getItInstance<InterfaceUpdateUserFirebase>();
  CubitListMessageConnect() : super(DataListMessage([], true));
  getListMessage(dynamic users) async{
    await sharedPref();
    final userList = await dataGetUserFirebase.getUserFirebase(email: prefs.getString('email').toString(), users: users);
    emit(await DataListMessage(userList, false));
  }

  updateListMessage() async{
    await sharedPref();
    await dataUpdateUserFirebase.updateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Online");
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getStreamFirebaseListMessage{
    return firestore.collection('users').snapshots();
  }
}