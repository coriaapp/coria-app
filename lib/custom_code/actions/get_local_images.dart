// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:photo_view/photo_view.dart';

Future getLocalImages() async {
  // get local images in an array
// Define a list to store the local images
  List<PhotoViewGalleryPageOptions> images = [];

  // Get the directory where the images are stored
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path;

  // Get a list of all the files in the directory
  List<FileSystemEntity> fileList = Directory(path).listSync();

  // Loop through the files and add the images to the list
  for (FileSystemEntity file in fileList) {
    if (file is File) {
      String extension = p.extension(file.path);
      if (extension == '.jpg' || extension == '.jpeg' || extension == '.png') {
        images.add(PhotoViewGalleryPageOptions(
          imageProvider: FileImage(file),
          heroAttributes: PhotoViewHeroAttributes(tag: file.path),
        ));
      }
    }
  }

  // Return the list of images
  return images;
}
