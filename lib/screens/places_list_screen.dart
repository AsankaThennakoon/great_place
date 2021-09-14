import 'package:flutter/material.dart';
import 'package:greate_place/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? Center(
                        child: Text('Got no places yet, start adding some!'),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[i].image),
                          ),
                          title: Text(greatPlaces.items[i].title),
                          onTap: () {
                            //Go to detail page ...
                          },
                        ),
                        itemCount: greatPlaces.items.length,
                      ),
              ),
      ),
    );
  }
}
