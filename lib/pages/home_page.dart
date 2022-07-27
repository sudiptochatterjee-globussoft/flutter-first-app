import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_one/models/catalog.dart';
import 'package:flutter_application_one/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "code ninja";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catlog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatlogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catlog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatlogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatlogModel.items[index],
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
//4:33
