// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_categories/main/cubit_main_data_noscroll_categories.dart';
// import 'package:foosel/blocs/bloc_categories/state_categories.dart';
// import 'package:foosel/blocs/bloc_default/default/cubit_form_not_null_barang.dart';
// import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
// import 'package:foosel/shared/theme_box.dart';
// import 'package:foosel/ui/widgets/componen_advanced/componen_text_drop_down.dart';
// import 'package:foosel/ui/widgets/componen_loading.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// class DropdownTypeData extends HookWidget with DefaultSharedPref{
//   late String namaType;
//   late String? indexType;
//   late bool? update;
//   DropdownTypeData({Key? key, 
//     this.update = false,
//     this.indexType = '',
//     required this.namaType,
//   }) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     ThemeBox(context);
//     var listData = useState([]);
//     var first = useState<String>("");

//     if(namaType == ''){
//       first.value = "All Product";
//     }else{
//       first.value = namaType;
//     }

//     void dropDownClick({
//       required dynamic value,
//       required List<String> list,
//     }) async{
//       prefs = await SharedPreferences.getInstance();
//       for(int index = 0; index < list.length; index++){
//         if(value.toString() == list[index].toString()){
//           String indexDrop = (index+1).toString();
//           prefs.setString("indexDropdown", indexDrop);
//           break;
//         }
//       };
//       list.clear();
//       listData.value = [];
//       first.value = value.toString();
//       prefs.setString('typeProduct', value.toString());
//       context.read<CubitFormNotNullBarang>().typeProductValidasiEmpty;
//     }

//     return Expanded(
//       child: BlocBuilder<CubitMainDataNoscrollCategories, DataStateCategoriNameNoscroll>(
//         builder: (context, state){
//           if(state.dataNameCategory.isNotEmpty && listData.value.isEmpty){
//             listData.value = [];
//             for(var index = 0; index < state.dataNameCategory.length; index++){
//               listData.value = [...listData.value, state.dataNameCategory[index].toString()];
//             }
//           }
//           return (state.loading == true && state.dataNameCategory.isNotEmpty)
//           ? ComponenTextDropDown(labelText: "Type Product", list: listData.value,
//             viewDropdownButton: first.value.toString(), onClicked: dropDownClick)
//           : ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50);
//         }
//       ),
//     );
//   }
// }