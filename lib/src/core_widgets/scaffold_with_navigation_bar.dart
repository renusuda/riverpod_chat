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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0.5, thickness: 0.5),
          NavigationBar(
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(
                label: 'DM',
                icon: Icon(Icons.sms),
              ),
              NavigationDestination(
                label: 'プロフィール',
                icon: Icon(Icons.person_outline),
              ),
            ],
            onDestinationSelected: onDestinationSelected,
          ),
        ],
      ),
    );
  }
}
