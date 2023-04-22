import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class FreakingMath extends StatefulWidget {
  const FreakingMath({Key? key}) : super(key: key);

  @override
  State<FreakingMath> createState() => _FreakingMathState();
}

class _FreakingMathState extends State<FreakingMath> {
  int status = 0;

  //0: home, 1: play, 2: gameover, 3: more
  int score = 0;
  int bestScore = 0;
  int time = 10;
  late int x1, x2;
  late int correctAns, ans;
  late String operator;
  late Timer timer;

  List<String> listOperator = ["+", "-", "x", "/"];

  @override
  Widget build(BuildContext context) {
    return status == 0
        ? Home()
        : status == 1
            ? Play()
            : status == 2
            ? GameOver()
            : MoreAction();
  }

  Container Home() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            child: Text(
              "Freaking Math",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                score = 0;
                status = 1;
                createExpression();
                setState(() {});
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 70,
              )),
        ],
      ),
    );
  }

  Container Play() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * time / 10,
                height: 10,
                color: Colors.white,
              )
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$score",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height /5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("$x1", style: const TextStyle(color: Colors.white, fontSize: 40)),
                    Text(operator, style: const TextStyle(color: Colors.white, fontSize: 40)),
                    Text("$x2", style: const TextStyle(color: Colors.white, fontSize: 40)),
                    const Text(" = ", style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text("$ans", style: const TextStyle(color: Colors.white, fontSize: 40)),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height /5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      width: MediaQuery.of(context).size.width /3,
                      height: MediaQuery.of(context).size.height /6,
                      child: ElevatedButton(
                        onPressed: () {
                          resetTime();
                          if (ans == correctAns) {
                            score++;
                            createExpression();
                            setState(() {
                            });
                          } else {
                            over();
                          }
                        },
                        child: const Icon(Icons.check, color: Colors.green, size: 60),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /3,
                      height: MediaQuery.of(context).size.height /6,

                      child: ElevatedButton(

                          onPressed: () {
                            resetTime();
                            if (ans != correctAns) {
                              score++;
                              createExpression();
                            } else {
                              over();
                            }
                          },
                          child: const Icon(Icons.clear, color: Colors.red, size: 60)
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container GameOver() {
    return Container(
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$score",
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Game Over",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Text(
                  "Your score: $score",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text("Best Score: $bestScore",
                    style: TextStyle(color: Colors.white, fontSize: 30))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    status = 0;
                    score = 0;
                    setState(() {
                    });
                  },
                  child: Icon(Icons.replay, color: Colors.white, size: 50,)),
              ElevatedButton(
                  onPressed: () {
                    status = 3;
                    setState(() {

                    });
                  },
                  child: Icon(Icons.menu, color: Colors.white, size: 50,))
            ],
          )
        ],
      ),
    );
  }

  Container MoreAction() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      color: Colors.pinkAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          const Text(
            "Em chưa biết làm gì nữa :v",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              status = 2;
              setState(() {
              });
            },
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 50),
          )
        ],
      )
    );
  }

  createExpression() {
    var random = Random();
    x1 = random.nextInt(20);
    x2 = random.nextInt(20) + 1;
    var rdOperator = random.nextInt(listOperator.length - 1);
    operator = listOperator[rdOperator];
    switch (rdOperator) {
      case 0:
        correctAns = x1 + x2;
        break;
      case 1:
        correctAns = x1 - x2;
        break;
      case 2:
        correctAns = x1 * x2;
        break;
      case 3:
        correctAns = x1 ~/ x2;
        break;
    }
    ans = correctAns + (random.nextInt(2) - 1);
    setTime();
  }

  over() {
    status = 2;
    bestScore = max(score, bestScore);
    resetTime();
  }

  setTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      time--;
      if (time <= 0) {
        timer.cancel();
        over();
      }
      setState(() {
      });
    });
  }

  resetTime() {
    timer.cancel();
    time = 10;
    setState(() {

    });

  }
}
