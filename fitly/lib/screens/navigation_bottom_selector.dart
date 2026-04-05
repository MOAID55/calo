import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBottomSelector extends StatelessWidget {
  const NavigationBottomSelector({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_outlined),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Market",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
        
        type: .shifting,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        
      ),
      body: navigationShell,
    );
  }
}
