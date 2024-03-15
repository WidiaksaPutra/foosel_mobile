
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/main/bloc_main_all_products_connect.dart';
// import 'package:foosel/blocs/bloc_default/bloc_event_default/bloc_event_form_user.dart';
// import 'package:foosel/blocs/bloc_default/default/default_konstanta.dart';
// import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
// import 'package:foosel/blocs/bloc_login/bloc_event_login.dart';
// import 'package:foosel/blocs/bloc_default/bloc_state_default/bloc_state_snackBar_form.dart';
// import 'package:foosel/firebase/api_user.dart';
// import 'package:foosel/helpers/login/helper_login.dart';
// import 'package:foosel/helpers/products/product_all/helper_products.dart';
// import 'package:foosel/helpers/products/product_popular/helper_products.dart';
// import 'package:foosel/service/api_login.dart';
// import 'package:foosel/service/api_user.dart';
// import 'package:foosel/shared/theme_color.dart';
// import 'package:foosel/shared/theme_konstanta.dart';
// import 'package:get/get.dart';

// // part 'bloc_event_login.dart';
// // part 'bloc_state_login.dart';
// class BlocButtonLoginData extends Bloc<DataEventFormLogin, StateSnackBar> with apiLogin, userFirebase, helperLogin, helperProducts, helperProductsPopular, defaultSharedPref, navigasiRole, apiUser{
//   BlocButtonLoginData() : super(DataStateInitialSnackBar()){
//     on<ButtonFormUser>((event, emit) async{
//       await buttonSnackBar(event.email, event.password, event.context);
//     });
//   }

//   buttonSnackBar(String email, String password, BuildContext context) async{
//     await Future.delayed(const Duration(milliseconds: 500));
//     await sharedPref();
//     late List<Map<String, dynamic>> dataGetLocal = []; 
//     final dataLocal = await getDataLogin();
//     dataGetLocal = dataLocal;
//     if(email != "" && password != ""){
//       if(email != ""){
//         if(password != ""){
//           emit(DataStateSnackBar(context, true, false, "", kWhiteColor, "", "", false, "", kWhiteColor));
//           prefs.setString('email', email);
//           if(dataGetLocal.isNotEmpty && dataGetLocal[0]['email'].toString() == email && dataGetLocal[0]['password'].toString() == password){
//             prefs.setString('token', dataGetLocal[0]['token'].toString());
//             await navigasiR();
//             emit(DataStateSnackBar(context, false, true, snackBarLoginBerhasil, kGreenColor, "berhasil", Get.offAllNamed(navigation), false, "", kWhiteColor));
//           }
//           else{
//             String respons = await login(email: email, password: password);
//             if(respons == "berhasil"){
//               await userFetch();
//               await FirebaseMessaging.instance.deleteToken();
//               var fcmToken = await FirebaseMessaging.instance.getToken();
//               await insertUser(
//                 tokenNotive: fcmToken.toString(),
//                 dataProfil: dataUser,
//               );
//               Future.delayed(Duration(milliseconds: 1000));
//               (dataGetLocal.isEmpty)
//               ? {
//                 await insertDataLogin(email: email, password: password, token: prefs.getString('token').toString()),
//                 //data product initial;
//                 context.read<BlocAllProductConnect>().add(Product()),
//               } 
//               : {
//                   // await deleteDataProducts(),
//                   await deleteDataProductsPopular(),
//                   // await deleteDataCategories(),
//                   await updateDataLogin(email: email, password: password, token: prefs.getString('token').toString()),
//                 };
//               await navigasiR();
//               emit(DataStateSnackBar(context, false, true, snackBarLoginBerhasil, kGreenColor, respons, Get.offAllNamed(navigation), false, "", kWhiteColor));              
//               prefs.remove('emailLogin');
//               prefs.remove('passwordLogin');
//             }
//             if(respons == "gagal"){
//               prefs.remove('email');
//               emit(DataStateSnackBar(context, false, true, snackBarLoginSalah, kRedColor, respons, "", false, "", kWhiteColor));
//             }
//             if(respons == "error"){
//               prefs.remove('email');
//               emit(DataStateSnackBar(context, false, true, snackBarLoginGagal, kRedColor, respons, "", false, "", kWhiteColor));
//             }
//           }
//         }
//       }
//     }
//   }
// }

