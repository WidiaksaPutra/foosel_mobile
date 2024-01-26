// import 'package:location/location.dart';

// mixin locationMaps{
//   late PermissionStatus permissionGranted;
//   late Location location = Location();
//   late LocationData locationData;
//   Future<dynamic> getLocation() async{
//     bool _serviceEnabled = await location.serviceEnabled();
//     if(!_serviceEnabled) _serviceEnabled = await location.requestService();
//     permissionGranted = await location.hasPermission();
//     if(permissionGranted == PermissionStatus.denied){
//       permissionGranted = await location.requestPermission();
//     }
//     locationData = await location.getLocation();
//     return locationData;
//   }
// }