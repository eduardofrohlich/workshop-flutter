import 'dart:io';
import 'dart:math';

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

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: 0.0, longitude: 0.0, address: ''),
    );

    _items.add(newPlace);
    notifyListeners(); //atualizar componentes dependentes
  }
}
