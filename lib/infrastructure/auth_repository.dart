import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authenticationProvider).authStateChange;
});

final authenticationProvider = Provider<AuthenticationRepository>((ref) {
  return AuthenticationRepository();
});

final String? userId = FirebaseAuth.instance.currentUser?.uid;

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Error Occured'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('OK'))
                ],
              ));
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('OK'))
                  ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use');
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('OK'))
                  ]));
    }
  }

  Future<void> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
      apiKey: 'GzYuNWCctZmSUpjMs9bWEuODk',
      apiSecretKey: 'FtuCrJ45bXSH3ylQDYY9mz4TnwSYmUzkNKkTUx4PqrqMehdjm0',
      redirectURI: 'jfewofjojoiewjf://',
    );

    // Trigger the sign-in flow
    await twitterLogin.login(forceLogin: true).then((value) async {
      final authToken = value.authToken;
      final authTokenSecret = value.authTokenSecret;
      if (authToken != null && authTokenSecret != null) {
        final twitterAuthCredential = TwitterAuthProvider.credential(
          accessToken: authToken,
          secret: authTokenSecret,
        );
        await _auth.signInWithCredential(twitterAuthCredential);
      } else {
        print('error');
      }
    });

    // Create a credential from the access token

    // Once signed in, return the UserCredential
  }

  //以下appleログイン関連のコード
  String generateNonce([int length = 32]) {
    final charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce);

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return await _auth.signInWithCredential(oauthCredential);

  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
