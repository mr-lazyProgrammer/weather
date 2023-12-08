import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key, required this.shell,
  });
  final StatefulNavigationShell shell;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width <= 450) {
      return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index){
          shell.goBranch(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
    }else{
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              selectedIndex: shell.currentIndex,
              onDestinationSelected: (index){
                shell.goBranch(index);
              },
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text('Settion')),
              ],
            ),
            Expanded(child: shell)
          ],
        ),
      );
    }
  }
}