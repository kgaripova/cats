import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return label.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
                Expanded(child: Text(value)),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
