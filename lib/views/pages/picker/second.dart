import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import './third.dart'; // Replace this with the actual path of ImageTransferPage

class ImageEditPage extends StatefulWidget {
  final List<Uint8List> images;

  ImageEditPage(this.images);

  @override
  _ImageEditPageState createState() => _ImageEditPageState();
}

class _ImageEditPageState extends State<ImageEditPage> {
  late List<img.Image> _images;
  List<img.Image> _previews = [];
  int selectedFilterIndex = 0; // To keep track of the selected filter

  final List<String> _filters = [
    'Normal',
    'Brightness',
    'Grayscale',
    'Invert',
    'Saturate',
    'Contrast',
    'Hue-rotate',
  ];

  @override
  void initState() {
    super.initState();
    _loadImages(widget.images);
  }

  void _loadImages(List<Uint8List> imageBytesList) {
    _images = imageBytesList.map((imageBytes) => img.decodeImage(imageBytes)!).toList();
    _generatePreviews();
  }

  img.Image _cloneImage(img.Image src) {
    var clone = img.Image.from(src); // Clone the image
    return clone;
  }

  void _generatePreviews() {
    _previews = [];
    for (var image in _images) {
      for (String filter in _filters) {
        img.Image preview = _cloneImage(image); // Here we clone each image
        switch (filter) {
          case 'Normal':
            break;
          case 'Brightness':
            preview = img.adjustColor(preview, brightness: 100); // Increase brightness
            break;
          case 'Grayscale':
            preview = img.grayscale(preview);
            break;
          case 'Invert':
            preview = img.invert(preview);
            break;
          case 'Saturate':
            preview = img.adjustColor(preview, saturation: 1.5); // Increase saturation
            break;
          case 'Contrast':
            preview = img.adjustColor(preview, contrast: 1.5); // Increase contrast
            break;
          case 'Hue-rotate':
            preview = img.adjustColor(preview, hue: 180); // Rotate hue
            break;
        }
        _previews.add(preview);
      }
    }
  }

  // A function to apply the selected filter to all images
  List<Uint8List> _applySelectedFilterToAll() {
    return _images.map((image) {
      img.Image editedImage = _cloneImage(image);
      switch (_filters[selectedFilterIndex]) {
      // apply filter to editedImage based on selectedFilterIndex
      // ...
      }
      return Uint8List.fromList(img.encodePng(editedImage));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Filter",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => ImageTransferPage(_applySelectedFilterToAll()),
          //     ),
          //   ),
          //   child: Text(
          //     'Next',
          //     style: TextStyle(color: Colors.blue, fontSize: 20),
          //   ),
          // ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _images.isEmpty
                  ? CircularProgressIndicator()
                  : Image.memory(Uint8List.fromList(img.encodePng(_images[0]))),
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _previews.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Here we select the corresponding image and filter from _previews
                      var imageIndex = index ~/ _filters.length;
                      var filterIndex = index % _filters.length;
                      _images[imageIndex] = _previews[index];
                      selectedFilterIndex = filterIndex;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.memory(
                      Uint8List.fromList(img.encodePng(_previews[index])),
                      height: 80,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
