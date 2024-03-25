// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_navigation_list_image_barang.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_default/state/state_navigation_list_image_barang.dart';
import 'package:foosel/blocs/bloc_update_product/main/bloc_upload_update_product.dart';
import 'package:foosel/blocs/bloc_update_product/state_update_barang.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/connection/connection_profile.dart';
import 'package:foosel/ui/page/user_penjual/insert_barang/default/body_insert_image.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class HeadInsertUpdateImage extends HookWidget with SharedPref, NavigasiRole, NavigasiRoleBarRead, ShowSnackBar{
  HeadInsertUpdateImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    navigasiRBR(context: context, value: 0);
    navigasiR();

    final ImagePicker imagePicker = ImagePicker();
    var imageFileList = useState([]);

    selectImage() async{
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage(maxWidth: 800, maxHeight: 600);
      if(selectedImages!.isNotEmpty){
        for(var img in selectedImages){
          File file = File(img.path);
          imageFileList.value = [...imageFileList.value, file];
        }    
      }
    }

    selectImageCamera() async{
      final XFile? image = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 800, maxHeight: 600);
      if(image != 'null'){
        File file = File(image!.path);
        imageFileList.value = [...imageFileList.value, file];
      }
    }

    Widget title() => Expanded(
      child: Text("Add Image",
        style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont18)
        , overflow: TextOverflow.ellipsis,
      ),
    );

    Widget getUpdate() => BlocBuilder<CubitNavigationListImageBarang, DataStateNavigationListImageBarang>(
      builder: (BuildContext context, state) => IconButton(
        onPressed: () async{
          await sharedPref();
          if(imageFileList.value.length > 5 || imageFileList.value.isEmpty){
            imageFileList.value = [];
          }else{
            context.read<BlocUploadUpdateProduct>().add(
              ButtonFormProducts(
                nameProduct: prefs.getString('namaProduct').toString(),
                description: prefs.getString('deskripsi').toString(), 
                price: prefs.getString('price').toString(),
                type: prefs.getString('indexDropdown').toString(),
                image: state.image,
                images: imageFileList.value,
                context: context,
                tokenId: prefs.getString('tokenId').toString(), 
                oldImage: prefs.getString('oldImage').toString(),
              ),
            );
            context.read<CubitUpButton>().upButton(
              currentBody: 0, 
              currentTop: 0,
              readBloc: {context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: "0"))}, 
              index: 0,
            );
          }
        },
        icon: Image.asset(
          "asset/icon/submit_icon.png",
          height: ThemeBox.defaultHeightBox13,
          width: ThemeBox.defaultWidthBox18,
        ),
      ),
    );

    PreferredSizeWidget header(){
      ClassConnectionDialog connection = ClassConnectionDialog();
      return AppBar(
        toolbarHeight: ThemeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: ConnectionHomeProfile(
          connection: connection.basicConnection,
          childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
          ? BlocBuilder<BlocUploadUpdateProduct, StateUpdateBarang>(
              builder: (context, stateUploadSnack){
                return (stateUploadSnack.loading == false)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CompenenGetBackX(onPressed: () => context.go(navigation)),
                      title(),
                      getUpdate(),
                    ]
                  )
                : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50));
              }
            )
          : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50)),
          childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompenenGetBackX(onPressed: () => context.go(navigation)),
                title(),
                SizedBox(
                  width: ThemeBox.defaultWidthBox45,
                )
              ]
            )
          : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: header(),
      body: BlocConsumer<BlocUploadUpdateProduct, StateUpdateBarang>(
        listener: (context, stateUploadSnack){
          if(stateUploadSnack.loading == false && stateUploadSnack.snackBar == true){
            voidShowSnackBar(
              context: context,
              color: (stateUploadSnack.responApi == "berhasil") ? kGreenColor : kRedColor,
              vertical: ThemeBox.defaultHeightBox12,
              borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 1000),
              content: (stateUploadSnack.responApi == "berhasil")
              ? Text(snackBarProdukBerhasil,
                  style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
                  textAlign: TextAlign.center
                )
              : Text(snackBarProdukGagal,
                  style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
                  textAlign: TextAlign.center
                ),
            );
            if(stateUploadSnack.responApi == "berhasil"){
              context.go(navigation);
            }
          }
        },
        builder: (context, stateUploadSnack){
          return (stateUploadSnack.loading == false)
          ? BodyAddImage(
              imageFileList: imageFileList.value,
              selectImage: selectImage, 
              selectImageCamera: selectImageCamera,
            ) 
          : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
        } 
      )
    );
  }
}