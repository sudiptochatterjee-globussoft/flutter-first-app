import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_application_one/utils/routes.dart';
import 'package:flutter_application_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.cartRoute);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).px32().py16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Lorem ea dolor lorem sea et gubergren ipsum diam diam, tempor lorem sit diam gubergren sed, ipsum gubergren sanctus nonumy invidunt kasd, sea diam et dolor ea tempor lorem. Invidunt erat dolor ut sit ea kasd duo eos sea, dolor at takimata labore dolor, justo amet dolor et amet et."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
//05:48