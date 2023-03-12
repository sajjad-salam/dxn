import 'business_model.dart';
import 'item_model.dart';

class Invoice {
  String id;
  String date;
  Business from;
  List<Item> items;
  double total;
  Invoice({
    required this.id,
    required this.date,
    required this.from,
    required this.items,
    required this.total,
  });
}
