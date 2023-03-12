import 'package:get/get.dart';

import '../models/invoice_model.dart';

class AllInvoiceController extends GetxController {
  final RxList _invoicesList = [].obs;

  get invoicesList => _invoicesList;
  void createNewInvoice(Invoice invoice) => _invoicesList.add(invoice);
}
