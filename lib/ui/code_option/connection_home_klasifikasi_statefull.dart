// // ignore_for_file: must_be_immutable
// // page ini tak terpakai, tapi digunakan untuk refetensi tentang merubah data Future ke data asli
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_categories/bloc_state_categories.dart';
// import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
// import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ConnectionHomeKlasifikasiStatefull extends StatefulWidget{
//   final dynamic childDisconnect, childConnect;
//   const ConnectionHomeKlasifikasiStatefull({Key? key, required this.childDisconnect, required this.childConnect}) : super(key: key);  

//   @override
//   State<ConnectionHomeKlasifikasiStatefull> createState() => _ConnectionHomeKlasifikasiState();
// }

// class _ConnectionHomeKlasifikasiState extends State<ConnectionHomeKlasifikasiStatefull> {
//   late bool hasilBoolean = true;

//   Future shared() async{
//     SharedPreferences sharedConnecting = await SharedPreferences.getInstance();
//     bool? sharedHasil = sharedConnecting.getBool('homeUpConnect');
//     return Future.value(sharedHasil);
//   }
  
//   @override
//   void initState(){//untuk menginisilaisasi ulang variabel didalamnya.
//     super.initState();
//     sharedAsincron();
//   }

//   void sharedAsincron() async{
//     hasilBoolean = await shared();
//   }

//   @override
//   Widget build(BuildContext context){
//     if(hasilBoolean == false){
//       return BlocBuilder<BlocKlasifikasiCategoriesDisconnect, DataStateCategori>(
//         builder: widget.childDisconnect,
//       );
//     }else{
//       return BlocBuilder<BlocKlasifikasiCategoriesConnect, DataStateCategori>(
//         builder: widget.childConnect,
//       );
//     }
//   }
// }