// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_title_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/state_message.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/message/detail_message/body_detail_message.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_get_back.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header_status.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailMessage extends HookWidget with navigasiRole, navigasiRoleBarRead{
  DetailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigasiR();
    final navBack = useState("-");
    final loadingTitle = useState(true);
    final imageTitle = useState("-");
    final statusTitle = useState("-");
    final nameTitle = useState("-");
    // final readListMessage = useState(context.read<cubitListMessageConnect>().getStreamFirebaseListMessage);
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: AppBar(
        toolbarHeight: themeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: BlocBuilder<cubitNavMessageDetail, DataStateNavMessageDetail>(
          builder: (context, state){
            return (state.tokenPenerima != "" && state.loadingMessage == false)
            ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: context.read<cubitListMessageConnect>().getStreamFirebaseListMessage,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    if(state.detailMessage == false){
                      context.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CompenenGetBackBasic(
                          onPressed: () async{ 
                            if(state.detailMessage == false){
                              navigasiRBR(context: context, value: state.roleBar);
                              navBack.value = navigation;
                            }else{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              context.read<CubitDetailProductConnect>().GetDetailProductConnect(prefs.getString('detailTokenId').toString());
                              navBack.value = prefs.getString('navDetailRole').toString();
                            }
                            context.go(navBack.value);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: themeBox.defaultWidthBox10),
                          child: BlocBuilder<cubitTitleMessageConnect, DataStateTitleMessage>(
                            builder: (context, listTitle) {
                              if(listTitle.loadingData == true){
                                // context.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                                return ElevatedButton(
                                  onPressed: () {
                                    context.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                                  },
                                  child: Text('Refresh Title'),
                                );
                              }else{
                                loadingTitle.value = false;
                                imageTitle.value = listTitle.image;
                                statusTitle.value = listTitle.status;
                                nameTitle.value = listTitle.title;
                                return ComponenHeaderImageTitleStatus(image: imageTitle.value, status: statusTitle.value, title: nameTitle.value);
                              }
                            },
                          ),
                        ),
                      ]
                    );
                  }else{
                    return const ComponenLoadingBasic(colors: kPurpleColor);
                  }
                } 
              )
            : ComponenLoadingBasic(colors: kPurpleColor);
          }
        ),
      ),
      body: BodyDetailMessage(),
    );
  }
}

// Future onRefresh(){
//   return 
// }