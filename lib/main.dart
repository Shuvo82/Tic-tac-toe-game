import 'package:flutter/material.dart';
import 'package:tic_tac_toe/enums/box_state.dart';
import 'package:tic_tac_toe/enums/game_state.dart';
import 'package:tic_tac_toe/widgets/box_state_to_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String turn = "Cross";
  GameState gameState = GameState.isNotFinished;
  bool isCrossTurn = true;

  //row 1
  BoxState r1c1 = BoxState.empty;
  BoxState r1c2 = BoxState.empty;
  BoxState r1c3 = BoxState.empty;

  //row 2
  BoxState r2c1 = BoxState.empty;
  BoxState r2c2 = BoxState.empty;
  BoxState r2c3 = BoxState.empty;

  //row 3
  BoxState r3c1 = BoxState.empty;
  BoxState r3c2 = BoxState.empty;
  BoxState r3c3 = BoxState.empty;

  void gameScoreUpdate() {
    if (r1c1 == r1c2 && r1c1 == r1c3 && r1c1 != BoxState.empty) {
      if (r1c1 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r2c1 == r2c2 && r2c1 == r2c3 && r2c1 != BoxState.empty) {
      if (r2c1 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r3c1 == r3c2 && r3c1 == r3c3 && r3c1 != BoxState.empty) {
      if (r3c1 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c1 == r2c1 && r1c1 == r3c1 && r1c1 != BoxState.empty) {
      if (r1c1 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c2 == r2c2 && r1c2 == r3c2 && r1c2 != BoxState.empty) {
      if (r1c2 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c3 == r2c3 && r1c3 == r3c3 && r1c3 != BoxState.empty) {
      if (r1c3 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c1 == r2c2 && r1c1 == r3c3 && r1c1 != BoxState.empty) {
      if (r1c1 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c3 == r2c2 && r1c3 == r3c1 && r1c3 != BoxState.empty) {
      if (r1c3 == BoxState.cross) {
        gameState = GameState.crossWin;
      } else {
        gameState = GameState.circleWin;
      }
    } else if (r1c1 != BoxState.empty &&
        r1c2 != BoxState.empty &&
        r1c3 != BoxState.empty &&
        r2c1 != BoxState.empty &&
        r2c2 != BoxState.empty &&
        r2c3 != BoxState.empty &&
        r3c1 != BoxState.empty &&
        r3c2 != BoxState.empty &&
        r3c3 != BoxState.empty) {
      gameState = GameState.draw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tic Tac Toe')),
          backgroundColor: Colors.blueGrey[900],
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  r1c1 = BoxState.empty;
                  r1c2 = BoxState.empty;
                  r1c3 = BoxState.empty;
                  r2c1 = BoxState.empty;
                  r2c2 = BoxState.empty;
                  r2c3 = BoxState.empty;
                  r3c1 = BoxState.empty;
                  r3c2 = BoxState.empty;
                  r3c3 = BoxState.empty;
                  gameState = GameState.isNotFinished;
                });
              },
              child: const Icon(
                Icons.restart_alt,
                size: 32,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Turn: $turn",
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r1c1 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r1c1 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r1c1 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r1c1,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r1c2 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r1c2 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r1c2 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r1c2,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r1c3 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r1c3 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r1c3 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r1c3,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r2c1 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r2c1 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r2c1 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r2c1,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r2c2 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r2c2 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r2c2 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r2c2,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r2c3 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r2c3 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r2c3 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r2c3,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r3c1 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r3c1 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r3c1 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r3c1,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r3c2 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r3c2 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r3c2 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r3c2,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (r3c3 == BoxState.empty) {
                                  if (isCrossTurn) {
                                    r3c3 = BoxState.cross;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Circle';
                                  } else {
                                    r3c3 = BoxState.circle;
                                    isCrossTurn = !isCrossTurn;
                                    turn = 'Cross';
                                  }
                                }
                                gameScoreUpdate();
                              });
                            },
                            child: Container(
                                color: Colors.blueGrey[900],
                                child: BoxStateToIcon(
                                  box_name: r3c3,
                                )),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            gameState == GameState.isNotFinished
                ? const SizedBox(
                    height: 32,
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(.6),
                    ),
                    child: Center(
                      child: Text(
                        gameState == GameState.draw
                            ? 'Draw!'
                            : gameState == GameState.crossWin
                                ? 'Cross Won!'
                                : 'Circle Won!',
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
          ],
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
