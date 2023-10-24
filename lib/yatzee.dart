import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Yatzee extends StatefulWidget {
  const Yatzee({super.key});

  @override
  State<Yatzee> createState() => _YatzeeState();
}

class _YatzeeState extends State<Yatzee> {
  var dices = [1, 1, 1, 1, 1];
  var dicevalues = [false, false, false, false, false];
  int round = 3;
  Random rng = Random();

  bool onesvalue = false;
  bool twosvalue = false;
  bool threesvalue = false;
  bool foursvalue = false;
  bool fivesvalue = false;
  bool sixesvalue = false;

  bool threekindvalue = false;
  bool fourkindvalue = false;
  bool fullhousevalue = false;
  bool shortstraightvalue = false;
  bool longstraightvalue = false;
  bool yatzeevalue = false;
  bool chancevalue = false;

  int ones = 0;
  int twos = 0;
  int threes = 0;
  int fours = 0;
  int fives = 0;
  int sixes = 0;

  int threekind = 0;
  int fourkind = 0;
  int fullhouse = 0;
  int shortstraight = 0;
  int longstraight = 0;
  int yatzee = 0;
  int chance = 0;

  diceroll() {
    setState(() {
      if (round != 0) {
        round -= 1;
        for (int i = 0; i < 5; i++) {
          if (dicevalues[i] == false) {
            dices[i] = rng.nextInt(6) + 1;
          }
        }
      }
      if (onesvalue &&
          twosvalue &&
          threesvalue &&
          foursvalue &&
          fivesvalue &&
          sixesvalue &&
          threekindvalue &&
          fourkindvalue &&
          fullhousevalue &&
          shortstraightvalue &&
          longstraightvalue &&
          yatzeevalue &&
          chancevalue) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Game finished"),
              content: Row(
                children: [
                  Text(
                      "points: ${ones + twos + threes + fours + fives + sixes + threekind + fourkind + fullhouse + shortstraight + longstraight + yatzee + chance}"),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Statistics"),
                                content: Column(
                                  children: [
                                    Text("ones: $ones"),
                                    Text("twos: $twos"),
                                    Text("threes: $threes"),
                                    Text("fours: $fours"),
                                    Text("fives: $fives"),
                                    Text("sixes: $sixes"),
                                    Text("threekind: $threekind"),
                                    Text("fourkind: $fourkind"),
                                    Text("fullhouse: $fullhouse"),
                                    Text("shortstraight: $shortstraight"),
                                    Text("longstraight: $longstraight"),
                                    Text("yatzee: $yatzee"),
                                    Text("chance: $chance"),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      child: const Text("Back"),
                                      onPressed: () =>
                                          Navigator.of(context).pop())
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.info_outline_rounded))
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Exit")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Yatzee()),
                      );
                    },
                    child: const Text("Play Again"))
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Points: ${ones + twos + threes + fours + fives + sixes + threekind + fourkind + fullhouse + shortstraight + longstraight + yatzee + chance}",
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text("Ones"),
                        Checkbox(
                          value: onesvalue,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true && round != 3) {
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                onesvalue = true;
                                round = 3;
                                for (int i in dices) {
                                  if (i == 1) {
                                    ones += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Twos"),
                        Checkbox(
                          value: twosvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                twosvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i in dices) {
                                  if (i == 2) {
                                    twos += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Threes"),
                        Checkbox(
                          value: threesvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                threesvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i in dices) {
                                  if (i == 1) {
                                    threes += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Fours"),
                        Checkbox(
                          value: foursvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                foursvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i in dices) {
                                  if (i == 3) {
                                    fours += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Fives"),
                        Checkbox(
                          value: fivesvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                fivesvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i in dices) {
                                  if (i == 5) {
                                    fives += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Sixes"),
                        Checkbox(
                          value: sixesvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                sixesvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i in dices) {
                                  if (i == 6) {
                                    sixes += i;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text("threekind"),
                        Checkbox(
                          value: threekindvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                threekindvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i = 1; i < 7; i++) {
                                  int times = 0;
                                  for (int j in dices) {
                                    if (i == j) {
                                      times += 1;
                                    }
                                  }
                                  if (times > 2) {
                                    threekind = dices.sum;
                                    break;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("fourkind"),
                        Checkbox(
                          value: fourkindvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                fourkindvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i = 1; i < 7; i++) {
                                  int times = 0;
                                  for (int j in dices) {
                                    if (i == j) {
                                      times += 1;
                                    }
                                  }
                                  if (times > 3) {
                                    fourkind = dices.sum;
                                    break;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("fullhouse"),
                        Checkbox(
                          value: fullhousevalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                fullhousevalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i = 1; i < 7; i++) {
                                  int times = 0;
                                  for (int j in dices) {
                                    if (i == j) {
                                      times += 1;
                                    }
                                  }
                                  if (!(times > 3)) {
                                    for (int i = 1; i < 7; i++) {
                                      int times = 0;
                                      for (int j in dices) {
                                        if (i == j) {
                                          times += 1;
                                        }
                                      }
                                      if (times == 3) {
                                        for (int i = 1; i < 7; i++) {
                                          int times = 0;
                                          for (int j in dices) {
                                            if (i == j) {
                                              times += 1;
                                            }
                                          }
                                          if (times == 2) {
                                            fullhouse = 25;
                                            break;
                                          }
                                        }
                                        break;
                                      }
                                    }
                                    break;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("shortstraight"),
                        Checkbox(
                          value: shortstraightvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                shortstraightvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                if (dices.toString().contains("1") &&
                                    dices.toString().contains("2") &&
                                    dices.toString().contains("3") &&
                                    dices.toString().contains("4")) {
                                  shortstraight = 30;
                                } else {
                                  if (dices.toString().contains("2") &&
                                      dices.toString().contains("3") &&
                                      dices.toString().contains("4") &&
                                      dices.toString().contains("5")) {
                                    shortstraight = 30;
                                  } else {
                                    if (dices.toString().contains("3") &&
                                        dices.toString().contains("4") &&
                                        dices.toString().contains("5") &&
                                        dices.toString().contains("6")) {
                                      shortstraight = 30;
                                    }
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("longstraight"),
                        Checkbox(
                          value: longstraightvalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                longstraightvalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                if (dices.toString().contains("1") &&
                                    dices.toString().contains("2") &&
                                    dices.toString().contains("3") &&
                                    dices.toString().contains("4") &&
                                    dices.toString().contains("5")) {
                                  longstraight = 40;
                                } else {
                                  if (dices.toString().contains("2") &&
                                      dices.toString().contains("3") &&
                                      dices.toString().contains("4") &&
                                      dices.toString().contains("5") &&
                                      dices.toString().contains("6")) {
                                    longstraight = 40;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("yatzee"),
                        Checkbox(
                          value: yatzeevalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                yatzeevalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                for (int i = 1; i < 7; i++) {
                                  int times = 0;
                                  for (int j in dices) {
                                    if (i == j) {
                                      times += 1;
                                    }
                                  }
                                  if (times == 5) {
                                    yatzee = dices.sum;
                                    break;
                                  }
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("chance"),
                        Checkbox(
                          value: chancevalue,
                          onChanged: (value) {
                            setState(() {
                              if (value == true && round != 3) {
                                chancevalue = true;
                                round = 3;
                                for (int i = 0; i < 5; i++) {
                                  dicevalues[i] = false;
                                }
                                chance = dices.sum;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      color: dicevalues[0] == false
                          ? Colors.white
                          : Colors.yellow,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (round != 3) {
                              dicevalues[0] = !dicevalues[0];
                            }
                          });
                        },
                        child: Text(
                          dices[0].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      color: dicevalues[1] == false
                          ? Colors.white
                          : Colors.yellow,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (round != 3) {
                              dicevalues[1] = !dicevalues[1];
                            }
                          });
                        },
                        child: Text(
                          dices[1].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      color: dicevalues[2] == false
                          ? Colors.white
                          : Colors.yellow,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (round != 3) {
                              dicevalues[2] = !dicevalues[2];
                            }
                          });
                        },
                        child: Text(
                          dices[2].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      color: dicevalues[3] == false
                          ? Colors.white
                          : Colors.yellow,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (round != 3) {
                              dicevalues[3] = !dicevalues[3];
                            }
                          });
                        },
                        child: Text(
                          dices[3].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      color: dicevalues[4] == false
                          ? Colors.white
                          : Colors.yellow,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (round != 3) {
                              dicevalues[4] = !dicevalues[4];
                            }
                          });
                        },
                        child: Text(
                          dices[4].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Text(
                  "Rolls left: $round",
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                ElevatedButton(
                  child: onesvalue &&
                          twosvalue &&
                          threesvalue &&
                          foursvalue &&
                          fivesvalue &&
                          sixesvalue &&
                          threekindvalue &&
                          fourkindvalue &&
                          fullhousevalue &&
                          shortstraightvalue &&
                          longstraightvalue &&
                          yatzeevalue &&
                          chancevalue
                      ? const Text("Finish")
                      : const Text("Roll"),
                  onPressed: () => diceroll(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
