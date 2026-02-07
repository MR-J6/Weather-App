import 'package:flutter/material.dart';

class IndexBar extends StatelessWidget {
  final List<String> letters;
  final Function(Offset, List<String>) onDrag;

  const IndexBar({
    super.key,
    required this.letters,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) => onDrag(details.globalPosition, letters),
        onVerticalDragDown: (details) => onDrag(details.globalPosition, letters),
        child: Container(
          width: 40,
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: letters.map((letter) => _buildLetter(letter)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildLetter(String letter) {
    return Expanded(
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
