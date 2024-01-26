// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:shared_preferences/shared_preferences.dart';

mixin formButtonUpdateNotNull{
  formUpdateNotNull({
    required String nameProduct, 
    required String price, 
    required String description, 
    required String type,
    required String typeId,
  }) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nameOld = prefs.getString('namaProduct').toString();
    String deskripsiOld = prefs.getString('deskripsi').toString();
    String priceOld = prefs.getString('price').toString();
    String typeProductOld = prefs.getString('typeProduct').toString();
    if(nameOld == 'null' && deskripsiOld == 'null' && priceOld == 'null' && typeProductOld == 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('deskripsi', description);
      prefs.setString('price', price);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    if(nameOld == 'null' && deskripsiOld != 'null' && priceOld != 'null' && typeProductOld == 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld == 'null' && deskripsiOld != 'null' && priceOld == 'null' && typeProductOld == 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('price', price);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld != 'null' && deskripsiOld == 'null' && priceOld == 'null' && typeProductOld == 'null'){
      prefs.setString('deskripsi', description);
      prefs.setString('price', price);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld == 'null' && deskripsiOld == 'null' && priceOld != 'null' && typeProductOld == 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('deskripsi', description);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld != 'null' && deskripsiOld == 'null' && priceOld != 'null' && typeProductOld == 'null'){
      prefs.setString('deskripsi', description);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld != 'null' && deskripsiOld != 'null' && priceOld == 'null' && typeProductOld == 'null'){
      prefs.setString('price', price);
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld != 'null' && deskripsiOld != 'null' && priceOld != 'null' && typeProductOld == 'null'){
      prefs.setString('typeProduct', type);
      prefs.setString('indexDropdown', typeId);
    }
    else if(nameOld == 'null' && deskripsiOld == 'null' && priceOld == 'null' && typeProductOld != 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('deskripsi', description);
      prefs.setString('price', price);
    }
    else if(nameOld == 'null' && deskripsiOld != 'null' && priceOld != 'null' && typeProductOld != 'null'){
      prefs.setString('namaProduct', nameProduct);
    }
    else if(nameOld == 'null' && deskripsiOld != 'null' && priceOld == 'null' && typeProductOld != 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('price', price);
    }
    else if(nameOld != 'null' && deskripsiOld == 'null' && priceOld == 'null' && typeProductOld != 'null'){
      prefs.setString('deskripsi', description);
      prefs.setString('price', price);
    }
    else if(nameOld == 'null' && deskripsiOld == 'null' && priceOld != 'null' && typeProductOld != 'null'){
      prefs.setString('namaProduct', nameProduct);
      prefs.setString('deskripsi', description);
    }
    else if(nameOld != 'null' && deskripsiOld == 'null' && priceOld != 'null' && typeProductOld != 'null'){
      prefs.setString('deskripsi', description);
    }
    else if(nameOld != 'null' && deskripsiOld != 'null' && priceOld == 'null' && typeProductOld != 'null'){
      prefs.setString('price', price);
    }
  }
}