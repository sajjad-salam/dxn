class Item {
  String name;
  String qty;
  String price;
  String point;
  Item({
    required this.name,
    required this.qty,
    required this.point,
    required this.price,
  });
  List<String> toList() => [point, name, qty, "\د\.\ل\$$price", ((price))];
}
