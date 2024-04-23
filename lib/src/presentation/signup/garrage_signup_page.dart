// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class GarageSignUpPage extends StatefulWidget {
//   const GarageSignUpPage({Key? key}) : super(key: key);

//   @override
//   State<GarageSignUpPage> createState() => _GarageSignUpPageState();
// }

// class _GarageSignUpPageState extends State<GarageSignUpPage> {
//   String _garageName = '';
//   String _ownerName = '';
//   String _email = '';
//   String _mobileNumber = '';
//   String _currentLocation = '';
//   File? _certificateImage;

//   final picker = ImagePicker();

//   Future<void> _pickImage() async {
//   ImagePicker picker = ImagePicker();
//       XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);

//         String fileName = imageFile.path.split('/').last;

//         Directory d = await getApplicationDocumentsDirectory();
//         Directory d1 = await Directory('${d.path}/images/').create();

//         // await imageFile.copy(d1.path + fileName).then(
//         //       (value) => provider.getImage(value),
//         //     );
//       }
//   }

//   Future<void> _getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();

//     if (permission == LocationPermission.denied && _currentLocation.isEmpty) {
//       // Location permissions are denied
//       await Permission.location.request();
//       permission = await Geolocator.checkPermission();
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Location permissions are permanently denied, show a dialog or navigate to settings
//       return;
//     }

//     if (permission == LocationPermission.whileInUse ||
//         permission == LocationPermission.always) {
//       // Location permissions are granted, fetch current location
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);

//       setState(() {
//         _currentLocation =
//             'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Garage Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Enter Garage Details',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Garage Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _garageName = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Owner Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _ownerName = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _email = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Mobile Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _mobileNumber = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _getCurrentLocation,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//                 child: Text('Get Current Location'),
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 '$_currentLocation',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: _pickImage,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//                 child: Text('Add Garage Certificate'),
//               ),
//               SizedBox(height: 10.0),
//               _certificateImage != null
//                   ? Image.file(
//                       _certificateImage!,
//                       height: 200,
//                       width: 200,
//                       fit: BoxFit.cover,
//                     )
//                   : SizedBox(),
//               SizedBox(height: 20.0),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Perform garage sign-up process here
//                     // You can use _garageName, _ownerName, _email, _mobileNumber, _currentLocation, and _certificateImage
//                   },
//                  style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//                   child: Text('Sign Up'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }