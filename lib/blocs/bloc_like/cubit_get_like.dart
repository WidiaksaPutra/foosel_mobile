import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_like/interfaces_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitGetLike extends Cubit<DataStateGetLike> implements GetLike{
  final InterfaceGetDataLikeLocal _dataLike = getItInstance<InterfaceGetDataLikeLocal>();
  CubitGetLike() : super(DataGetLike(loadingLike: true, getData: []));
  
  @override
  Future<void> getDataLike() async {
    emit(DataGetLike(loadingLike: true, getData: []));
    final _dataLocal = await _dataLike.getDataLikeLocal();
    emit(DataGetLike(loadingLike: false, getData: _dataLocal));
  }
  
  @override
  Future<void> getDataLikeWhereIdLocal({required String tokenId}) async {
    emit(DataGetLike(loadingLike: true, getData: []));
    final _dataLocal = await _dataLike.getDataLikeWhereIdLocal(tokenId: tokenId);
    emit(DataGetLike(loadingLike: false, getData: _dataLocal));
  }
}