import 'package:flutter/foundation.dart';

import 'package:mvp_app/api/print_vendor_repository.dart';
import '../models/print_vendor_model.dart';

class PrintVendorProvider with ChangeNotifier {
  final PrintVendorRepository _printVendorRepository = PrintVendorRepository();
  bool loading = false;
  late List<PrintVendor> _vendors;
  List<PrintVendor> get vendors => _vendors;

  getVendors() async {
    loading = true;
    _vendors = await _printVendorRepository.getVendors();
    loading = false;
    notifyListeners();
  }
}
