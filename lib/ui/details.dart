import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_holder.dart';
import '../router/ui_pages.dart';
import '../router/router_delegate.dart';

class Details extends StatelessWidget {
  final int id;

  const Details(this.id);

  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<ShoppingRouterDelegate>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Item $id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Get.find<CartHolder>().addItem('Item $id');
                  delegate.popRoute();
                },
                child: const Text('Add to Cart'),
              ),
              RaisedButton(
                onPressed: () => delegate.push(CartPageConfig),
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
