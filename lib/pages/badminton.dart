import 'package:flutter/material.dart';

class BadmintonPage extends StatefulWidget {
  const BadmintonPage({super.key});

  @override
  State<BadmintonPage> createState() => _BadmintonPageState();
}

class _BadmintonPageState extends State<BadmintonPage> {
  int homeScore = 0;
  int awayScore = 0;
  bool isTimerRunning = false;

  void incrementHomeScore() {
    setState(() {
      homeScore++;
    });
  }

  void restartHomeScore() {
    setState(() {
      if (homeScore > 0) {
        homeScore = 0;
      }
    });
  }

  void incrementAwayScore() {
    setState(() {
      awayScore++;
    });
  }

  void restartAwayScore() {
    setState(() {
      if (awayScore > 0) {
        awayScore = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Badminton Match"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/badminton.png'),
                      fit: BoxFit.cover))),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "HOME",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        restartHomeScore();
                      },
                      child: Icon(
                        Icons.restart_alt,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: CircleBorder(),
                          backgroundColor: Colors.red[900]),
                    ),
                    Text(
                      "$homeScore",
                      style: TextStyle(fontSize: 150, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        incrementHomeScore();
                      },
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: CircleBorder(),
                          backgroundColor: Colors.red[900]),
                    ),
                  ],
                ),
                Text(
                  "AWAY",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        restartAwayScore();
                      },
                      child: Icon(
                        Icons.restart_alt,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: CircleBorder(),
                          backgroundColor: Colors.red[900]),
                    ),
                    Text(
                      "$awayScore",
                      style: TextStyle(fontSize: 150, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        incrementAwayScore();
                      },
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: CircleBorder(),
                          backgroundColor: Colors.red[900]),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
