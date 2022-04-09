import 'package:flutter/material.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/config/app_router/routes_name.dart';
import 'package:quantum_proj/view/screens/home/widget/logout_btn.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
                child: Text(
              'Simple Store',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('Categories '),
            leading: const Icon(Icons.category),
            onTap: () {
              Navigator.pop(context);
              AppRouter.push(catsScreen);
            },
          ),
          ListTile(
            title: const Text('Cart '),
            leading: const Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.pop(context);
              AppRouter.push(cartScreen);
            },
          ),

          ListTile(
            title: const Text('User'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pop(context);
              AppRouter.push(userScreen);
            },
          ),
          const Divider(),
          const LogoutButton(),
        ],
      ),
    );
  }
}
