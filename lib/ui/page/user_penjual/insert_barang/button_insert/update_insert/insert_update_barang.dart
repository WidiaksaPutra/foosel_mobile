// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/bloc_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/default/cubit_navigation_list_image_barang.dart';
import 'package:foosel/blocs/bloc_categories/main/cubit_main_data_noscroll_categories.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/event_default/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_image_single_access.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_update_product/mixin/mixin_form_button_update_not_null.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/user_penjual/insert_barang/default/form_insert_barang.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/ui/widgets/componen_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InsertUpdateBarangPenjual extends HookWidget with defaultSharedPref, navigasiRole, navigasiRoleBarRead, imageSingleAccess, formButtonUpdateNotNull{
  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 0);
    await navigasiR();
  }
  @override
  Widget build(BuildContext context) {
    navigationRole(context);
    var image = useState<XFile?>(null);
    sharedPref();
    context.read<CubitMainDataNoscrollCategories>().fetchCategoriesNoscroll();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: themeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CompenenGetBackBasic(onPressed: () async{
              prefs.setBool('statusUpdateNull', true);
              context.go(navigation);
            }),
            Text("Update Product", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont18)),
          ]
        )
      ),
      body: SafeArea(
        child: LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
          //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
          builder: (context, constraint){
            return ComponenListViewVertical(
              sizeHeightBox: constraint.maxHeight-themeBox.defaultHeightBox70, 
              content: Container(
                margin: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
                child: BlocBuilder<CubitDetailProductConnect, DataStateProducts>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(child: FormInsertBarang(
                          hintNameProduct: state.dataProducts.name.toString(),
                          hintDropdownProduct: state.dataProducts.category!.name.toString(),
                          hintDropdownIdProduct: state.dataProducts.category!.id.toString(),
                          hintDeskripsiProduct: state.dataProducts.description.toString(), 
                          hintHargaProduct: formatCurrencyNotSymbol.format(double.parse(state.dataProducts.price.toString()).toInt()), 
                          statusUpdateFormBarang: true,
                        )),
                        SizedBox(height: themeBox.defaultHeightBox30),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox4),
                                decoration: BoxDecoration(
                                  color: kPurpleColor,
                                  borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                                ),
                                child: TextButton(
                                  onPressed: () async{
                                    formUpdateNotNull(
                                      nameProduct: state.dataProducts.name.toString(), 
                                      price: state.dataProducts.price.toString(), 
                                      type: state.dataProducts.category!.name.toString(), 
                                      typeId: state.dataProducts.category!.id.toString(), 
                                      description: state.dataProducts.description.toString(),
                                    );
                                    context.read<BlocFormButtonNotNullBarang>().add(ButtonFormProducts(
                                      context: context, 
                                      description: prefs.getString('deskripsi').toString(), 
                                      image: image.value,
                                      images: [],
                                      nameProduct: prefs.getString('namaProduct').toString(), 
                                      price: prefs.getString('price').toString(), 
                                      type: prefs.getString('typeProduct').toString(),
                                      tokenId: '', oldImage: ''),
                                    );
                                    BlocFormButtonNotNullBarang().close();
                                    image.value = await imageSingle(
                                      namaProduct: prefs.getString('namaProduct').toString(), 
                                      deskripsi: prefs.getString('deskripsi').toString(), 
                                      price: prefs.getString('price').toString(), 
                                      typeProduct: prefs.getString('typeProduct').toString(), 
                                    );
                                  },
                                  child: Text("Main Image", style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                                ),    
                              ),
                            ),
                            SizedBox(width: themeBox.defaultWidthBox20),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox4),
                                decoration: BoxDecoration(
                                  color: kPurpleColor,
                                  borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    prefs.setString('tokenId', state.dataProducts.tokenId.toString());
                                    prefs.setString('oldImage', state.dataProducts.urlImage.toString());
                                    context.read<BlocFormButtonNotNullBarang>().add(ButtonFormProducts(
                                      context: context, 
                                      description: prefs.getString('deskripsi').toString(), 
                                      image: image.value,
                                      images: [],
                                      nameProduct: prefs.getString('namaProduct').toString(), 
                                      price: prefs.getString('price').toString(),
                                      type: prefs.getString('typeProduct').toString(),
                                      tokenId: state.dataProducts.tokenId.toString(),
                                      oldImage: state.dataProducts.urlImage.toString()),
                                    );
                                    BlocFormButtonNotNullBarang().close();
                                    context.read<CubitNavigationListImageBarang>().navigation(
                                      context: context, 
                                      deskripsi: prefs.getString('deskripsi').toString(), 
                                      price: prefs.getString('price').toString(),
                                      namaProduct: prefs.getString('namaProduct').toString(),
                                      typeProduct: prefs.getString('typeProduct').toString(), 
                                      image: image.value,
                                      navigation: RouteName.headUpdateImage
                                    );
                                  },
                                  child: Text("Add Image", style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                                ),  
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: themeBox.defaultHeightBox30),
                      ],
                    );
                  },
                ) 
              ),         
            );
          },
        ),
      ),
    );
  }
}