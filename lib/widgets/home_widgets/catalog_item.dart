import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catlog;
  const CatalogItem({Key? key, required this.catlog})
      : assert(catlog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catlog.id.toString()),
              child: CatalogImage(image: catlog.image)),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catlog.name.text.lg
                      .color(MyTheme.darkBluishColor)
                      .bold
                      .make(),
                  catlog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catlog.price}".text.bold.xl.make(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyTheme.darkBluishColor),
                              shape: MaterialStateProperty.all(
                                StadiumBorder(),
                              )),
                          child: "Add to Cart".text.make())
                    ],
                  ).pOnly(right: 8.0)
                ]),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
