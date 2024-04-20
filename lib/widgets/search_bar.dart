import 'package:flutter/material.dart';

import '../theme.dart';

class BSearchBar extends StatelessWidget {
  final TextEditingController textController;
  const BSearchBar({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 20,
          ),
          child: TextField(
            textInputAction: TextInputAction.none,
            autofocus: true,
            controller: textController,
            showCursor: false,
            style: CustomTheme.primaryText.copyWith(fontSize: 18),
            decoration: InputDecoration.collapsed(
              hintStyle: CustomTheme.hintText,
              hintText: 'Search for apps and commands...',
            ),
          ),
        ),
        Divider(thickness: 0.1, color: CustomTheme.textColor),
      ],
    );
  }
}
