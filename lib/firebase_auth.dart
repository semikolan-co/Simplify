import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
  
    // Future<UserCredential> signInWithGitHub(context) async {
    //   // Create a GitHubSignIn instance
    //      const String url = "https://github.com/login/oauth/authorize" +
    //         "?client_id=" + +
    //         "&scope=public_repo%20read:user%20user:email";
    //   // final GitHubSignIn gitHubSignIn = GitHubSignIn(
    //   //     clientId: '',
    //   //     clientSecret: '',
    //   //     redirectUrl: '');
    //  if (await canLaunch(url)) {
    //       setState(() {
    //         loader = true;
    //       });
    //       await launch(
    //         url,
    //         forceSafariVC: false,
    //         forceWebView: false,
    //       );
    //     } else {
    //       setState(() {
    //         loader = false;
    //       });
    //       print("CANNOT LAUNCH THIS URL!");
    //     }
    //   }

