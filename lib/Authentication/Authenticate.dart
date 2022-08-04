import 'package:flutter/material.dart';
import 'package:random_app/Authentication/SignIn.dart';
import 'package:random_app/Authentication/SignUp.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;
  void toggleFuction(){
    setState((){
      showSignin  = !showSignin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignin){
      return SignIn(
          toggleView:toggleFuction
      );
    }else{
      return SignUp(
          toggleView:toggleFuction
      );

    }
  }
}
