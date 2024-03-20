// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_delete_product/cubit_delete_product.dart';
import 'package:foosel/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_button_update_delete).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeMenuActionCardProductPenjual extends HookWidget with DialogBasic, NavigasiRole, NavigasiRoleBarRead, ShowSnackBar{
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

  void navigationRole(BuildContext context){
    navigasiRBR(context: context, value: 0);
    navigasiR();
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    final statusDelete = useState(false);
    return ComponenCardVertical_ImageAndTextAndButtonUpdateDelete(
      type: type, 
      nama: nama,
      harga: harga,
      gambar: gambar, 
      connection: true,
      onTapImage: onTapImage,
      onTapDelete: () {
        voidDialogBasic(
          context: context, 
          margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
          color: kBlackColor6,
          closeIconStatus: true,
          barrierDismissible: false,
          contentDialog: BlocBuilder<CubitDeleteProduct, StateDeleteProduct>(
            builder: (context, state) => (state.loadingDeleteProduct == false)
            ? (statusDelete.value == false)
              ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                  image: 'asset/animations/peringatan_lottie.json',
                  titleText: apakahProductDihapus,
                  onTapYes: () async{
                    await context.read<CubitDeleteProduct>().deleteDataProduct(
                      idProduct: idProduct, 
                      image: gambar,
                    );
                    await context.read<CubitUpButton>().upButton(
                      currentBody: 0, 
                      currentTop: 0,
                      readBloc: {context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: "0"))}, 
                      index: 0,
                    );
                    navigationRole(context);
                    context.go(navigation);
                    statusDelete.value = true;
                    Future.delayed(
                      Duration(seconds: 5),
                      (){
                        Navigator.of(context).pop();
                        statusDelete.value = false;
                      },
                    );
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
                image: 'asset/animations/loading_dialog_lottie.json', 
                text: '...',
              ),
          ),
          onTapCloseDialog: () => Navigator.of(context).pop(), 
        );
      },
      onTapUpdate: () async{
        await context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: idProduct);
        context.go(RouteName.updateBarangPenjual);
      },
    );
  }
}