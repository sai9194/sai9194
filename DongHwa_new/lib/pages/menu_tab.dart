import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const MenuItem({required this.title, required this.icon, required this.onTap});
}

class MenuTab extends StatelessWidget {
  final List<MenuItem> items;
  const MenuTab({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.6,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final x = items[i];
        return InkWell(
          onTap: x.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Card(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(x.icon, size: 30),
                  const SizedBox(height: 8),
                  Text(x.title, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
