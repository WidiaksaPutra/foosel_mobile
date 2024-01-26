import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenLoadingBasic extends StatelessWidget {
  final Color colors;
  const ComponenLoadingBasic({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: colors));
  }
}

class ComponenLoadingHashData extends StatelessWidget {
  final bool boolLoading;
  final List data;
  const ComponenLoadingHashData({Key? key, required this.boolLoading, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (boolLoading == true && data.isEmpty)
    ? Text("saat ini tidak ada data...", style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: regular))
    : const Center(child: CircularProgressIndicator(color: kPurpleColor));
  }
}

class ComponenLoadingHashDataMap extends StatelessWidget {
  final bool boolLoading;
  late Map<String, dynamic> data = {};
  ComponenLoadingHashDataMap({Key? key, required this.boolLoading, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (boolLoading == true && data == {})
    ? Text("saat ini tidak ada data...", style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: regular))
    : const Center(child: CircularProgressIndicator(color: kPurpleColor));
  }
}

mixin loadingScrollData{
  Widget loadingScrollHeight(loadingScrollName, withLoading, heightLoading, rightLoading){
    // ignore: curly_braces_in_flow_control_structures
    return (loadingScrollName)
    ? Positioned(
        right: rightLoading,
        child: SizedBox(
          height: heightLoading,
          width: withLoading,
          child: const Center(
            child: CircularProgressIndicator(color: kPurpleColor)
          ),
        )
      )
    : const Text("");
  }

  Widget loadingScroll(loadingScrollName, withLoading, rightLoading){
    // ignore: curly_braces_in_flow_control_structures
    return (loadingScrollName)
    ? Positioned(
        right: rightLoading,
        child: SizedBox(
          width: withLoading,
          child: const Center(
            child: CircularProgressIndicator(color: kPurpleColor)
          ),
        )
      )
    : const Text("");
  }
}

class ComponenLoadingChatMessage extends StatelessWidget{
  Widget iconBottom;
  String hintText;
  ComponenLoadingChatMessage({Key? key, required this.hintText, required this.iconBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, left: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
                    padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox16, vertical: themeBox.defaultHeightBox12),
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: BorderRadius.circular(themeBox.defaultRadius12)
                    ),
                    child: TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
                      decoration: InputDecoration.collapsed(
                        hintText: hintText.toString(),
                        hintStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                  ),
                  child: iconBottom,
                ),
              ],
            ),          
          ),
        ],
      ),
    );
  }
}