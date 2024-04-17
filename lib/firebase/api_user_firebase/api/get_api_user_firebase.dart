import 'package:foosel/firebase/api_user_firebase/interfaces/interface_get_user_firebase.dart';
import 'package:foosel/model/user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class GetUserFirebase implements InterfaceGetUserFirebase{
  late List<FirebaseUsers> userList = [];
  
  @override
  Future getUserFirebase({
    required String email, 
    required users,
  }) async{
    try{
      late List<String> userSubList = [];
      userSubList.clear();
      userList.clear();
      if(users == []){
        users = await firestore.collection('users').get();
      }
      for (var element in users) {
        if(FirebaseUsers.fromJson(element.data()).chats!.isNotEmpty && FirebaseUsers.fromJson(element.data()).email.toString() == email.toString()){
          for(int indexChat = 0; indexChat < FirebaseUsers.fromJson(element.data()).chats!.length; indexChat++){
            userSubList.add(FirebaseUsers.fromJson(element.data()).chats![indexChat].connection.toString());
          }
          break;
        }
      }
      for(var userData in userSubList){
        for(var element in users){   
          if(userData == FirebaseUsers.fromJson(element.data()).email.toString()){
            userList.add(FirebaseUsers.fromJson(element.data()));
            break;
          }
        }
      }
      return userList;
    }catch (e) {
      return "error";
    }
  }
}









// getUserPersonal(email) async{
//   CollectionReference userPer = firestore.collection('users');
//   final chectyy = await userPer.doc(email.toString()).get();
//   userPersonalStatus = (chectyy.data() as Map<String, dynamic>)['status'];    
// }