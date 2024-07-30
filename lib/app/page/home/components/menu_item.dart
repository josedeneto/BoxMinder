import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const MenuItemTile({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 26, 26),
              border: Border.all(
                color: const Color(0XFF343434),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
