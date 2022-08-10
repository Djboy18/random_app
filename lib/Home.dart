import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_app/Authentication/UserModel.dart';
import 'package:random_app/HypeSquadList.dart';
import 'package:random_app/Services/FIrebaseAuth.dart';
import 'package:provider/provider.dart';
import 'package:random_app/Services/Firestore.dart';
import 'package:random_app/Widgets/loadingScreen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  final FirestoreServices firestoreServices = FirestoreServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value:firestoreServices.HypeSquad,
      initialData: [],
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
        body:HypeSquadList()//
      ),
    );
  }
}
 /*return Scaffold(
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
body:FireStreams()//
),*/

class FireStreams extends StatelessWidget {
  const FireStreams({
    Key? key,
    required this.firestoreServices,
  }) : super(key: key);

  final FirestoreServices firestoreServices;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserModel>>(
      stream: firestoreServices.readuser(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Loadingscreen();
        }
        else if (snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(padding:EdgeInsets.only(top: 8),
                child: Card(
                  margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0,0.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown[snapshot.data![index].strength],
                      radius: 25,
                    ),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text("Takes ${snapshot.data![index].sugar} sugar(s) "),
                  ),
                ),
              );
            }
          );
        }
      }
    );
  }
}

