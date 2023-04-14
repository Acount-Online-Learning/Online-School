import 'package:flutter/material.dart';

import 'components.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Page'),
      ),
      body: Container(
        color: Colors.grey[300],
        child: buildBooksList(context),
      ),
    );
  }
}