import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/default/ui/list_vertical_home.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_product.dart';

class BodyHomeMenu extends StatelessWidget{
  final double hightListView;
  BodyHomeMenu({Key? key, required this.hightListView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassConnectionDialog connection = ClassConnectionDialog();
    return ConnectionProduct(
      connection: connection.basicConnection,
      childProduct: (context, state)
      => ListVerticalHome(
          lengthList: state.getData.length, 
          data: state.getData,
          labelList: "New Arrivals", 
          loading: state.loadingScroll,
          scrollControl: state.scrollControl,
          connection: true, 
          hightListView: hightListView,
        ),
      childProductDisconnect: (context, state)
      => ListVerticalHome(
          lengthList: state.getData.length, 
          data: state.getData,
          labelList: "New Arrivals", 
          scrollControl: state.scrollControl, 
          loading: state.loadingScroll,
          connection: false, 
          hightListView: hightListView,
        )
    );
  }
}



























 // Timer.periodic(Duration(seconds: 3), (timer){
    //   setState(() {
    //     getStreamProduct();
    //   });
    // });
//  (context, state){
      //   print("test 123");
      //   print(state.getData);
      //   return (state.loadingApi == false)
      //   //  (state.loadingApi == true)
      //   ? Text("loading....", style: TextStyle(color: Colors.white),)
      //   : 
        // StreamBuilder<dynamic>(
        //   stream: state.getData,
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        //     if(snapshot.hasData){
        //       if(snapshot.connectionState == ConnectionState.waiting){
        //         return Text("loading 2 ...");
        //       }else{
        //         var data = snapshot.data!;
        //         return 
        //       }
        //     }else{
        //       return Text("loading 3 ...");
        //     }
        //   }
        // );
      // },