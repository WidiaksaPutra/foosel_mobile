import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_logout/state_logout.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_category_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_like_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/service/interface_get_logout.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cubitLogout extends Cubit<StateDataLogout> with navigasiRole{
  final interfaceGetLogout dataGetLogout = getItInstance<interfaceGetLogout>();
  final interfaceUpdateUserFirebase dataUpdateUserFirebase = getItInstance<interfaceUpdateUserFirebase>();
  final interfaceDeleteDataLikeLocal dataDeleteLike = getItInstance<interfaceDeleteDataLikeLocal>();
  final interfaceDeleteDataTransaksiLocal dataTransaksiLocal = getItInstance<interfaceDeleteDataTransaksiLocal>();
  final interfaceDeleteDataProductTransaksiStorageLocal dataDeleteProductTransaksi = getItInstance<interfaceDeleteDataProductTransaksiStorageLocal>();
  final interfaceDeleteDataCategoryStorageLocal dataDeleteCategoryLocal = getItInstance<interfaceDeleteDataCategoryStorageLocal>();
  cubitLogout() : super(DataLogout(loadingLogout: false));
  logout({required BuildContext context}) async{
    navigasiR();
    emit(DataLogout(loadingLogout: true));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final statusLogout = await dataGetLogout.GetLogout(); 
    if(await statusLogout == "berhasil"){
      await dataUpdateUserFirebase.UpdateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Offline");
      await dataDeleteLike.DeleteDataLikeLocal();
      await dataTransaksiLocal.DeleteDataTransaksiLocal();
      await dataDeleteProductTransaksi.DeleteDataProductTransaksiLocal();
      await dataDeleteCategoryLocal.DeleteDataCategoryLocal();

      prefs.remove('emailPenerima');
      prefs.remove('detailTokenId');
      prefs.remove('navDetailRole');
      prefs.remove('token');
      prefs.remove('fcmToken');
      prefs.remove('homeUpConnect');
      prefs.remove('email');
      prefs.remove("navBadges");
      context.go(RouteName.homeGuest);
      emit(DataLogout(loadingLogout: false));
    }
  }
}