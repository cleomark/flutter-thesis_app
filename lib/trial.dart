// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// // import 'dart:io';
// import 'digitizeText_page.dart';

// class UploadPage extends StatefulWidget {
//   const UploadPage({super.key});

//   @override
//   State<UploadPage> createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {
//   Future<void> _captureImage() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.camera);

//     if (image != null) {
//       _cropImage(XFile(image.path));
//       // You can now use the captured image (XFile) for further processing or display.
//       // For example, you can display the image in an Image widget.
//     }
//   }

//   Future<void> _pickImageFromGallery() async {
//     final XFile? image =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       _cropImage(XFile(image.path));
//       // You can now use the selected image (XFile) for further processing or display.
//       // For example, you can display the image in an Image widget.
//     }
//   }

//   Future<void> _cropImage(XFile imageFile) async {
//     final croppedImage = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Image',
//           toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//         ),
//         IOSUiSettings(
//           minimumAspectRatio: 1.0,
//         ),
//       ],
//     );

//     if (croppedImage != null) {
//       // Now you can use the cropped image for further processing or display.
//       // For example, you can display the image in an Image widget.
//       // Update your UI accordingly.

//       // For demonstration, let's print the path of the cropped image.
//       print("Cropped Image Path: ${croppedImage.path}");

//       // You can also use the croppedImage in other ways, like displaying it in an Image widget.
//       // For example:
//       // setState(() {
//       //   _croppedImage = croppedImage;
//       // });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.white,
//         child: Stack(
//           children: [
//             Stack(
//               children: [
//                 Positioned(
//                   right: 100.0,
//                   left: 100.0,
//                   bottom: 272.5,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 0, 0, 0)
//                               .withOpacity(0.3), // Shadow color
//                           spreadRadius: 0, // Spread radius (set to 0)
//                           blurRadius: 30, // Blur radius
//                           offset: Offset(2, 5), // Offset (adjust as needed)
//                         ),
//                       ],
//                     ),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(110.0, 55.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         side: BorderSide(
//                           color: Colors.white,
//                           width: 3.0,
//                         ),
//                         foregroundColor: const Color(0xff432818),
//                         backgroundColor: const Color(0xffffe6a7),
//                       ),
//                       onPressed: () {
//                         _captureImage();
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // SizedBox(width: 5),
//                           Image.asset(
//                             'assets/images/camera-icon.png',
//                             height: 26,
//                           ),
//                           SizedBox(width: 12),
//                           Text(
//                             "Use Camera",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'RobotoMono-Bold',
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }