import 'package:flutter/material.dart';
import 'package:foosel/main/multi_bloc.dart';

class FirebaseInit extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final initialization;
  const FirebaseInit({Key? key, required this.initialization}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return MultiBlocProviderGetX();
          } else {
            return const Text("No data available");
          }
        }
        return const Text("Loading");
      }
    );
  }
}