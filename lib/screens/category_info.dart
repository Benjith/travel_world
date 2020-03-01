import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_world/datamodel/categories.dart';

import '../appinfo.dart';

class CategoryInfo extends StatefulWidget {
  final Categories category;

  const CategoryInfo({Key key, this.category}) : super(key: key);
  @override
  _CategoryInfoState createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  @override
  Widget build(BuildContext context) {
    var deviceH = MediaQuery.of(context).size.height;
    var deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: widget.category.image,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.category.image,
                      ),
                      fit: BoxFit.fill)),
              height: deviceH * 30 / 100,
              width: double.infinity,
              // color: Colors.red,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(widget.category.desc ?? ''),
          RatingBar(
            initialRating: widget.category.rate,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              widget.category.rate = rating;
              // AppInfo.categoryNames.where(test)
            },
          )
        ],
      ),
    );
  }
}
