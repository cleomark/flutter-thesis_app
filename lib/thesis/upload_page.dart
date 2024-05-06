import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'image_provider.dart' as CustomImageProvider;
import 'digitizeText_page.dart';
import 'howItWorks_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String combinedResult = '';

  Future<bool> _captureImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      await _cropAndUploadImage(XFile(image.path));
      return true;
    }
    return false;
  }

  Future<bool> _pickImageFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      await _cropAndUploadImage(XFile(image.path));
      return true;
    }
    return false;
  }

  Future<void> _cropAndUploadImage(XFile imageFile) async {
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

      await uploadFile(croppedImage);

      Navigator.pop(context);

      if (combinedResult.isNotEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => DigitizeTextPage(
              combinedResult: combinedResult,
            ),
          ),
        );
      } else {
        // Handle the case where combinedResult is empty
      }
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

  Future<void> uploadFile(CroppedFile file) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('http://10.10.18.174:5000'));

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseText = await response.stream.bytesToString();
      var responseBody = json.decode(responseText);
      if (responseBody.containsKey('result')) {
        var result = List<String>.from(responseBody['result']);
        combinedResult = result.isNotEmpty ? result.join(' ') : '';
        print('Recognized text: $combinedResult');
        print('File uploaded successfully');
      } else {
        print('No result found in response');
      }
    } else {
      print('Error uploading file: ${response.reasonPhrase}');
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
                        bool imageCaptured = await _captureImage();
                        if (!imageCaptured) {
                          // Handle case where image capture failed
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                        bool imageCaptured = await _pickImageFromGallery();
                        if (!imageCaptured) {
                          // Handle case where image selection failed
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
              bottom: 12,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HowItWorksPage(),
                    ),
                  );
                },
                child: Text(
                  'How it works?',
                  textAlign: TextAlign.center,
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
