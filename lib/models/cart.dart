import 'package:flutter_application_one/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatlogModel _catalog;

  final List<int> _itemIds = [];

  CatlogModel get catalog => _catalog;

  set catalog(CatlogModel newCatlog) {
    assert(newCatlog != null);
    _catalog = newCatlog;
  }

  //get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
