import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_like/interfaces_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitGetLike extends Cubit<DataStateGetLike> with getLike{
  final interfaceGetDataLikeLocal dataLike = getItInstance<interfaceGetDataLikeLocal>();
  CubitGetLike() : super(DataGetLike(loadingLike: true, getData: []));
  
  @override
  GetDataLike() async {
    emit(DataGetLike(loadingLike: true, getData: []));
    final dataLocal = await dataLike.GetDataLikeLocal();
    emit(DataGetLike(loadingLike: false, getData: dataLocal));
  }
  
  @override
  GetDataLikeWhereIdLocal({required String tokenId}) async {
    emit(DataGetLike(loadingLike: true, getData: []));
    final dataLocal = await dataLike.GetDataLikeWhereIdLocal(tokenId: tokenId);
    emit(DataGetLike(loadingLike: false, getData: dataLocal));
  }
}