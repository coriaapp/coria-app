// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
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

Future logoutWeb3Auth() async {
  return () async {
    try {
      await Web3AuthFlutter.logout();
      FFAppState().isLoggedIn = false;
    } on UnKnownException {
      print("Unknown exception occurred");
    }
  };
}
