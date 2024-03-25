// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:shared_preferences/shared_preferences.dart';

mixin FormButtonUpdateNotNull{
  formUpdateNotNull({
    required String nameProduct, 
    required String price, 
    required String description, 
    required String type,
    required String typeId,
  }) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _nameOld = _prefs.getString('namaProduct').toString();
    String _deskripsiOld = _prefs.getString('deskripsi').toString();
    String _priceOld = _prefs.getString('price').toString();
    String _typeProductOld = _prefs.getString('typeProduct').toString();
    if(_nameOld == 'null' && _deskripsiOld == 'null' && _priceOld == 'null' && _typeProductOld == 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('deskripsi', description);
      _prefs.setString('price', price);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    if(_nameOld == 'null' && _deskripsiOld != 'null' && _priceOld != 'null' && _typeProductOld == 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld == 'null' && _deskripsiOld != 'null' && _priceOld == 'null' && _typeProductOld == 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('price', price);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld != 'null' && _deskripsiOld == 'null' && _priceOld == 'null' && _typeProductOld == 'null'){
      _prefs.setString('deskripsi', description);
      _prefs.setString('price', price);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld == 'null' && _deskripsiOld == 'null' && _priceOld != 'null' && _typeProductOld == 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('deskripsi', description);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld != 'null' && _deskripsiOld == 'null' && _priceOld != 'null' && _typeProductOld == 'null'){
      _prefs.setString('deskripsi', description);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld != 'null' && _deskripsiOld != 'null' && _priceOld == 'null' && _typeProductOld == 'null'){
      _prefs.setString('price', price);
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld != 'null' && _deskripsiOld != 'null' && _priceOld != 'null' && _typeProductOld == 'null'){
      _prefs.setString('typeProduct', type);
      _prefs.setString('indexDropdown', typeId);
    }
    else if(_nameOld == 'null' && _deskripsiOld == 'null' && _priceOld == 'null' && _typeProductOld != 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('deskripsi', description);
      _prefs.setString('price', price);
    }
    else if(_nameOld == 'null' && _deskripsiOld != 'null' && _priceOld != 'null' && _typeProductOld != 'null'){
      _prefs.setString('namaProduct', nameProduct);
    }
    else if(_nameOld == 'null' && _deskripsiOld != 'null' && _priceOld == 'null' && _typeProductOld != 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('price', price);
    }
    else if(_nameOld != 'null' && _deskripsiOld == 'null' && _priceOld == 'null' && _typeProductOld != 'null'){
      _prefs.setString('deskripsi', description);
      _prefs.setString('price', price);
    }
    else if(_nameOld == 'null' && _deskripsiOld == 'null' && _priceOld != 'null' && _typeProductOld != 'null'){
      _prefs.setString('namaProduct', nameProduct);
      _prefs.setString('deskripsi', description);
    }
    else if(_nameOld != 'null' && _deskripsiOld == 'null' && _priceOld != 'null' && _typeProductOld != 'null'){
      _prefs.setString('deskripsi', description);
    }
    else if(_nameOld != 'null' && _deskripsiOld != 'null' && _priceOld == 'null' && _typeProductOld != 'null'){
      _prefs.setString('price', price);
    }
  }
}