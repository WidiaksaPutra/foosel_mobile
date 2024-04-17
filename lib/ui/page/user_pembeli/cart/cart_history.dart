// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_delete_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_detail_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_status).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_status_&_button_delete).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_header_cart.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class CartHistory extends HookWidget with DialogBasic{
  CartHistory({Key? key}) : super(key: key);

  void detailProduct(BuildContext context) async{
    context.read<CubitConnectionExample>().connectCheck(
      readBlocConnect: context.read<CubitGetTransaksiProduct>().getDataTransaksiHistory(), 
      readBlocDisconnect: context.read<CubitGetTransaksiProductLocal>().getDataTransaksi(),
    );
    context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
  }
  
  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    final statusDelete = useState<bool>(false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: PreferredHeaderCart( 
        titleCart: 'History Cart', 
        statusLeading: true, 
        onPressed: (){
          // BlocProvider.of<CubitGetTransaksiProduct>(context).close();
          context.go(RouteName.cart);
        },
      ),
      body: BlocBuilder<CubitConnectionExample, DataStateConnection>(
        builder: (context, state) => (state.connectionBoolean == true)
        ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
            builder: (context, state1){
              return (state1.dataTransaksi.isNotEmpty)
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state1.dataTransaksi.length,
                  itemBuilder: (context, index){
                  return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
                    builder: (context, stateNavDetail) => ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete(
                    connection: true,
                    textTitle: state1.dataTransaksi[index].productsName.toString(), 
                    harga: state1.dataTransaksi[index].productPrice.toString(),
                    image: state1.dataTransaksi[index].productsUrlImage.toString(), 
                    type: state1.dataTransaksi[index].productCategoriesName.toString(), 
                    status: state1.dataTransaksi[index].status.toString().toUpperCase(),
                    kondisi: state1.dataTransaksi[index].status.toString(),
                    jumlahItem: state1.dataTransaksi[index].quantity.toString(), 
                    totalHarga: state1.dataTransaksi[index].totalPrice.toString(),
                    bukanTujuanKondisi: "pending",
                    onTapCard: (){
                      context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                        jenisDetail: "TransaksiHistory",
                        readDetail:{
                          context.read<CubitGetDetailTransaksiProduct>().getDataTransaksiDetail(transactionsId: state1.dataTransaksi[index].transactionsId.toString()),
                          context.read<CubitDetailProductConnect>().getDetailProductConnect(jenisDetail: false, idProduct: state1.dataTransaksi[index].productsId.toString()),
                        }
                      );
                      context.go(stateNavDetail.navigation);
                    },
                    onTapDelete: () => voidDialogBasic(
                      context: context, 
                      margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                      padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
                      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
                      color: kBlackColor6,
                      closeIconStatus: true,
                      barrierDismissible: false,
                      contentDialog: BlocBuilder<CubitDeleteTransaksi, StateDeleteTransaksi>(
                        builder: (context, state2) => (state2.loadingDeleteTransaksi == false)
                        ? (statusDelete.value == false)
                          ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                              image: 'asset/animations/peringatan_lottie.json',
                              titleText: apakahTransaksiDihapus,
                              onTapYes: (){
                                context.read<CubitDeleteTransaksi>().deleteDataTransaksi(tokenId: state1.dataTransaksi[index].transactionsId.toString());
                                statusDelete.value = true;
                                detailProduct(context);
                                Future.delayed(Duration(seconds: 5), () async{
                                  detailProduct(context);
                                  statusDelete.value = false;
                                  Navigator.of(context).pop();
                                });
                              },
                            )
                          : (state2.statusAlert == 'berhasil')
                            ? ComponenContentDialog_ImageAndTitleText(
                                image: 'asset/animations/check_lottie.json',
                                text: 'Berhasil...',
                              )
                            : ComponenContentDialog_ImageAndTitleText(
                                image: 'asset/animations/close_lottie.json', 
                                text: 'Gagal..!',
                              )
                        : ComponenContentDialog_ImageAndTitleText(
                            image: 'asset/animations/loading_dialog_lottie.json', 
                            text: '...',
                          )
                      ),
                      onTapCloseDialog: () => Navigator.of(context).pop(), 
                    ),
                  ));}
                )
              : ComponenPageKosongBasic(
                  image: "asset/animations/cart_lottie.json", 
                  titleText: "Opss! Your Cart is Empty", 
                  messageText: "Let's find your favorite product", 
                  sizeHeight: size.height, 
                  sizeWidth: size.width,
                );
            },
          )
        : BlocBuilder<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
          builder: (context, state1){
            return (state1.dataTransaksi.isNotEmpty)
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state1.dataTransaksi.length,
                itemBuilder: (context, index){
                  return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
                    builder: (context, stateNavDetail) => ComponenCardVertical_ImageAndTextAndStatus(
                      textTitle: state1.dataTransaksi[index]["name"].toString(), 
                      harga: state1.dataTransaksi[index]['price'].toString(), 
                      connection: false,
                      image: "asset/image/disconnect_image.jpg", 
                      type: state1.dataTransaksi[index]['nameCategory'].toString(), 
                      jumlahItem: state1.dataTransaksi[index]['quantity'].toString(), 
                      totalHarga: state1.dataTransaksi[index]['totalPrice'].toString(),
                      status: state1.dataTransaksi[index]['status'].toString().toUpperCase(),
                      onTapCard: (){
                        context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                          jenisDetail: "TransaksiHistory", 
                          readDetail: context.read<CubitGetTransaksiProductLocal>().getDataTransaksiWhereId(tokenId: state1.dataTransaksi[index]['tokenTransaksi'].toString())
                        );
                        context.go(stateNavDetail.navigation);
                      },
                    ),
                  );
                }
              )
            : ComponenPageKosongBasic(
                image: "asset/animations/cart_lottie.json", 
                titleText: "Opss! Your Cart is Empty", 
                messageText: "Let's find your favorite product", 
                sizeHeight: size.height, 
                sizeWidth: size.width,
              );
          }
        ),
      ),
    );
  }
}