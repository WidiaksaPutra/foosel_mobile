// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_default/state_default/state_refresh.dart';
// class CubitRefresh extends Cubit<dynamic>{
//   CubitRefresh() : super(RefreshData(false));
//   refresh(List dataList, dynamic readData, dynamic tujuanData)async{
//     Future refreshApi({required List dataList, required dynamic readData, required dynamic tujuanData}) async{
//       dataList.clear();
//       // pages = 1;
//       readData.add(tujuanData);
//     }
//     Future.delayed(
//       const Duration(milliseconds: 500),
//       () => emit(RefreshData(refreshApi(dataList: dataList, readData: readData, tujuanData: tujuanData))),
//     );
//   }
// }