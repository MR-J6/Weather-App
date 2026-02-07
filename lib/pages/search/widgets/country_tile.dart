import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryTile extends StatelessWidget {
  final CountryModel country;
  final VoidCallback onTap;

  const CountryTile({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xff05082e),
      title: Text(
        country.name,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
