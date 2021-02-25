import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_app/ui/details.dart';
import '../router/ui_pages.dart';
import '../router/router_delegate.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    final delegate = Get.find<ShoppingRouterDelegate>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Items for sale',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => delegate.push(SettingsPageConfig)),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () => delegate.push(CheckoutPageConfig))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
              onTap: () {
                delegate.pushWidget(Details(index), DetailsPageConfig);
              },
            );
          },
        ),
      ),
    );
  }
}
