import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        cursorColor: Colors.purple,
        style: const TextStyle(color: Colors.purple),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search for your Country...',
          hintStyle: const TextStyle(color: Colors.blue),
          labelText: 'Search',
          labelStyle: const TextStyle(color: Colors.blue),
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
