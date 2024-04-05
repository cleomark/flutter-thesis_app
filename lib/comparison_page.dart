import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'image_provider.dart' as CustomImageProvider;
import 'upload_page.dart';
import 'package:flutter/services.dart';

class ComparisonPage extends StatefulWidget {
  final String combinedResult;

  const ComparisonPage({Key? key, required this.combinedResult})
      : super(key: key);
  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  static const Color primaryColor = Color(0xff432818);
  static const Color secondaryColor = Color.fromARGB(255, 241, 241, 241);
  static const double containerHeight = 285.0;

  @override
  Widget build(BuildContext context) {
    final imageProvider =
        Provider.of<CustomImageProvider.ImageProvider>(context);
    final Uint8List? croppedImage = imageProvider.croppedImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image vs Text'),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UploadPage()),
              );
            },
            tooltip: 'Start New Conversion',
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageContainer(croppedImage),
            _buildTextContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(Uint8List? croppedImage) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 0,
        maxWidth: MediaQuery.of(context).size.width * 0.8, // Responsive width
      ),
      height: containerHeight,
      padding: const EdgeInsets.all(6.0),
      decoration: _boxDecoration(const Color.fromARGB(11, 158, 158, 158)),
      child: croppedImage != null
          ? Image.memory(croppedImage)
          : const Center(child: Text('No image to show')),
    );
  }

  Widget _buildTextContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // Responsive width
      height: containerHeight,
      padding: const EdgeInsets.all(8.0),
      decoration: _boxDecoration(Colors.white),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                _copyToClipboard(widget.combinedResult);
              },
              icon: Icon(
                Icons.copy,
                color: Colors.brown, // Brown color
              ),
              tooltip: 'Copy',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Adjust height as needed
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0), // Adjust padding as needed
                child: Text(
                  widget.combinedResult, // Use the value of combinedResult
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 24), // Adjust font size here
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // Show a SnackBar or any other feedback to indicate that the text has been copied.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Text copied to clipboard')),
    );
  }

  BoxDecoration _boxDecoration(Color color) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: primaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(158, 158, 158, 0.25),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
