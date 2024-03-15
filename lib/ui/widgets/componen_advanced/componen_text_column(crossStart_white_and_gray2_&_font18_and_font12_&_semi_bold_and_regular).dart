// ignore_for_file: must_be_immutable
import 'package:flutter/widgets.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular extends StatelessWidget {
  late String title, content;
  ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: semiBold)),
        Text(content, style: grayTextStyle2.copyWith(fontSize: defaultFont12, fontWeight: regular)),
      ],
    );
  }
}