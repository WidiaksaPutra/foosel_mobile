// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
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

class DetailMessage extends StatelessWidget with navigasiRole, navigasiRoleBarRead, defaultSharedPref{
  DetailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
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
                    context.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CompenenGetBackBasic(
                          onPressed: () async{ 
                            if(state.detailMessage == true){
                              context.read<CubitDetailProductConnect>().GetDetailProductConnect(idProduct: prefs.getString('detailTokenId').toString());
                              context.go(prefs.getString('navDetailRole').toString());
                            }else{
                              navigasiRBR(context: context, value: state.roleBar);
                              navigasiR();
                              context.go(navigation);
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: themeBox.defaultWidthBox10),
                          child: BlocBuilder<cubitTitleMessageConnect, DataStateTitleMessage>(
                            builder: (context, listTitle) {
                              if(listTitle.loadingData == true){
                                return ElevatedButton(
                                  onPressed: () async{
                                    await context.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: '-');
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
                    return Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox50));
                  }
                } 
              )
            : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox50));
          }
        ),
      ),
      body: BodyDetailMessage(),
    );
  }
}