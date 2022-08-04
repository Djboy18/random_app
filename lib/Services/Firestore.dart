import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_app/Authentication/UserModel.dart';
class FirestoreServices{
  CollectionReference hypeSquad = FirebaseFirestore.instance.collection("HypeSquad");
  Future updateUserData(
      String name,
      String sugar,
      String uid,
      int strength
      )async{
    UserModel userModel = UserModel(name: name,
        strength: strength,
        sugar: sugar,
        uid: uid);
    return await hypeSquad.doc(uid).set(userModel.toJson());
  }
  Stream<List<UserModel>> readuser() =>
      hypeSquad.snapshots().map((event) =>
      event.docs.map((e) =>UserModel.userFromJson(e.data()) ).toList()
      );
  /*List<UserModel> _hypeSquadList(QuerySnapshot snapshot){
   return snapshot.docs.map((doc){
     return UserModel.userFromSnap(doc.data());
   }).toList(); 
  }*/
  Stream<QuerySnapshot> get HypeSquad{
    return hypeSquad.snapshots();
  }
}