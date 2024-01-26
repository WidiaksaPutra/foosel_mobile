// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/cubit_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_button_update_delete).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeMenuActionCardProductPenjual extends HookWidget with dialogBasic, navigasiRole, navigasiRoleBarRead, showSnackBar{
  late String type, nama, harga, gambar, idProduct;
  late VoidCallback onTapImage;
  HomeMenuActionCardProductPenjual({Key? key,
    required this.type,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.idProduct,
    required this.onTapImage,
  }) : super(key: key);

  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 0);
    await navigasiR();
  }

  @override
  Widget build(BuildContext context) {
    final statusDelete = useState(false);
    return ComponenCardVertical_ImageAndTextAndButtonUpdateDelete(
      type: type, 
      nama: nama,
      harga: harga,
      gambar: "${Api.baseURLImage}$gambar", 
      connection: true,
      onTapImage: onTapImage,
      onTapDelete: () {
        voidDialogBasic(
          context: context, 
          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
          borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
          color: kBlackColor6,
          closeIconStatus: true,
          barrierDismissible: false,
          contentDialog: BlocBuilder<cubitDeleteProduct, StateDeleteProduct>(
            builder: (context, state) => (state.loadingDeleteProduct == false)
            ? (statusDelete.value == false)
              ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                  image: 'asset/animations/peringatan_lottie.json',
                  titleText: apakahProductDihapus,
                  onTapYes: () async{
                    await context.read<cubitDeleteProduct>().DeleteDataProduct(
                      context: context, 
                      idProduct: idProduct, 
                      image: gambar,
                    );
                    navigationRole(context);
                    context.go(navigation);
                    statusDelete.value = true;
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.of(context).pop();
                    statusDelete.value = false;
                  },
                )
              : (state.statusAlert == 'berhasil')
                ? ComponenContentDialog_ImageAndTitleText(
                    image: 'asset/animations/check_lottie.json',
                    text: 'Berhasil...',
                  )
                : ComponenContentDialog_ImageAndTitleText(
                    image: 'asset/animations/close_lottie.json', 
                    text: 'Gagal..!',
                  )
            : ComponenContentDialog_ImageAndTitleText(
                image: 'asset/animations/loading_lottie.json', 
                text: '...',
              )
          ),
          onTapCloseDialog: () => Navigator.of(context).pop(), 
        );
      },
      onTapUpdate: () async{
        await context.read<CubitDetailProductConnect>().GetDetailProductConnect(idProduct);
        context.go(RouteName.updateBarangPenjual);
      },
    );
  }
}