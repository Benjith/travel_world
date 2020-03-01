import 'package:flutter/material.dart';
import 'package:travel_world/datamodel/agency.dart';
import 'package:travel_world/datamodel/categories.dart';
import 'package:travel_world/screens/agency_info.dart';
import 'package:travel_world/screens/category_info.dart';

import '../appinfo.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person),
                    ),
                    Text(AppInfo.loggedInUser.username)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        elevation: 0.0,
      ),
      // backgroundColor: Colors.greenAccent.withBlue(100),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "\nWhere are you\ngoing?",
              textAlign: TextAlign.start,
              textScaleFactor: 1.5,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              height: 250,
//            color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: AppInfo.categoryNames == null
                    ? 0
                    : AppInfo.categoryNames.length,
                itemBuilder: (BuildContext context, int index) {
                  // Map place = places.reversed.toList()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Container(
                        height: 250,
                        width: 140,
//                      color: Colors.green,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                tag: AppInfo.categoryNames[index].image,
                                child: Image.network(
                                  AppInfo.categoryNames[index].image,
                                  height: 178,
                                  width: 140,
                                  fit: BoxFit.cover,
                                  // frameBuilder: (BuildContext context,
                                  //     Widget child,
                                  //     int frame,
                                  //     bool wasSynchronouslyLoaded) {
                                  //   return Padding(
                                  //     padding: EdgeInsets.all(8.0),
                                  //     child: child,
                                  //   );
                                  // },
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    return Center(child: child);
                                  },
                                ),
                              ),
                            ),
                            // SizedBox(height: 7),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppInfo.categoryNames[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppInfo.categoryNames[index].rate.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.blueGrey[300],
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // AppInfo.selectedCategory = AppInfo.categoryNames[index];
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return CategoryInfo(
                                category: AppInfo.categoryNames[index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                primary: false,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppInfo.agencyNames == null
                    ? 0
                    : AppInfo.agencyNames.length,
                itemBuilder: (BuildContext context, int index) {
                  Agency place = AppInfo.agencyNames[index];
                  return InkWell(
                    child: Container(
                      height: 70,
//                    color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Hero(
                              tag: place.name,
                              child: Image.network(
                                "${place.image}",
                                height: 70,
                                width: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width - 130,
                            child: ListView(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place.name}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 13,
                                      color: Colors.blueGrey[300],
                                    ),
                                    SizedBox(width: 3),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${place.location}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.blueGrey[300],
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "158",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AgencyInfo(
                              agency: AppInfo.agencyNames[index],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
