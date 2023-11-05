import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
                      height: 140,
                    ),
                    Text(
                      "You need to upload your",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "Handwritten Document",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'StyleScript',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Digitize your handwriting\nwith ease",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
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
                        minimumSize: const Size(110.0, 55.0),
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
                      onPressed: () {},
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
                              fontSize: 18,
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
                      onPressed: () {},
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
                              fontSize: 18,
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
                onTap: () {
                  // Add your onTap logic here
                },
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
