import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_logout/state_logout.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_update_user_firebase.dart';
import 'package:foosel/helpers/categories/interfaces/interface_delete_data_category_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_delete_data_like_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/service/api_logout/interface_get_logout.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitLogout extends Cubit<StateDataLogout> with NavigasiRole{
  final InterfaceGetLogout _dataGetLogout = getItInstance<InterfaceGetLogout>();
  final InterfaceUpdateUserFirebase _dataUpdateUserFirebase = getItInstance<InterfaceUpdateUserFirebase>();
  final InterfaceDeleteDataLikeLocal _dataDeleteLike = getItInstance<InterfaceDeleteDataLikeLocal>();
  final InterfaceDeleteDataTransaksiLocal _dataTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  final InterfaceDeleteDataProductTransaksiLocal _dataDeleteProductTransaksi = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  final InterfaceDeleteDataCategoryLocal _dataDeleteCategoryLocal = getItInstance<InterfaceDeleteDataCategoryLocal>();
  CubitLogout() : super(DataLogout(loadingLogout: false));
  logout({required BuildContext context}) async{
    navigasiR();
    emit(DataLogout(loadingLogout: true));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final statusLogout = await _dataGetLogout.getLogout(); 
    if(await statusLogout == "berhasil"){
      await _dataUpdateUserFirebase.updateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Offline");
      await _dataDeleteLike.deleteDataLikeLocal();
      await _dataTransaksiLocal.deleteDataTransaksiLocal();
      await _dataDeleteProductTransaksi.deleteDataProductTransaksiLocal();
      await _dataDeleteCategoryLocal.deleteDataCategoryLocal();
      prefs.remove('emailPenerima');
      prefs.remove('detailTokenId');
      prefs.remove('navDetailRole');
      prefs.remove('token');
      prefs.remove('fcmToken');
      prefs.remove('homeUpConnect');
      prefs.remove('email');
      prefs.remove("navBadges");
      prefs.remove("categoriesIdConnect");
      prefs.remove("categoriesIdDisconnect");
      context.go(RouteName.homeGuest);
      emit(DataLogout(loadingLogout: false));
    }
  }
}