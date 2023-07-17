// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

final PhotoProvider provider = PhotoProvider();

Future syncMedia() async {
  FFState().isSyncLoading = true;
  // Request permissions.
  final PermissionState ps = await PhotoManager.requestPermissionExtend();
  if (!mounted) {
    return;
  }
  // Further requests can be only proceed with authorized or limited.
  if (!ps.hasAccess) {
    FFState().isSyncLoading = false;
    showToast('Permission is not accessible.');
    return;
  }
  // Obtain assets using the path entity.
  final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
    onlyAll: true,
    filterOption: _filterOptionGroup,
  );
  if (!mounted) {
    return;
  }
  // Return if not paths found.
  if (paths.isEmpty) {
    FFState().isSyncLoading = false;
    showToast('No paths found.');
    return;
  }
  // setState(() {
  // _path = paths.first;
  // });
  _totalEntitiesCount = await _path!.assetCountAsync;
  final List<AssetEntity> entities = await _path!.getAssetListPaged(
    page: 0,
    size: _sizePerPage,
  );
  if (!mounted) {
    return;
  }
  print(entities);

  //setState(() {
  // _entities = entities;
  //  _isLoading = false;
  //  _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
  //});
}
