// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_user_pembeli.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical_user_transaksi.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class CartPenjual extends StatelessWidget with SharedPref{
  CartPenjual({Key? key}) : super(key: key);

  void read(BuildContext context){
    context.read<CubitConnectionExample>().connectCheck(
      readBlocConnect: {
        context.read<CubitGetTransaksiUserPembeli>().getDataTransaksiHistory(),
      }, 
      readBlocDisconnect: {}
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    sharedPref();
    Size size = MediaQuery.of(context).size;
    read(context);
    return Scaffold(
      backgroundColor: kBlackColor6,
      body: BlocBuilder<CubitConnectionExample, DataStateConnection>(
        builder: (context, stateConnect) => (stateConnect.connectionBoolean == true)
        ? BlocBuilder<CubitGetTransaksiUserPembeli, DataStateGetTransaksi>(
            builder: (context, state){ 
              return (state.loading == false)
              ? (state.dataTransaksi.isNotEmpty)
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.dataTransaksi.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ComponenCardVerticalUserTransaksi(
                          icon: state.dataTransaksi[index]['usersPhotoPembeli'].toString(), 
                          textTitle: state.dataTransaksi[index]['usersEmailPembeli'].toString(), 
                          onLongPress: () {  }, 
                          onTap: (){
                            prefs.setString('usersEmailPembeli', state.dataTransaksi[index]['usersEmailPembeli'].toString());
                            context.go(RouteName.cartProduct);
                          },
                        ),
                        Divider(height: ThemeBox.defaultHeightBox12, thickness: 1, color: kBlackColor8, indent: ThemeBox.defaultWidthBox30, endIndent: ThemeBox.defaultWidthBox30),
                      ],
                    ),
                  )
                : ComponenPageKosongBasic(
                    image: "asset/animations/cart_lottie.json", 
                    titleText: "Opss! Your Cart is Empty", 
                    messageText: "Let's find your favorite product", 
                    sizeHeight: size.height, 
                    sizeWidth: size.width,
                  )
              : ComponenContentDialog_ImageAndTitleText(
                  image: 'asset/animations/loading_dialog_lottie.json', 
                  text: '...',
                );
            },
          )
        : ComponenPageKosongBasic(
            image: "asset/animations/cart_lottie.json", 
            titleText: "Opss! Your Cart is Empty", 
            messageText: "Let's find your favorite product", 
            sizeHeight: size.height, 
            sizeWidth: size.width,
          ),
      ),
    );
  }
}