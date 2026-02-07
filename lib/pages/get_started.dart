import 'package:flutter/material.dart';
import 'package:weather_app_remake/pages/search_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff05082e),
        body: Column(
          children: [
            SizedBox(height: 60, width: double.infinity),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(1),
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.8),
                    blurRadius: 25,
                    spreadRadius: 10,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Daily',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Weather',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Get to Know your Weather',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'maps and radar precipitation',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'forecast.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page or perform an action
                Navigator.push(
                  context,  
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.blue,
                elevation: 3,
              ),
              child: Text('Get Started'),
            ),
            SizedBox(height: 40),
          ],
        ),
    );
  }
}
