import 'package:flutter/material.dart';
import 'package:mobii_randy_fuerte/user/view/screens/user_detail_screen.dart';
import 'package:mobii_randy_fuerte/user/view/screens/user_list_screen.dart';

class MobiiRouterScreens {
  MobiiRouterScreens._();

  static MobiiRouterScreens? _instance;

  factory MobiiRouterScreens.instance() {
    return _instance ??= MobiiRouterScreens._();
  }

  Widget buildScreen(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case UserListScreen.routeName:
        return const UserListScreen();
      case UserDetailScreen.routeName:
        return const UserDetailScreen();
    }

    return Scaffold(
      body: InkWell(
        onTap: Navigator.of(context).pop,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          color: Colors.black.withOpacity(0.8),
          alignment: Alignment.center,
          child: const Text(
            'In development!',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
