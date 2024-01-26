import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_column(crossStart_white_and_gray2_&_font18_and_font12_&_semi_bold_and_regular).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_carousel_slider_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_container_harga.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_deskripsi_detail.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_small_horizontal.dart';
import 'package:go_router/go_router.dart';

class DetailProductGuest extends HookWidget{
  DetailProductGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final listImageProduct = useState([]);
    final loading = useState(true);
    return Scaffold(
      backgroundColor: kGreyColor6,
      body: BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
        listener: (context, state){
          if(state.loading == false){
            for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
              listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
            }
            loading.value = state.loading;
          }
        },
        builder: (context, state){
          return (loading.value == false)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerDetailProduct(
                  context: context,
                  guestUser: true,
                  onPressedBack: () {
                    context.go(RouteName.homeGuest);
                  },
                  onPressedChart: () {},
                ),
                ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: themeBox.defaultHeightBox17),
                    padding: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, bottom: themeBox.defaultHeightBox30),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(themeBox.defaultRadius24), topRight: Radius.circular(themeBox.defaultRadius24))
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
                            title: state.dataProducts.name.toString(), 
                            content: state.dataProducts.category!.name.toString(),
                          ),
                          ComponenContainerHarga(titleHarga: "Price starts from", harga: state.dataProducts.price.toString()),
                          ComponenDeskripsiDetail(titleDeskripsi: "Description", deskripsi: state.dataProducts.description.toString()),
                          ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : ComponenLoadingBasic(colors: kPurpleColor);
        }
      ),
    );
  }
}