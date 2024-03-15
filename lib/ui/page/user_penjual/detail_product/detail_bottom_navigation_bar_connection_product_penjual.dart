// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:foosel/blocs/bloc_delete_product/cubit_delete_product.dart';
import 'package:foosel/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class DetailBottomNavigationBarConnectionProductPenjual extends HookWidget with dialogBasic, navigasiRole, navigasiRoleBarRead, showSnackBar{
  DetailBottomNavigationBarConnectionProductPenjual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusDelete = useState(false);
    return BlocBuilder<CubitDetailProductConnect, DataStateProducts>(
      builder: (context1, state) => Container(
        padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
        color: kPrimaryColor,
        child: (state.jenisDetail == true)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ComponenBasicButton(
                paddingVertical: themeBox.defaultHeightBox10, 
                borderRadius: themeBox.defaultRadius5, 
                content: Text("Update", style: blackTextStyle.copyWith(fontWeight: regular)), 
                onPressed: () async{
                  await context.read<CubitDetailProductConnect>().GetDetailProductConnect(idProduct: state.dataProducts.tokenId.toString());
                  await context.read<cubitUpButton>().upButton(
                    currentBody: 0, 
                    currentTop: 0,
                    readBloc: {context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: "0"))}, 
                    index: 0,
                  );
                  context.go(RouteName.updateBarangPenjual);
                }, 
                primaryColor: kYellowColor, 
                secondaryColor: kGreyColor,
              ),
              ComponenBasicButton(
                paddingVertical: themeBox.defaultHeightBox10, 
                borderRadius: themeBox.defaultRadius5, 
                content: Text("Delete", style: blackTextStyle.copyWith(fontWeight: regular)), 
                onPressed: () {
                  voidDialogBasic(
                    context: context, 
                    margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                    padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                    color: kBlackColor6,
                    closeIconStatus: true,
                    barrierDismissible: false,
                    contentDialog: BlocBuilder<cubitDeleteProduct, StateDeleteProduct>(
                      builder: (context2, state2) => (state2.loadingDeleteProduct == false)
                      ? (statusDelete.value == false)
                        ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                            image: 'asset/animations/peringatan_lottie.json',
                            titleText: apakahProductDihapus,
                            onTapYes: () async{
                              await context.read<cubitDeleteProduct>().DeleteDataProduct(
                                idProduct: state.dataProducts.tokenId.toString(), 
                                image: state.dataProducts.urlImage.toString(),
                              );
                              await context.read<cubitUpButton>().upButton(
                                currentBody: 0, 
                                currentTop: 0,
                                readBloc: {context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: "0"))}, 
                                index: 0,
                              );
                              await navigasiRBR(context: context, value: 0);
                              await navigasiR();
                              context.go(navigation);
                              statusDelete.value = true;
                              Future.delayed(
                                Duration(seconds: 2),
                                (){
                                  Navigator.of(context).pop();
                                  statusDelete.value = false;
                                } 
                              );
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
                        ),
                    ),
                    onTapCloseDialog: () => Navigator.of(context).pop(), 
                  );
                }, 
                primaryColor: kRedColor, 
                secondaryColor: kGreyColor,
              ),
            ],
          )
        : SizedBox(),
      ),
    );
  }
}