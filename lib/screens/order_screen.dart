import 'package:flutter/material.dart';
import 'package:mvp_app/models/print_vendor_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final PrintVendor vendor =
        ModalRoute.of(context)!.settings.arguments as PrintVendor;
    return Scaffold(
      appBar: AppBar(
        title: Text('order'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('${vendor.id}'),
            Text('${vendor.width}'),
            Text('${vendor.height}'),
            Text('${vendor.price}'),
            Text('${vendor.quantity}'),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
