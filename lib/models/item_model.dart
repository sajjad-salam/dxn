class Item {
  String name;
  String qty;
  String price;
  Item({
    required this.name,
    required this.qty,
    required this.price,
  });
  List<String> toList() => [name, qty, "\$$price", ((price))];
}
