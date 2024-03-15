import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/page/default/ui/list_horizontal_home.dart';
import 'package:foosel/ui/page/default/ui/list_vertical_home.dart';
import 'package:foosel/ui/page/connection/connection_product.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class BodyHomeMenu extends StatelessWidget{
  final double hightListView;
  BodyHomeMenu({Key? key, required this.hightListView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeBox(context);
    ClassConnectionDialog connection = ClassConnectionDialog();
    return ConnectionProduct(
      connection: connection.basicConnection,
      childProduct: (context, state) => (state.loadingApi == true)
      ? Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200))
      : ListVerticalHome(
          lengthList: state.getData.length, 
          data: state.getData,
          loading: state.loadingScroll,
          scrollControl: state.scrollControl,
          connection: true, 
          hightListView: hightListView,
        ),
      childProductDisconnect: (context, state) => (state.loadingApi == true)
      ? Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200))
      : ListHorizontalHome(
          lengthList: state.getData.length, 
          data: state.getData,
          scrollControl: state.scrollControl, 
          loading: state.loadingScroll,
          connection: false, 
          heightPage: hightListView,
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