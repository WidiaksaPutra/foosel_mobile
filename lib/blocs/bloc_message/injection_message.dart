import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/get_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/insert_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/update_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_user_firebase/get_api_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_user_firebase/update_api_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_get_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_get_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiUserFirebase(){
  if(!getItInstance.isRegistered<interfaceGetUserFirebase>()){
    getItInstance.registerFactory<interfaceGetUserFirebase>(() => getUserFirebase());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUserFirebase>()){
    getItInstance.registerFactory<interfaceUpdateUserFirebase>(() => updateUserFirebase());
  }
}

void setupDiChatFirebase(){
  if(!getItInstance.isRegistered<interfaceUpdateChatFirebase>()){
    getItInstance.registerFactory<interfaceUpdateChatFirebase>(() => updateChatFirebase());
  }
  if(!getItInstance.isRegistered<interfaceInsertChatFirebase>()){
    getItInstance.registerFactory<interfaceInsertChatFirebase>(() => insertChatFirebase());
  }
  if(!getItInstance.isRegistered<interfaceGetChatFirebase>()){
    getItInstance.registerFactory<interfaceGetChatFirebase>(() => getChatFirebase());
  }
}