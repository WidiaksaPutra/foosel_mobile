abstract class InterfaceInsertNotificationFirebase{
  Future insertNotificationFirebase({
    required String? deviceToken, 
    required String title, 
    required String body,
  });
}