import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:greate_place/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}