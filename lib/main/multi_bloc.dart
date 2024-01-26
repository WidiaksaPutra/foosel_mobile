import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_add_product/injection_add_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_disconnect_nav_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/bloc_form_button_not_null_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_add_product/main/bloc_upload_add_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_form_not_null_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_navigation_list_image_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/injection_all_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/bloc_main_all_products_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/cubit_main_list_all_products_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/injection_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/connect/bloc_main_name_categories_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/cubit_connection_name_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/cubit_main_data_noscroll_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/disconnect/bloc_main_name_categories_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_navigasi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_name_categories_refresh.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/cubit_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/injection_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/injection_detail_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_get_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_insert_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/injection_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/injection_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/bloc_main_button_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/bloc_main_data_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/main/cubit_main_form_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_logout/cubit_logout.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_logout/injection_logout.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/injection_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_title_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/injection_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/bloc_main_button_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/bloc_main_data_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/main/cubit_main_form_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_patch_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/injection_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_insert_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_update_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/injection_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_update_product/injection_update_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_update_product/main/bloc_upload_update_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/cubit_connection_main_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/main/connect/bloc_main_update_user_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/main/disconnect/cubit_main_user_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/injection_user.dart';
import 'package:flutter_laravel_toko_sepatu/routes/page_routes.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

class MultiBlocProviderGetX extends StatelessWidget {
  const MultiBlocProviderGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeBox(context);
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
            setupDiLoginConnect();
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
            setupDiRegisterConnect();
            return BlocButtonRegisterData();
          }
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiAllProductConnect();
            return BlocAllProductConnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiAllProductDisconnect();
            return CubitMainListAllProductsDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiDetailProductDisconnect();
            return CubitDetailProductsDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiNameCategoriesConnect();
            return BlocNameCategoriesConnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context) {
            setupDiNameCategoriesDisconnect();
            return BlocNameCategoriesDisconnect();
          },
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiCategoriesConnect();
            return BlocKlasifikasiCategoriesConnect();
          }
        ),
        BlocProvider(
          lazy: false,
          create: (context){
            setupDiCategoriesDisconnect();
            return BlocKlasifikasiCategoriesDisconnect();
          },
        ),
        BlocProvider(
          create: (context) => cubitUpButton(),
        ),
        BlocProvider(
          create: (context) => CubitRefresh(),
        ),
        BlocProvider(
          create: (context) => cubitConnectionNavigasi(),
        ),
        BlocProvider(
          create: (context){
            setupDiUserConnect();
            return CubitMainUserConnect();
          },
        ),
        BlocProvider(
          create: (context) => CubitMainUserDisconnect(),
        ),
        BlocProvider(
          create: (context){
            setupDiUserConnect();
            return BlocMainUpdateUserConnect();
          }
        ),
        BlocProvider(
          create: (context) => cubitConnectionExample(),
        ),
        BlocProvider(
          create: (context) => cubitConnectionNameCategories(),
        ),
        BlocProvider(
          create: (context) => cubitConnectionMainUser(),
        ),
        BlocProvider(
          create: (context) => cubitConnection(),
        ),
        BlocProvider(
          create: (context) {
            setupDiUserFirebase();
            return cubitListMessageConnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDiUserFirebase();
            setupDiChatFirebase();
            return cubitTitleMessageConnect();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiDetailProductConnect();
            return CubitDetailProductConnect();
          },
        ),
        BlocProvider(
          create: (context){
            setupDiUserFirebase();
            setupDiChatFirebase();
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
            setupDiAddProductConnect();
            return BlocUploadInsertProduct();
          },
        ),
        BlocProvider(
          create: (context) => CubitMainDataNoscrollCategories(),
        ),
        BlocProvider(
          create: (context){
            setupDiLogoutConnect();
            return cubitLogout();
          },
        ),
        BlocProvider(
          create: (context) => cubitBottomNavPembeli(),
        ),
        BlocProvider(
          create: (context) => cubitBottomNavPenjual(),
        ),
        BlocProvider(
          create: (context) => CubitNavigationListImageBarang(),
        ),
        BlocProvider(
          create: (context) => cubitNavMessageDetail(),
        ),
        BlocProvider(
          create: (context) => cubitDetailNavigasiProduct(),
        ),
        BlocProvider(
          create: (context){
            setupDiLike();
            return cubitInsertLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDiLike();
            return CubitGetLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDiLike();
            return cubitLike();
          },
        ),
        BlocProvider(
          create: (context){
            setupDiDeleteProduct();
            return cubitDeleteProduct();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiUpdateProductConnect();
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
          create: (context) => cubitConnectionBasic(),
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiLocal();
            return CubitGetTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiLocal();
            return CubitInsertTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiLocal();
            return CubitDeleteTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiLocal();
            return CubitUpdateTransaksiLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiApi();
            setupDiTransaksiLocalApi();
            return CubitPostTransaksi();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiLocal();
            return CubitGetTransaksiProductLocal();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiApi();
            setupDiTransaksiLocalApi();
            return CubitGetTransaksiProduct();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiApi();
            return CubitDeleteTransaksi();
          }
        ),
        BlocProvider(
          create: (context){
            setupDiTransaksiApi();
            return CubitPatchTransaksi();
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