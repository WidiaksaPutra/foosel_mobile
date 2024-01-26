// ignore_for_file: must_be_immutable
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/bloc_form_button_not_null_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_form_not_null_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_form_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_multipe_form.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/dropdown/dropdown_type_data.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_black).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_form_kosong.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';

class FormInsertBarang extends StatelessWidget{
  late String? hintNameProduct, hintDropdownProduct, hintDropdownIdProduct, hintDeskripsiProduct, hintHargaProduct;
  late bool statusUpdateFormBarang;
  FormInsertBarang({Key? key,
    this.hintNameProduct = '',
    this.hintDropdownProduct = '',
    this.hintDropdownIdProduct = '',
    this.hintDeskripsiProduct = '',
    this.hintHargaProduct = '',
    required this.statusUpdateFormBarang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(hintNameProduct == ''){
      hintNameProduct = 'Merek & Nama Sepatumu';
    }
    if(hintDeskripsiProduct == ''){
      hintDeskripsiProduct = 'Penjelasan Sepatu';
    }
    if(hintHargaProduct == ''){
      hintHargaProduct = 'Harga Sepatu';
    }
    return Column(
      children: [
        ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
          labelText: "Nama Sepatu",
          labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
          hintText: hintNameProduct!,
          nameController: "namaProduct",
          contextForm: context.read<CubitFormNotNullBarang>().nameProductValidasiEmpty, 
          update: statusUpdateFormBarang, 
        ),
        BlocBuilder<BlocFormButtonNotNullBarang, DataStateMultiFormProduct>(
          builder: (context, state) => (state.formVisibleNameProduct == true) 
          ? ComponenFormKosong(formVisible: state.formVisibleNameProduct, message: state.messageNameProduct)
          : BlocBuilder<CubitFormNotNullBarang, DataStateFormProduct>(
              builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleNameProduct, message: state1.message),
            ),
        ),
        SizedBox(height: themeBox.defaultHeightBox30),
        DropdownTypeData(
          namaType: hintDropdownProduct!, 
          indexType: hintDropdownIdProduct!, 
          update: statusUpdateFormBarang,
        ),
        BlocBuilder<BlocFormButtonNotNullBarang, DataStateMultiFormProduct>(
          builder: (context, state) => (state.formVisibleType == true) 
          ? ComponenFormKosong(formVisible: state.formVisibleType, message: state.messageType)
          : BlocBuilder<CubitFormNotNullBarang, DataStateFormProduct>(
              builder: (context, state) => ComponenFormKosong(formVisible: state.formVisibleType, message: state.message),
            ),
        ),
        SizedBox(height: themeBox.defaultHeightBox30),
        ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
          labelText: "Deskripsi Sepatu",
          labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
          hintText: hintDeskripsiProduct!,
          nameController: "deskripsi", 
          contextForm: context.read<CubitFormNotNullBarang>().descriptionValidasiEmpty, 
          update: statusUpdateFormBarang, 
        ),
        BlocBuilder<BlocFormButtonNotNullBarang, DataStateMultiFormProduct>(
          builder: (context, state) => (state.formVisibleDescription == true) 
          ? ComponenFormKosong(formVisible: state.formVisibleDescription, message: state.messageDescription)
          : BlocBuilder<CubitFormNotNullBarang, DataStateFormProduct>(
              builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisibleDescription, message: state1.message),
            ),
        ),
        SizedBox(height: themeBox.defaultHeightBox30),
        ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack(
          labelText: "Harga Sepatu",
          labelStyle: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),
          hintText: hintHargaProduct!,
          nameController: 'price',
          keyboardType: TextInputType.number,
          inputFormatters: [CurrencyInputFormatter(thousandSeparator: ThousandSeparator.Comma, maxTextLength: 16)],
          contextForm: context.read<CubitFormNotNullBarang>().priceProductValidasiEmpty, 
          update: statusUpdateFormBarang,
        ),
        BlocBuilder<BlocFormButtonNotNullBarang, DataStateMultiFormProduct>(
          builder: (context, state) => (state.formLengthVisiblePrice == true)
          ? ComponenFormKosong(formVisible: state.formLengthVisiblePrice, message: state.lengthPriceMessage)
          : (state.formVisiblePrice == true) 
            ? ComponenFormKosong(formVisible: state.formVisiblePrice, message: state.messagePrice) 
            : BlocBuilder<CubitFormNotNullBarang, DataStateFormProduct>(
                builder: (context, state1) => ComponenFormKosong(formVisible: state1.formVisiblePrice, message: state1.message),
              ),
        ),
      ],
    );
  }
}