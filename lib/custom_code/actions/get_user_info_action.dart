// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web3auth_flutter/web3auth_flutter.dart';

import 'dart:collection';
import 'dart:io';

import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

Future<dynamic> getUserInfoAction() async {
  final TorusUserInfo response = await Web3AuthFlutter.getUserInfo();
  return response;
}
