import 'package:flutter/material.dart';
import 'package:knowphones/screens/search.dart';
import 'package:knowphones/widgets/custom_page_route.dart';
import 'package:knowphones/widgets/tabbar_menu.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRoute(context, const SearchScreen()));
              },
            ),
          ),
        ],
      ),
      body: const TabBarMenu(),
    );
  }
}
