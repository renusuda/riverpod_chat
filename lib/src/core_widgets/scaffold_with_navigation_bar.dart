import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;

  final int selectedIndex;

  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            label: 'チャット',
            icon: Icon(Icons.sms),
          ),
          NavigationDestination(
            label: 'プロフィール',
            icon: Icon(Icons.person_outline),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
