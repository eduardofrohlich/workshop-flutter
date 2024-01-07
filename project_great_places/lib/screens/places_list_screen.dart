import 'package:flutter/material.dart';
import 'package:project_great_places/utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          )
        ],
      ),
    );
  }
}
