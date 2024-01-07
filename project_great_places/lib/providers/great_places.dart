import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_great_places/models/place.dart';
import 'package:project_great_places/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(latitude: 0.0, longitude: 0.0, address: ''),
            image: File(
              item['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

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
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners(); //atualizar componentes dependentes
  }
}
