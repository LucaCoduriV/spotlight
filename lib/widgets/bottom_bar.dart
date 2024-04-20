import 'package:flutter/material.dart';
import 'package:spotlight/theme.dart';

class BBottomBar extends StatelessWidget {
  const BBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.web, color: CustomTheme.textColor),
            Row(
              children: [
                Text("Open", style: CustomTheme.primaryText),
                const SizedBox(width: 10),
                Icon(Icons.open_with, color: CustomTheme.textColor),
                const SizedBox(width: 5),
                Text("|", style: CustomTheme.primaryText),
                const SizedBox(width: 5),
                Text("more", style: CustomTheme.primaryText),
                const SizedBox(width: 10),
                Icon(Icons.more, color: CustomTheme.textColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
