import 'package:flutter/material.dart';
import 'dart:async';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  int homeScore = 0;
  int awayScore = 0;
  bool isTimerRunning = false;
  int minutes = 10;
  int seconds = 00;
  Timer? _timer;

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

  void startTimer() {
    if (!isTimerRunning) {
      isTimerRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (minutes == 0 && seconds == 0) {
          _timer?.cancel();
          isTimerRunning = false;
        } else if (seconds == 0) {
          setState(() {
            minutes--;
            seconds = 59;
          });
        } else {
          setState(() {
            seconds--;
          });
        }
      });
    }
  }

  void stopTimer() {
    if (isTimerRunning) {
      _timer?.cancel();
      isTimerRunning = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball Match"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/basketball.png'),
                      fit: BoxFit.cover))),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: EdgeInsets.all(15)),
                      onPressed: () {
                        startTimer();
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: EdgeInsets.all(15)),
                      onPressed: () {
                        stopTimer();
                      },
                      child: Text(
                        "Stop",
                        style: TextStyle(fontSize: 20),
                      ),
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
