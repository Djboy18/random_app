import 'package:flutter/material.dart';
import 'package:random_app/Services/FIrebaseAuth.dart';
import 'package:random_app/Widgets/TextField.dart';
import 'package:random_app/Widgets/loadingScreen.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key,
  required this.toggleView
  }) : super(key: key);
  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool showpassword = true;
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  bool Loading = false;
  @override
  Widget build(BuildContext context) {
    return Loading ? Loadingscreen(): Scaffold(
      appBar:AppBar(
        title: Text("Signing In"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () => widget.toggleView(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.person),
                Text("Sign Up")
              ],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: TextFieldClasss(
              iconData: Icons.email,
              LabelText: "Email",
              controller: emailController,
              suffixIcon:false,
              isobscure:  false,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: TextFieldClasss(
              iconData:Icons.email,
              LabelText:"Password",
              controller:passwordController,
              isobscure: true,
              suffixIcon:  showpassword,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            margin: EdgeInsets.only(left: 65),
            child: RaisedButton(
              onPressed: () async{
                await firebaseAuthServices.SignIn(emailController.text.trim(),
                    passwordController.text.trim());
                setState((){
                  this.Loading = true;
                });
              },
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
