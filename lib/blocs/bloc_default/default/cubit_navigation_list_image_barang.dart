import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_navigation_list_image_barang.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

class CubitNavigationListImageBarang extends Cubit<DataStateNavigationListImageBarang> with showSnackBar{
  CubitNavigationListImageBarang() : super(DataNavigationListImageBarang(null));
  navigation({
    required String namaProduct,
    required String deskripsi,
    required String price,
    required String typeProduct,
    required XFile? image,
    required String navigation,
    required BuildContext context,
  }) async{
    if(namaProduct != 'null' && 
      deskripsi != 'null' && 
      (price != 'null' || price != '0.00') && 
      (typeProduct != 'null' || typeProduct != "All Product") && 
      image != null){
        emit(await DataNavigationListImageBarang(XFile(image.path)));
        context.go(navigation);
    }else{
      voidShowSnackBar(
        context: context, 
        color: kRedColor,
        vertical: themeBox.defaultHeightBox12,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
        borderRadius: BorderRadius.circular(themeBox.defaultRadius8),
        content: Text("Main Image kosong",
          style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
          textAlign: TextAlign.center
        ),
      );
    }
  }
}