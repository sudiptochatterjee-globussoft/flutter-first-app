import 'package:flutter/material.dart';
import 'package:flutter_application_one/models/catalog.dart';
import 'package:flutter_application_one/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "code ninja";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, ((index) => CatlogModel.items[0]));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catlog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
