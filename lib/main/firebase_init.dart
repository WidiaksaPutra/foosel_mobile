import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/main/multi_bloc.dart';

class FirebaseInit extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final initialization;
  const FirebaseInit({Key? key, required this.initialization}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Text("error");
        }
        if(snapshot.connectionState == ConnectionState.done){
          return MultiBlocProviderGetX();
        }
        return const Text("loading");
      }
    );
  }
}