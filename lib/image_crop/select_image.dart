import 'dart:io';

import 'package:crop_image_video/image_crop/pick_crop.dart';
import 'package:flutter/material.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({super.key});

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  var height = 0.0, width = 0.0;

  File? image;

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Container(
            margin: const EdgeInsets.all(15),
            height: height / 2,
            width: width,
            color: Colors.red,
            child: image != null ? Image.file(File(image!.path)) : Container(),
          ),

          //for image
          TextButton(
              onPressed: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) => pickImage(context)).then((value) {
                  debugPrint('print image path $value');
                  setState(() {
                    if (value != null) {
                      image = value;
                    }
                  });
                });
              },
              child: const Text('Pick Image')),
        ],
      ),
    );
  }
}
