import 'package:image_picker/image_picker.dart';

class DataStateNavigationListImageBarang{
  XFile? image;
  DataStateNavigationListImageBarang(this.image);
}

class DataNavigationListImageBarang extends DataStateNavigationListImageBarang{
  DataNavigationListImageBarang(XFile? image)
  : super(image);
}