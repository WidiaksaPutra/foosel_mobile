// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_title_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/page/message/detail_message/body_detail_message.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/ui/widgets/componen_header_status.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailMessage extends HookWidget with NavigasiRole, NavigasiRoleBarRead, SharedPref{
  DetailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    sharedPref();
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: AppBar(
        toolbarHeight: ThemeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: BlocBuilder<CubitNavMessageDetail, DataStateNavMessageDetail>(
          builder: (context, state){
            return (state.tokenPenerima != "" && state.loadingMessage == false)
            ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: context.read<CubitListMessageConnect>().getStreamFirebaseListMessage,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    context.read<CubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CompenenGetBackBasic(
                          onPressed: () async{ 
                            if(state.detailMessage == true){
                              context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: prefs.getString('detailTokenId').toString());
                              context.go(prefs.getString('navDetailRole').toString());
                            }else{
                              navigasiRBR(context: context, value: state.roleBar);
                              navigasiR();
                              context.go(navigation);
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox10),
                          child: BlocBuilder<CubitTitleMessageConnect, DataStateTitleMessage>(
                            builder: (context, listTitle) {
                              if(listTitle.loadingData == true){
                                return ElevatedButton(
                                  onPressed: () async{
                                    await context.read<CubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                                  },
                                  child: Text('Refresh Title'),
                                );
                              }else{
                                return ComponenHeaderImageTitleStatus(
                                  image: listTitle.image, 
                                  status: listTitle.status, 
                                  title: listTitle.title,
                                );
                              }
                            },
                          ),
                        ),
                      ]
                    );
                  }else{
                    return Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50));
                  }
                } 
              )
            : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50));
          }
        ),
      ),
      body: BodyDetailMessage(),
    );
  }
}