import 'package:flutter/material.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../orders/orders_screen.dart';
import '../products/user_products_screen.dart';
import '../auth/auth_manager.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
            Consumer<AuthManager>(builder: (context, authManager1, child) {
            return  authManager1.authToken!.userId =='ie7w7sePzChszGj409DHHCXL2P92'// userid nguoi dung chinh
                  ?  AppBar(
                  title: const Text('Welcom to Admin'),
                  automaticallyImplyLeading: false,
                  )
                  : AppBar(
                  title: const Text('Welcom to User'),
                  automaticallyImplyLeading: false,
                  ) ;         
          }),
            //automaticallyImplyLeading: false,
          
          const Divider(),
          ListTile(
            leading: const Icon(Icons.border_all_sharp),
            title: const Text('All'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          Consumer<AuthManager>(builder: (context, authManager, child) {
            return Container(           
              child: authManager.authToken!.userId =='ie7w7sePzChszGj409DHHCXL2P92'// userid nguoi dung chinh
                  ? ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Manage Products'),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(UserProductsScreen.routeName);
                      },
                     )
                  :  Container(),
            );
          }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
        ],
      ),
    );
  }
}
