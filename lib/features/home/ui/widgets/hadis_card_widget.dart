import 'package:flutter/material.dart';

class HadisCardWidget extends StatelessWidget {
  const HadisCardWidget({
    super.key,
    required this.hadisText,
    required this.hadisTranslation,
  });
  final String hadisText;
  final String hadisTranslation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            hadisText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
          const SizedBox(height: 12),
          Text(
            hadisTranslation,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Reload button
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  // Reload action
                },
              ),
              // Share button
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
