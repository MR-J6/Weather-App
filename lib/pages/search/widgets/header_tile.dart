import 'package:flutter/material.dart';

class HeaderTile extends StatelessWidget {
  final String tag;

  const HeaderTile({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.blue.withValues(alpha: 0.3),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
