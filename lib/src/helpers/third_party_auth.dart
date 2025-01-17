import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdPartyAuthenticators {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//   Future<UserCredential> signInWithFacebook() async {
//     LoginResult loginResult;
//     try {
//       loginResult = await FacebookAuth.instance.login();
//     } on Exception catch (e) {
//       throw FirebaseAuthException(
//         code: 'ERROR_FACEBOOK_LOGIN_FAILED',
//         message: e.toString(),
//       );
//     }

//     if (loginResult.accessToken?.token == null) {
//       throw FirebaseAuthException(
//         code: 'ERROR_MISSING_FACEBOOK_TOKEN',
//         message: 'Missing Facebook token',
//       );
//     }

//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);

//     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   }
}
