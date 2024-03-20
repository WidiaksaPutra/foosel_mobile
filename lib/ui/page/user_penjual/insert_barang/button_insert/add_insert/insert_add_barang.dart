// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/bloc/cubit_navigation_list_image_barang.dart';
import 'package:foosel/blocs/bloc_categories/main/cubit_main_data_noscroll_categories.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_image_single_access.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/user_penjual/insert_barang/default/form_insert_barang.dart';
import 'package:foosel/ui/widgets/componen_list_view.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InsertAddBarangPenjual extends HookWidget with SharedPref, ImageSingleAccess{

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    var image = useState<XFile?>(null);
    sharedPref();
    context.read<CubitConnectionExample>().connectCheck(readBlocConnect: {},readBlocDisconnect: {});
    context.read<CubitMainDataNoscrollCategories>().fetchCategoriesNoscroll();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: BlocBuilder<CubitConnectionExample, DataStateConnection>(
          builder: (context, state) => (state.connectionBoolean == false)
          ? ComponenPageKosongBasic(
              image: "asset/animations/wifi_disconnect.json", 
              titleText: "Aplikasi Sedang Disconnect...!", 
              messageText: "priksa koneksi internet anda...!", 
              sizeHeight: size.height, 
              sizeWidth: size.width,
            )
          : LayoutBuilder(//kegunaannya mirip dengan mediaQuery, perbedaannya mediaQuery mengambil ukuran layar device lengkap,
            //layoutBuilder mengambil dan menentukan ukuran widget max dan min, dan digunakan harus dengan ConstrainedBox
            builder: (context, constraint){
              return ComponenListViewVertical(
                sizeHeightBox: constraint.maxHeight-ThemeBox.defaultHeightBox70, 
                content: Container(
                  margin: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox50),
                  child: Column(
                    children: [
                      Expanded(child: FormInsertBarang(statusUpdateFormBarang: false)),
                      SizedBox(height: ThemeBox.defaultHeightBox30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox4),
                              decoration: BoxDecoration(
                                color: kPurpleColor,
                                borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                              ),
                              child: TextButton(
                                onPressed: () async{
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
                          SizedBox(width: ThemeBox.defaultWidthBox20),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox4),
                              decoration: BoxDecoration(
                                color: kPurpleColor,
                                borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                              ),
                              child: TextButton(
                                onPressed: (){
                                  context.read<BlocFormButtonNotNullBarang>().add(ButtonFormProducts(
                                    context: context, 
                                    description: prefs.getString('deskripsi').toString(), 
                                    image: image.value,
                                    images: [],
                                    nameProduct: prefs.getString('namaProduct').toString(), 
                                    price: prefs.getString('price').toString(),
                                    type: prefs.getString('typeProduct').toString(),
                                    tokenId: '', oldImage: '',
                                  ));
                                  BlocFormButtonNotNullBarang().close();
                                  context.read<CubitNavigationListImageBarang>().navigation(
                                    context: context, 
                                    deskripsi: prefs.getString('deskripsi').toString(), 
                                    price: prefs.getString('price').toString(),
                                    namaProduct: prefs.getString('namaProduct').toString(),
                                    typeProduct: prefs.getString('typeProduct').toString(), 
                                    image: image.value,
                                    navigation: RouteName.headAddImage,
                                  );
                                },
                                child: Text("Add Image", style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                              ),  
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ThemeBox.defaultHeightBox30),
                    ],
                  ), 
                ),         
              );
            },),
        ),
      ),
    );
  }
}