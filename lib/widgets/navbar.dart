import 'package:currenseetest/history_page.dart';
import 'package:currenseetest/home.dart';
import 'package:currenseetest/home_page.dart';
import 'package:currenseetest/services/conversion_history.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ConversionHistory> history = [];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("olamideao"),
              accountEmail: const Text("olamide@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                      "assets/images/color.jpg",
                       width: 90,
                       height: 90,
                       fit: BoxFit.cover,
                  ),
                ),
              ),
            decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/pexel.jpg"
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const HomePage();
                })),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const HomePage();
                })),
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text("News"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const Home();
                })),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const HomePage();
                })),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sign Out"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const HomePage();
                })),
          ),
        ],
      ),
    );
  }
}
