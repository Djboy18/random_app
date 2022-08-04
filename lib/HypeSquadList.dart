import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:random_app/Authentication/UserModel.dart';
class HypeSquadList extends StatefulWidget {
  const HypeSquadList({Key? key}) : super(key: key);

  @override
  State<HypeSquadList> createState() => _HypeSquadListState();
}

class _HypeSquadListState extends State<HypeSquadList> {
  @override
  Widget build(BuildContext context) {
    final hypeSquad = Provider.of<List<UserModel>?>(context);
    print(hypeSquad);
    //print(hypeSquad);
    return Container();
  }
}
