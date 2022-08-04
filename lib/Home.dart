import 'package:flutter/material.dart';
import 'package:random_app/HypeSquadList.dart';
import 'package:random_app/Services/FIrebaseAuth.dart';
import 'package:provider/provider.dart';
import 'package:random_app/Services/Firestore.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: FirestoreServices().HypeSquad,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Random members",
          style: TextStyle(
            color: Colors.black,
            fontSize:20
          ),
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
           Row(
             children: [
               IconButton(onPressed: ()async{
                 await firebaseAuthServices.signOut();
               }, icon:Icon(Icons.person)),
               Text("Sign out")
             ],
           )
          ],
        ),
        body: HypeSquadList(),

      ),
    );
  }
}
