import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future logout(BuildContext context) async {
  if (!FFAppState().isLoggedIn) {
    context.pushNamed('Onboarding');
  }
}
