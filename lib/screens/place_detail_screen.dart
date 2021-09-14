import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:greate_place/models/place.dart';
import 'package:greate_place/providers/great_places.dart';
import 'package:greate_place/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectdPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id as String);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectdPlace.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectdPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectdPlace.location!.address as String,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text('View on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(
                          initialLoaction:
                              selectdPlace.location as PlaceLocation,
                          isSelecting: false,
                        )));
              },
            )
          ],
        ));
  }
}
