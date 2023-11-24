import 'package:flutter/material.dart';
import 'package:scoreboard_apps/pages/badminton.dart';
import 'package:scoreboard_apps/pages/basketball.dart';
import 'package:scoreboard_apps/pages/soccer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/soccer': (context) => SoccerPage(),
        '/badminton': (context) => BadmintonPage(),
        '/basketball': (context) => BasketballPage(),
      },
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard Apps"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/soccer');
              },
              child: CustomCard(
                title: 'Soccer Match',
                image: 'images/soccer.png',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/badminton');
              },
              child: CustomCard(
                title: 'Badminton Match',
                image: 'images/badminton.png',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/basketball');
              },
              child: CustomCard(
                title: 'Basketball Match',
                image: 'images/basketball.png',
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String image;

  const CustomCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                image,
                width: 330,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
