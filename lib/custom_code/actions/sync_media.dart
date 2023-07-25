// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';

Future syncMedia() async {
  final PermissionState ps = await PhotoManager.requestPermissionExtend();

  // Further requests can be only proceed with authorized or limited.
  if (!ps.hasAccess) {
    print('Permission is not accessible.');
    return;
  }
  // Obtain assets using the path entity.
  final List<AssetPathEntity> paths =
      await PhotoManager.getAssetPathList(onlyAll: true);

  final _totalEntitiesCount = await paths.first!.assetCountAsync;
  final List<AssetEntity> entities = await paths.first!.getAssetListRange(start: 0, end: 50);

  // loop over entities and print their id & path
  for (final entity in entities) {
    print(entity);
  }
  
}

// 1) Check how many images and videos are there
// 2) Check if the images and videos are already in the database (local)


// ipfs hash -> encrypted(media) -> decrypt(media) -> media stored in temp folder -> get the temp url -> store in local db -> render that url in the app