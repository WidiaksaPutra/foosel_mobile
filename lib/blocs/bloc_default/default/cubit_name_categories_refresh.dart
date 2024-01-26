import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_refresh.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_categories.dart';

class CubitRefresh extends Cubit<dynamic> with apiCategories{
  CubitRefresh() : super(RefreshData(false));
  refresh(List dataList, dynamic readData, dynamic tujuanData)async{
    Future refreshApi({required List dataList, required dynamic readData, required dynamic tujuanData}) async{
      dataList.clear();
      // pages = 1;
      readData.add(tujuanData);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    emit(RefreshData(refreshApi(dataList: dataList, readData: readData, tujuanData: tujuanData)));
  }
}