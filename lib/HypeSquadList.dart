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
    return ListView.builder(
        itemCount: hypeSquad?.length,
        itemBuilder:(context,index) {
          return
          HypeSquadTile(Squad: hypeSquad![index]);

        }
    );
  }
}
/*HypeSquadTile(Squad:hypeSquad[index]*/
class HypeSquadTile extends StatefulWidget {
  const HypeSquadTile({Key? key,
    required this.Squad
  }) : super(key: key);
  final UserModel  Squad;

  @override
  State<HypeSquadTile> createState() => _HypeSquadTileState();
}

class _HypeSquadTileState extends State<HypeSquadTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.only(top: 8),
    child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0,0.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown[widget.Squad.strength],
          radius: 25,
        ),
        title: Text(widget.Squad.name),
        subtitle: Text("Takes ${widget.Squad.sugar} sugar(s) "),
      ),
    ),
    );
  }
}
