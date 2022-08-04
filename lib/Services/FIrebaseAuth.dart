import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_app/Authentication/SignIn.dart';
import 'package:random_app/Services/Firestore.dart';
class FirebaseAuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<User?> get user {
    return firebaseAuth.authStateChanges();
  }
  Future<void>signUpWithEmailAndPassword(
      String email,
      String password,
      String username,
      )async{
    try{
      if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty){
        final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirestoreServices().updateUserData(username,
            "0",
            credential.user!.uid,
            100);

      }else{
        print("fill in the details");
      }
    } on FirebaseAuthException catch (e){
      print(e.toString());
    }
  }
  Future<void> SignIn(
      String email,
      String password,
      )async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        final Credential  =
        firebaseAuth.signInWithEmailAndPassword(email: email,
            password: password);
      }else{
        print("Fill in all details");
      }
    } on FirebaseAuthException catch (e){
      print(e.toString());

    }
  }
  Future<void> signinAnon ()async{
    try {
      UserCredential userCredential =
      await firebaseAuth.signInAnonymously();
      print(userCredential.user?.uid);
      print("has signed in anonymously.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
  Future<void> signOut()async{
    try{
      await firebaseAuth.signOut();
    }on FirebaseException catch(e){
      print(e.toString());
    }
  }
}