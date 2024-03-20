import 'package:foosel/helpers/like/helper_like.dart';
import 'package:foosel/helpers/like/interfaces/interface_delete_data_like_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_insert_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionLikeLocal(){
  if(!getItInstance.isRegistered<InterfaceGetDataLikeLocal>()){
    getItInstance.registerFactory<InterfaceGetDataLikeLocal>(() => HelperLike());
  }
  if(!getItInstance.isRegistered<InterfaceInsertDataLikeLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataLikeLocal>(() => HelperLike());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteDataLikeLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataLikeLocal>(() => HelperLike());
  }
}