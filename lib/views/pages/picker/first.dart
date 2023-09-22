import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import './second.dart';


class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Asset> images = <Asset>[];
  Asset? displayImage;

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (images.isNotEmpty) {
        displayImage = images[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: loadAssets,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Gallery',
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
        leading: TextButton(
          onPressed: () {
            // Put your cancel functionality here
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
            softWrap: false,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (displayImage != null) {
                displayImage!.getByteData().then((bd) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageEditPage(bd!.buffer.asUint8List()),
                    ),
                  );
                });
              }
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE9E8E8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: "Gallery",
            icon: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            label: "Video",
            icon: Text('Video'),
          ),
          BottomNavigationBarItem(
            label: "Photo",
            icon: Text('Photo'),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: displayImage == null
                ? Container()
                : Container(
              width: double.infinity,
              child: AssetThumb(asset: displayImage!, width: 300, height: 300),
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 4,  // Column 4 grid
              children: List.generate(images.length, (index) {
                Asset asset = images[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      displayImage = asset;
                    });
                  },
                  child: AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
