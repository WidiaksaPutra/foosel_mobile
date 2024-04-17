import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/bloc_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_add_product/main/bloc_upload_add_product.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_basic.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_navigasi.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_form_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_navigation_list_image_barang.dart';
import 'package:foosel/blocs/bloc_list_products/main/bloc_main_all_products_connect.dart';
import 'package:foosel/blocs/bloc_list_products/main/cubit_main_list_all_products_disconnect.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:foosel/blocs/bloc_categories/main/cubit_connection_name_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/cubit_main_data_noscroll_categories.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection.dart';
import 'package:foosel/blocs/bloc_delete_product/cubit_delete_product.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:foosel/blocs/bloc_like/cubit_get_like.dart';
import 'package:foosel/blocs/bloc_like/cubit_insert_like.dart';
import 'package:foosel/blocs/bloc_like/cubit_like.dart';
import 'package:foosel/blocs/bloc_login/main/bloc_main_button_login.dart';
import 'package:foosel/blocs/bloc_login/main/bloc_main_data_login.dart';
import 'package:foosel/blocs/bloc_login/main/cubit_main_form_login.dart';
import 'package:foosel/blocs/bloc_logout/cubit_logout.dart';
import 'package:foosel/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_delete_messege.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_jumlah_badges.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_title_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:foosel/blocs/bloc_register/main/bloc_main_button_register.dart';
import 'package:foosel/blocs/bloc_register/main/bloc_main_data_register.dart';
import 'package:foosel/blocs/bloc_register/main/cubit_main_form_register.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_delete_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_detail_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_user_pembeli.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_patch_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_post_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_delete_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_insert_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_update_transaksi.dart';
import 'package:foosel/blocs/bloc_update_product/main/bloc_upload_update_product.dart';
import 'package:foosel/blocs/bloc_user/cubit_connection_main_user.dart';
import 'package:foosel/blocs/bloc_user/main/connect/bloc_main_update_user_connect.dart';
import 'package:foosel/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:foosel/blocs/bloc_user/main/disconnect/cubit_main_user_disconnect.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/injection_componen_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/injection_chat_firebase.dart';
import 'package:foosel/firebase/api_notification/injection_notification_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/injection_user_firebase.dart';
import 'package:foosel/helpers/categories/injection_categories_local.dart';
import 'package:foosel/helpers/like/injection_like_local.dart';
import 'package:foosel/helpers/products/injection_product_local.dart';
import 'package:foosel/helpers/transaksi/injection_transaksi_local.dart';
import 'package:foosel/helpers/user/injection_user_local.dart';
import 'package:foosel/routes/page_routes.dart';
import 'package:foosel/service/api_categories/injection_categories.dart';
import 'package:foosel/service/api_login/injection_login.dart';
import 'package:foosel/service/api_logout/injection_logout.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/service/api_register/injection_register.dart';
import 'package:foosel/service/api_transaksi/injection_transaksi.dart';
import 'package:foosel/service/api_user/injection_user.dart';
class MultiBlocProviderGetX extends StatelessWidget {
  const MultiBlocProviderGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocButtonLogin(),
        ),
        BlocProvider(
          create: (context) => CubitFormLogin(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserFirebase();
            setupDInjectionUser();
            setupDInjectionLogin();
            return BlocButtonLoginData();
          },
        ),
        BlocProvider(
          create: (context) => BlocButtonRegisterUser(),
        ),
        BlocProvider( 
          create: (context) => CubitFormRegister(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionRegister();
            return BlocButtonRegisterData();
          }
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionProductLocal();
            setupDInjectionProduct();
            return BlocAllProductConnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionProductLocal();
            return CubitMainListAllProductsDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionProductLocal();
            return CubitDetailProductsDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionCategoriesLocal();
            setupDInjectionCategories();
            return BlocNameCategoriesConnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context) {
            setupDInjectionCategoriesLocal();
            return BlocNameCategoriesDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionProduct();
            return BlocKlasifikasiCategoriesConnect();
          }
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDInjectionProductLocal();
            return BlocKlasifikasiCategoriesDisconnect();
          },
        ),
        BlocProvider(
          create: (context) => CubitUpButton(),
        ),
        // BlocProvider(
        //   create: (context) => CubitRefresh(),
        // ),
        BlocProvider(
          create: (context) => CubitConnectionNavigasi(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserFirebase();
            setupDInjectionUser();
            setupDInjectionUserLocal();
            return CubitMainUserConnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserLocal();
            return CubitMainUserDisconnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserFirebase();
            setupDInjectionUser();
            return BlocMainUpdateUserConnect();
          }
        ),
        BlocProvider(
          create: (context) => CubitConnectionExample(),
        ),
        BlocProvider(
          create: (context) => CubitConnectionNameCategories(),
        ),
        BlocProvider(
          create: (context) => CubitConnectionMainUser(),
        ),
        BlocProvider(
          create: (context) => CubitConnection(),
        ),
        BlocProvider(
          create: (context) {
            setupDInjectionUserFirebase();
            setupDiComponenChatFirebase();
            return CubitListMessageConnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserFirebase();
            setupDInjectionChatFirebase();
            setupDiComponenChatFirebase();
            setupDInjectionNotificationFirebase();
            return CubitTitleMessageConnect();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionProduct();
            return CubitDetailProductConnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionNotificationFirebase();
            setupDInjectionUserFirebase();
            setupDInjectionChatFirebase();
            setupDiComponenChatFirebase();
            return BlocDetailMessageConnect();
          }
        ),
        BlocProvider(
          create: (context) => BlocFormButtonNotNullBarang(),
        ),
        BlocProvider(
          create: (context) => CubitFormNotNullBarang(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionProduct();
            return BlocUploadInsertProduct();
          },
        ),
        BlocProvider(
          create: (context){ 
            setupDInjectionCategories();
            return CubitMainDataNoscrollCategories();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionUserFirebase();
            setupDInjectionLogout();
            setupDInjectionLikeLocal();
            setupDInjectionTransaksiLocal();
            return CubitLogout();
          },
        ),
        BlocProvider(
          create: (context) => CubitBottomNavPembeli(),
        ),
        BlocProvider(
          create: (context) => CubitBottomNavPenjual(),
        ),
        BlocProvider(
          create: (context) => CubitNavigationListImageBarang(),
        ),
        BlocProvider(
          create: (context) => CubitNavMessageDetail(),
        ),
        BlocProvider(
          create: (context) => CubitDetailNavigasiProduct(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionLikeLocal();
            return CubitInsertLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionLikeLocal();
            return CubitGetLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionLikeLocal();
            return CubitLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            setupDInjectionLikeLocal();
            setupDInjectionProduct();
            setupDInjectionTransaksi();
            return CubitDeleteProduct();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionProduct();
            return BlocUploadUpdateProduct();
          },
        ),
        BlocProvider(
          create: (context) => CubitDetailProdukNavPembeli(),
        ),
        BlocProvider(
          create: (context) => CubitDetailProdukNavPenjual(),
        ),
        BlocProvider(
          create: (context) => CubitConnectionBasic(),
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            return CubitGetTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            return CubitInsertTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            return CubitDeleteTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            return CubitUpdateTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksi();
            setupDInjectionTransaksiLocal();
            return CubitPostTransaksi();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksiLocal();
            return CubitGetTransaksiProductLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksi();
            setupDInjectionTransaksiLocal();
            return CubitGetTransaksiProduct();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionProduct();
            setupDInjectionTransaksiLocal();
            return CubitDeleteTransaksi();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksi();
            return CubitPatchTransaksi();
          }
        ),
        BlocProvider(
          create: (context){
            setupDInjectionChatFirebase();
            setupDiComponenChatFirebase();
            return CubitDeleteMessege();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksi();
            return CubitGetTransaksiUserPembeli();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionChatFirebase();
            return CubitJumlahBadges();
          },
        ),
        BlocProvider(
          create: (context){
            setupDInjectionTransaksi();
            return CubitGetDetailTransaksiProduct();
          }
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.pages,
      ),
    );
  }
}