import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
// import 'dart:io';
import 'image_provider.dart' as CustomImageProvider;
import 'digitizeText_page.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<void> _captureImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      // Show a loading indicator while cropping
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                const Color(0xffffe6a7),
              ),
            ),
          );
        },
      );

      await _cropImage(XFile(image.path));

      // Close the loading indicator
      Navigator.pop(context);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Show a loading indicator while cropping
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                const Color(0xffffe6a7),
              ),
            ),
          );
        },
      );

      await _cropImage(XFile(image.path));

      // Close the loading indicator
      Navigator.pop(context);
    }
  }

  Future<void> _cropImage(XFile imageFile) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: const Color(0xff432818),
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.grey,
          activeControlsWidgetColor: Color.fromARGB(255, 117, 68, 40),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (croppedImage != null) {
      Future<Uint8List> bytes = croppedImage.readAsBytes();

      await bytes.then((Uint8List bytes) {
        Provider.of<CustomImageProvider.ImageProvider>(context, listen: false)
            .updateCroppedImage(bytes);
      });

      // Now you can use the cropped image for further processing or display.
      // For example, you can display the image in an Image widget.
      // Update your UI accordingly.

      // For demonstration, let's print the path of the cropped image.
      print("Cropped Image Path: ${croppedImage.path}");

      // You can also use the croppedImage in other ways, like displaying it in an Image widget.
      // For example:
      // setState(() {
      //   _croppedImage = croppedImage;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 300,
              child: Container(
                width: 100,
                height: 100,
                color: const Color(0xff432818),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/upload-icon.png',
                      height: 130,
                    ),
                    Text(
                      "You need to upload your",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "Handwritten Document",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'StyleScript',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Digitize your handwriting\nwith ease",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  right: 100.0,
                  left: 100.0,
                  bottom: 272.5,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.3), // Shadow color
                          spreadRadius: 0, // Spread radius (set to 0)
                          blurRadius: 30, // Blur radius
                          offset: Offset(2, 5), // Offset (adjust as needed)
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0.0, 55.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        side: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                        foregroundColor: const Color(0xff432818),
                        backgroundColor: const Color(0xffffe6a7),
                      ),
                      onPressed: () async {
                        await _captureImage(); // Wait for image capture to complete
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DigitizeTextPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 5),
                          Image.asset(
                            'assets/images/camera-icon.png',
                            height: 26,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Use Camera",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'RobotoMono-Bold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 240.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    child: Divider(
                      color: const Color(0xff808080).withOpacity(0.7),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: const Color(0xff808080).withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    child: Divider(
                      color: const Color(0xff808080).withOpacity(0.7),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  right: 75.0,
                  left: 75.0,
                  bottom: 95.0,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff432818)
                              .withOpacity(0.3), // Shadow color
                          spreadRadius: 0, // Spread radius (set to 0)
                          blurRadius: 10, // Blur radius
                          offset: Offset(4, 4), // Offset (adjust as needed)
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150.0, 100.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: const Color(0xff432818),
                          width: 0.5,
                        ),
                        foregroundColor: const Color(0xffffffff),
                        backgroundColor: const Color(0xff432818),
                      ),
                      onPressed: () async {
                        await _pickImageFromGallery(); // Wait for image picking to complete
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DigitizeTextPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 5),
                          Image.asset(
                            'assets/images/gallery-icon.png',
                            height: 30,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Select from Gallery",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'RobotoMono-Bold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 10,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  textAlign: TextAlign.center,
                  'How it works?',
                  style: TextStyle(
                    color: const Color(0xff808080).withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
