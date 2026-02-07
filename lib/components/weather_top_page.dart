import 'package:flutter/material.dart';

class WeatherTopPage extends StatelessWidget {
  const WeatherTopPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),

              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(20),
                  blurRadius: 5,
                  spreadRadius: 10,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),

            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.location_on, color: Colors.greenAccent),
              ),

              Text(name),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
            ],
          ),
        ],
      ),
    );
  }
}
