// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'package:web3auth_flutter/web3auth_flutter.dart';

import 'dart:collection';
import 'dart:io';

import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'dart:async';

class Web3AuthLogin extends StatefulWidget {
  const Web3AuthLogin({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _Web3AuthLoginState createState() => _Web3AuthLoginState();
}

class _Web3AuthLoginState extends State<Web3AuthLogin> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('coria://com.coria/openlogin');
    } else if (Platform.isIOS) {
      redirectUrl = Uri.parse('coria://com.coria/openlogin');
    } else {
      throw UnKnownException('Unknown platform');
    }

    await Web3AuthFlutter.init(Web3AuthOptions(
        clientId:
            'BI69JyfHCVUbtwrqQqA8PcMhk82YZJbUYDrPJ5VKgqKPODvuSCP_vK1Qn3FhR1jtr5AO8Vb3IdRdtPLhzIbsXKU',
        network: Network.aqua,
        redirectUrl: redirectUrl,
        whiteLabel: WhiteLabelData(dark: true, name: "Coria")));

    await Web3AuthFlutter.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
        child: FFButtonWidget(
          onPressed: (_login(_withGoogle)),
          text: 'Sign in with Google',
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
          options: FFButtonOptions(
            width: double.infinity,
            height: 60.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            color: FlutterFlowTheme.of(context).secondaryBackground,
            textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'DM Sans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).tertiary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
            hoverColor: FlutterFlowTheme.of(context).alternate,
            hoverTextColor: FlutterFlowTheme.of(context).primary,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
        child: FFButtonWidget(
          onPressed: (_login(_withApple)),
          text: 'Sign in with Apple',
          icon: Icon(
            Icons.apple,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
          options: FFButtonOptions(
            width: double.infinity,
            height: 60.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            color: FlutterFlowTheme.of(context).secondaryBackground,
            textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'DM Sans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).tertiary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
            hoverColor: FlutterFlowTheme.of(context).primary,
          ),
        ),
      ),
    ]);
  }

  VoidCallback _login(Future<Web3AuthResponse> Function() method) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        print("User logged in.");
        FFAppState().userinfo = jsonDecode(jsonEncode(response.userInfo));
        FFAppState().isLoggedIn = true;
        context.goNamed('PhotosPage');
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _logout() {
    return () async {
      try {
        await Web3AuthFlutter.logout();
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _privKey(Future<String?> Function() method) {
    return () async {
      try {
        final dynamic? response = await Web3AuthFlutter.getPrivKey();
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  VoidCallback _userInfo(Future<TorusUserInfo> Function() method) {
    return () async {
      try {
        final TorusUserInfo response = await Web3AuthFlutter.getUserInfo();
      } on UserCancelledException {
        print("User cancelled.");
      } on UnKnownException {
        print("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
      mfaLevel: MFALevel.NONE,
    ));
  }

  Future<Web3AuthResponse> _withApple() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.apple));
  }

  Future<Web3AuthResponse> _withEmailPasswordless() {
    return Web3AuthFlutter.login(LoginParams(
        loginProvider: Provider.email_passwordless,
        extraLoginOptions: ExtraLoginOptions(login_hint: "gaurav@tor.us")));
  }

  Future<Web3AuthResponse> _withDiscord() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.discord));
  }

  Future<String?> _getPrivKey() {
    return Web3AuthFlutter.getPrivKey();
  }

  Future<TorusUserInfo> _getUserInfo() {
    return Web3AuthFlutter.getUserInfo();
  }
}
