import 'package:flutter/material.dart';
import 'package:mvp_app/models/print_vendor_model.dart';

class VendorItemWrapper extends StatelessWidget {
  final PrintVendor vendor;
  const VendorItemWrapper({Key? key, required this.vendor}) : super(key: key);

  static const textStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print("on tap item");
          Navigator.pushNamed(context, '/order', arguments: vendor);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${vendor.width} x ${vendor.height}',
              style: textStyle,
            ),
            Text(
              '${vendor.quantity} 개',
              style: textStyle,
            ),
            Text(
              '${vendor.price} ₩',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
