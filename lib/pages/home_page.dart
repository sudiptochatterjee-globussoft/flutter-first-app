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
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: ((context, index) {
                  final item = CatlogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ),
                  );
                }),
                itemCount: CatlogModel.items.length,
              )
            //list goes here
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
// ListView.builder(
            //     itemCount: CatlogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatlogModel.items[index],
            //       );
            //     },
            //   )
