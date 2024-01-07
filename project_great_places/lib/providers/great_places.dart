import 'package:flutter/material.dart';
import 'package:project_great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  // Path: lib/providers/great_places.dart
  List<Place> get items {
    return [..._items]; //clone da lista
  }

  int get itemsCount {
    return _items.length;
  }

  // Path: lib/providers/great_places.dart
  Place findItemByIndex(int index) {
    return _items[index];
  }
}
