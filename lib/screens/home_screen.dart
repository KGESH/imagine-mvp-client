import 'package:flutter/material.dart';
import 'package:mvp_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/image_model.dart';
import '../providers/image_provider.dart';
import '../providers/print_vendor_provider.dart';
import '../widgets/image_wrapper.dart';
import '../widgets/search_bar.dart';
import '../widgets/vendor_item_wrapper.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = false;
  bool isImageLoading = false;
  bool isVendorLoading = false;
  late String prompt = '';

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageGenerateProvider>(context);
    final printVendorProvider = Provider.of<PrintVendorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(prompt),
            SearchBar(
              onSubmit: (String inputText) async {
                setState(() {
                  isVisible = false;
                  prompt = inputText;
                  isImageLoading = true;
                });

                await imageProvider.generateImage(prompt);
                setState(() {
                  isVisible = true;
                  isImageLoading = false;
                });
              },
            ),
            if (isImageLoading) const LoadingBox(),
            if (isVisible)
              GeneratedImageWrapper(
                onTapImage: () async {
                  setState(() {
                    isVendorLoading = true;
                  });

                  await printVendorProvider.getVendors();
                  setState(() {
                    isVendorLoading = false;
                  });

                  if (!isVendorLoading) {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return ListenableProvider.value(
                          value: printVendorProvider,
                          child: Container(
                            height: 400,
                            child: Column(
                              children: printVendorProvider.vendors
                                  .map((vendor) =>
                                      VendorItemWrapper(vendor: vendor))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                image: imageProvider.generatedImage,
              ),
            // FloatingActionButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/order');
            //   },
            //   child: Icon(Icons.add),
            // )
          ],
        ),
      ),
    );
  }
}
