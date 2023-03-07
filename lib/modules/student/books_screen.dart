import 'package:flutter/material.dart';

import '../../Widget/drawer.dart';
import '../../constants/Comonent.dart';
import '../../constants/constants.dart';


class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Page'),
      ),
      drawer: Drawer(
        backgroundColor: defaultColor,
        width: MediaQuery.of(context).size.width *0.55 ,
        child: DrawerItem(),
      ),
      body: Container(
        color: Colors.grey[300],
        child: buildBooksList(context),
      ),
    );
  }
}
