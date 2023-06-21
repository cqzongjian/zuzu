/*
* @author: zongjian
* @createTime: 2023/6/20 16:39
* @description: 
*/
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuzu/utils/assets.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:zuzu/widgets/login_button.dart';
import 'package:zuzu/widgets/small_login_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key, this.small = false}) : super(key: key);

  final bool small;

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {

  /// The scopes required by this application.
  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId: 'zuzu-e007e',
    scopes: scopes,
  );

  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  String _contactText = '';

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, in the web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (isAuthorized) {
        // unawaited(_handleGetContact(account!));
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.small ?
      SmallLoginButton(
          icon: Assets.facebook,
          onClick: _handleSignIn
      ) :
      LoginButton(
        icon: Assets.google,
        text: Strings.continueWithGoogle.tr,
        onClick: _handleSignIn
      );
  }

  // This is the on-click handler for the Sign In button that is rendered by Flutter.
  //
  // On the web, the on-click handler of the Sign In button is owned by the JS
  // SDK, so this method can be considered mobile only.
  Future<void> _handleSignIn() async {
    print("ahahaha");
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
