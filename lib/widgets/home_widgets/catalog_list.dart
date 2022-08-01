import 'package:flutter/material.dart';
import 'package:flutter_application_one/pages/home_detail_page.dart';
import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.getByPos(index);
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetail(catalog: catalog),
                  ),
                ),
            child: CatalogItem(catlog: catalog));
      },
    );
  }
}
