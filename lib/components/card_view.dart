import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.num, required this.labelName, required this.isDay, required this.imagePath});
  final String? num;
  final String? labelName;
  final bool isDay;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isDay ? Colors.blueAccent : Color(0xff05082e),
      shadowColor: isDay ? Colors.black : Colors.white.withAlpha(100),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            SizedBox(width: 80, height: 20),
            Image.asset(imagePath, height: 50, width: 50),
            Text('${num}'),
            Text('${labelName}'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
