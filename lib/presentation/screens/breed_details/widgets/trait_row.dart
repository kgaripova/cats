import 'package:flutter/material.dart';

class TraitRow extends StatelessWidget {
  const TraitRow({super.key, required this.label, required this.value});

  final String label;
  final int value; // 1–5

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(label, style: theme.textTheme.bodyMedium),
          ),
          ...List.generate(5, (i) {
            final filled = i < value;
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                filled ? Icons.circle : Icons.circle_outlined,
                size: 12,
                color: filled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outlineVariant,
              ),
            );
          }),
        ],
      ),
    );
  }
}
