import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_default/state/state_navigation_list_image_barang.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foosel/shared/theme_box.dart';

class CubitNavigationListImageBarang extends Cubit<DataStateNavigationListImageBarang> with ShowSnackBar{
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
      ThemeBox(context);
      voidShowSnackBar(
        context: context, 
        color: kRedColor,
        vertical: ThemeBox.defaultHeightBox12,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8),
        content: Text("Main Image kosong",
          style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
          textAlign: TextAlign.center
        ),
      );
    }
  }
}