import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvp_app/models/print_vendor_model.dart';

class PrintVendorRepository {
  final apiClient = http.Client();

  Future<List<PrintVendor>> _getVendors() async {
    const url = 'http://localhost:3000/print-vendor';
    final res = await apiClient.get(Uri.parse(url));

    if (res.statusCode >= 400) {
      throw Exception('Get vendors Fail!');
    }

    List<dynamic> vendorsRawJson = jsonDecode(res.body);
    List<PrintVendor> vendors = vendorsRawJson
        .map((vendorRawJson) => PrintVendor.fromJson(vendorRawJson))
        .toList();

    return vendors;
  }

  Future<List<PrintVendor>> getVendors() async {
    return _getVendors();
  }
}
