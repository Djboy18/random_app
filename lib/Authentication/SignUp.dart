import 'package:flutter/material.dart';
import 'package:random_app/Services/FIrebaseAuth.dart';
import 'package:random_app/Widgets/TextField.dart';
import 'package:random_app/Widgets/loadingScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key,
  required this.toggleView
  }) : super(key: key);
  final Function toggleView;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuthServices authServices = FirebaseAuthServices();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool showpassword = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {

    return loading ?Loadingscreen(): Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Signing up",
            style: TextStyle(color: Colors.purple),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () => widget.toggleView() ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person),
                  Text("Sign In")
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 20, right: 15),
                child: TextFieldClasss(suffixIcon: false,
                    isobscure: false,
                    controller: usernameController,
                    LabelText: "Username",
                    iconData: Icons.person)
              ),
              SizedBox(height: 25,),
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
                  setState((){
                    this.loading  = true;
                  });
                  await authServices.
                  signUpWithEmailAndPassword(emailController.text.trim(),
                      passwordController.text.trim(),
                      usernameController.text.trim());
                 /* setState((){
                    this.loading = false;
                  });*/

                  }
                  ,
                  child: Text(
                    "sign in",
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
        ));
  }}
