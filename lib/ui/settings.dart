import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash.dart';
import '../router/ui_pages.dart';
import '../router/router_delegate.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<ShoppingRouterDelegate>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () async {
                  saveLoginState();
                  delegate.replaceAll(SplashPageConfig);
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(LoggedInKey, false);
  }
}
