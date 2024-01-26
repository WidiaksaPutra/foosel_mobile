// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapsLocation extends StatelessWidget {
//   final double latitude, longitude;
//   const MapsLocation({required this.latitude, required this.longitude});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: no_leading_underscores_for_local_identifiers
//     final CameraPosition _kGooglePlex = CameraPosition(
//       target: LatLng(latitude, longitude),
//       zoom: 14.4746,
//     );
//     // ignore: no_leading_underscores_for_local_identifiers
//     final Marker _kGoogleMarker = Marker(
//       markerId: const MarkerId('_kGooglePlex'),
//       infoWindow: const InfoWindow(title: 'Your Location'),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       position: LatLng(latitude, longitude),
//     );
//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Maps'),),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         markers: {_kGoogleMarker},
//         initialCameraPosition: _kGooglePlex,
//       ),
//     );
//   }
// }