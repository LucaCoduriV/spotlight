import 'package:flutter/material.dart';

import '../theme.dart';

class BSearchBar extends StatelessWidget {
  final TextEditingController textController;
  final bool showBackButton;
  const BSearchBar({
    super.key,
    required this.textController,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showBackButton)
                IconButton(
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
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
              ),
            ],
          ),
        ),
        Divider(thickness: 0.1, color: CustomTheme.textColor),
      ],
    );
  }
}
