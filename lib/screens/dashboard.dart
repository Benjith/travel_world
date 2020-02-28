import 'package:flutter/material.dart';
import 'package:travel_world/datamodel/agency.dart';
import 'package:travel_world/datamodel/categories.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Agency> agencyNames = [
    Agency(
        image:
            'https://imgak.mmtcdn.com/pwa_v3/pwa_hotel_assets/header/mmtLogoWhite.png',
        location: 'India',
        name: 'Make My Trip'),
    Agency(
        image:
            'https://imgak.mmtcdn.com/pwa_v3/pwa_hotel_assets/header/mmtLogoWhite.png',
        location: 'India',
        name: 'Make My Trip'),
    Agency(
        image:
            'https://imgak.mmtcdn.com/pwa_v3/pwa_hotel_assets/header/mmtLogoWhite.png',
        location: 'India',
        name: 'Make My Trip'),
    Agency(
        image:
            'https://imgak.mmtcdn.com/pwa_v3/pwa_hotel_assets/header/mmtLogoWhite.png',
        location: 'India',
        name: 'Make My Trip'),
  ];
  List<Categories> categoryNames = [
    Categories(
        image:
            'https://img.traveltriangle.com/blog/wp-content/uploads/2019/01/cover-final.jpg',
        name: 'Honeymoon',
        rate: 1998.00),
    Categories(
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trkking',
        rate: 399.00),
    Categories(
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trkking',
        rate: 399.00),
    Categories(
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trkking',
        rate: 399.00),
    Categories(
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trkking',
        rate: 399.00),
    Categories(
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trkking',
        rate: 399.00),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: categoryNames == null ? 0 : categoryNames.length,
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
                              child: Image.network(
                                categoryNames[index].image,
                                height: 178,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // SizedBox(height: 7),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                categoryNames[index].name,
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
                                categoryNames[index].rate.toString(),
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context){
                        //       return Details();
                        //     },
                        //   ),
                        // );
                      },
                    ),
                  );
                },
              ),
            ),

            ListView.builder(
              primary: false,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: agencyNames == null ? 0 : agencyNames.length,
              itemBuilder: (BuildContext context, int index) {
                Agency place = agencyNames[index];
                return InkWell(
                  child: Container(
                    height: 70,
//                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "${place.image}",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
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
                          // return Details();
                        },
                      ),
                    );
                  },
                );
              },
            ),

            // Expanded(
            //     flex: 1,
            //     child: ListView(
            //       children:
            //           agencyNames.map((f) => AgencyCardWidget(f)).toList(),
            //     ))
          ],
        ),
      ),
    );
  }
}

class AgencyCardWidget extends StatelessWidget {
  final Agency item;
  AgencyCardWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
