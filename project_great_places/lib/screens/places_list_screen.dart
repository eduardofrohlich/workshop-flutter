import 'package:flutter/material.dart';
import 'package:project_great_places/providers/great_places.dart';
import 'package:project_great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('No places yet!'),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
            ? ch!
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatPlaces.findItemByIndex(index).image),
                  ),
                  title: Text(greatPlaces.findItemByIndex(index).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
