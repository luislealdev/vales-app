import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String description;
  final String value;

  const StatRow({super.key, required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(description, style: const TextStyle(fontSize: 16)),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.green))
      ],
    );
  }
}
