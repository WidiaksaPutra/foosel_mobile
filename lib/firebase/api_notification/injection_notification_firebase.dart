import 'package:foosel/firebase/api_notification/api_notification.dart';
import 'package:foosel/firebase/api_notification/interface_insert_notification_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionNotificationFirebase(){
  if(!getItInstance.isRegistered<InterfaceInsertNotificationFirebase>()){
    getItInstance.registerFactory<InterfaceInsertNotificationFirebase>(() => NotificationFirebase());
  }
}
