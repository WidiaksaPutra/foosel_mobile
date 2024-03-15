import 'package:foosel/firebase/api_notification/api_notification.dart';
import 'package:foosel/interface/interface_local/firebase/interface_insert_notification_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionNotificationFirebase(){
  if(!getItInstance.isRegistered<interfaceInsertNotificationFirebase>()){
    getItInstance.registerFactory<interfaceInsertNotificationFirebase>(() => notificationFirebase());
  }
}
