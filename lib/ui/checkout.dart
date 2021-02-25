import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_holder.dart';
import '../router/ui_pages.dart';
import '../router/router_delegate.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Get.find<CartHolder>().cartItems;
    final delegate = Get.find<ShoppingRouterDelegate>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Checkout',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index]}'),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      delegate.replaceAll(ListItemsPageConfig);
                    },
                    child: const Text('Back To List'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.find<CartHolder>().clear();
                      delegate.replaceAll(ListItemsPageConfig);
                    },
                    child: const Text('Clear Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
