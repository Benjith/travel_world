import 'package:flutter/material.dart';
import 'package:travel_world/appinfo.dart';
import 'package:travel_world/datamodel/agency.dart';
import 'package:travel_world/screens/chat.dart';

class AgencyInfo extends StatefulWidget {
  final Agency agency;

  const AgencyInfo({Key key, this.agency}) : super(key: key);
  @override
  _AgencyInfoState createState() => _AgencyInfoState();
}

class _AgencyInfoState extends State<AgencyInfo> {
  @override
  Widget build(BuildContext context) {
    var deviceH = MediaQuery.of(context).size.height;
    var deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agency.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.chat,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatBody()));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: widget.agency.name,
              child: Material(
                child: Text(
                  widget.agency.content ?? '',
                  style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
