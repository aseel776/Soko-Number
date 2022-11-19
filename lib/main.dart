import 'package:flutter/material.dart';
import 'package:soko_number/levels/level1.dart';
import 'package:soko_number/levels/level2.dart';
import 'package:soko_number/levels/level3.dart';
import 'package:soko_number/levels/level4.dart';
import 'package:soko_number/levels/level5.dart';
import 'package:soko_number/levels/level6.dart';
import 'package:soko_number/structure.dart';
import 'package:soko_number/types/block.dart';
import 'package:soko_number/types/empty.dart';
import 'package:soko_number/types/goal.dart';
import 'package:soko_number/types/play_box.dart';

//level 1
Structure level1() {
  Structure s;
  int w = 5;
  int h = 1;

  var b1 = Empty(r: 1, c: 1, empty: false);
  var b2 = Empty(r: 1, c: 2);
  var b3 = Empty(r: 1, c: 3);
  var b4 = Empty(r: 1, c: 4);
  var b5 = Goal(num: 1, r: 1, c: 5);
  var b = [b1, b2, b3, b4, b5];

  var p1 = PlayBox(num: 1, r: 1, c: 1);
  var p = [p1];

  s = Structure(width: w, height: h, board: b, playBoxes: p);

  s.parent = s;

  return s;
}

//level 2
Structure level2() {
  Structure s;
  int w = 3;
  int h = 4;

  var b11 = Empty(r: 1, c: 1, empty: false);
  var b12 = Block(r: 1, c: 2);
  var b13 = Empty(r: 1, c: 3, empty: false);
  var b21 = Empty(r: 2, c: 1);
  var b22 = Block(r: 2, c: 2);
  var b23 = Empty(r: 2, c: 3);
  var b31 = Empty(r: 3, c: 1);
  var b32 = Block(r: 3, c: 2);
  var b33 = Empty(r: 3, c: 3);
  var b41 = Goal(num: 1, r: 4, c: 1);
  var b42 = Block(r: 4, c: 2);
  var b43 = Goal(num: 2, r: 4, c: 3);
  var b = [
    b11, b12, b13,
    b21, b22, b23,
    b31, b32, b33,
    b41, b42, b43];

  var p1 = PlayBox(num: 1, r: 1, c: 1);
  var p2 = PlayBox(num: 2, r: 1, c: 3);
  var p = [p1, p2];

  s = Structure(width: w, height: h, board: b, playBoxes: p);

  s.parent = s;

  return s;
}

//level 3
Structure level3() {
  Structure s;
  int w = 3;
  int h = 3;

  var b11 = Empty(r: 1, c: 1, empty: false);
  var b12 = Goal(num: 2, r: 1, c: 2);
  var b13 = Empty(r: 1, c: 3);
  var b21 = Block(r: 2, c: 1);
  var b22 = Empty(r: 2, c: 2);
  var b23 = Block(r: 2, c: 3);
  var b31 = Empty(r: 3, c: 1);
  var b32 = Goal(num: 1, r: 3, c: 2);
  var b33 = Empty(r: 3, c: 3, empty: false);
  var b = [
    b11, b12, b13,
    b21, b22, b23,
    b31, b32, b33];

  var p1 = PlayBox(num: 1, r: 1, c: 1);
  var p2 = PlayBox(num: 2, r: 3, c: 3);

  var p = [p1, p2];

  s = Structure(width: w, height: h, board: b, playBoxes: p);

  s.parent = s;

  return s;
}

//level 4
Structure level4() {
  Structure s;
  int w = 5;
  int h = 3;

  var b11 = Empty(r: 1, c: 1, empty: false);
  var b12 = Block(r: 1, c: 2);
  var b13 = Empty(r: 1, c: 3, empty: false);
  var b14 = Block(r: 1, c: 4);
  var b15 = Empty(r: 1, c: 5, empty: false);
  var b21 = Goal(num: 3, r: 2, c: 1);
  var b22 = Empty(r: 2, c: 2);
  var b23 = Goal(num: 2, r: 2, c: 3);
  var b24 = Empty(r: 2, c: 4);
  var b25 = Goal(num: 1, r: 2, c: 5);
  var b31 = Block(r: 3, c: 1);
  var b32 = Block(r: 3, c: 2);
  var b33 = Empty(r: 3, c: 3);
  var b34 = Block(r: 3, c: 4);
  var b35 = Block(r: 3, c: 5);
  var b = [
    b11, b12, b13, b14, b15,
    b21, b22, b23, b24, b25,
    b31, b32, b33, b34, b35];


  var p1 = PlayBox(num: 1, r: 1, c: 1);
  var p2 = PlayBox(num: 2, r: 1, c: 3);
  var p3 = PlayBox(num: 3, r: 1, c: 5);
  var p = [p1, p2, p3];

  s = Structure(width: w, height: h, board: b, playBoxes: p);
  s.parent = s;
  return s;
}

//level 5
Structure level5() {
  Structure s;
  int w = 4;
  int h = 4;

  var b11 = Empty(r: 1, c: 1, empty: false);
  var b12 = Block(r: 1, c: 2);
  var b13 = Block(r: 1, c: 3);
  var b14 = Block(r: 1, c: 4);
  var b21 = Goal(num: 1, r: 2, c: 1);
  var b22 = Empty(r: 2, c: 2, empty: false);
  var b23 = Block(r: 2, c: 3);
  var b24 = Empty(r: 2, c: 4);
  var b31 = Empty(r: 3, c: 1);
  var b32 = Goal(num: 2, r: 3, c: 2);
  var b33 = Empty(r: 3, c: 3, empty: false);
  var b34 = Goal(num: 4, r: 3, c: 4);
  var b41 = Empty(r: 4, c: 1);
  var b42 = Empty(r: 4, c: 2);
  var b43 = Goal(num: 3, r: 4, c: 3);
  var b44 = Empty(r: 4, c: 4, empty: false);
  var b = [
    b11, b12, b13, b14,
    b21, b22, b23, b24,
    b31, b32, b33, b34,
    b41, b42, b43, b44];

  var p1 = PlayBox(num: 1, r: 1, c: 1);
  var p2 = PlayBox(num: 2, r: 2, c: 2);
  var p3 = PlayBox(num: 3, r: 3, c: 3);
  var p4 = PlayBox(num: 4, r: 4, c: 4);
  var p = [p1, p2, p3, p4];

  s = Structure(width: w, height: h, board: b, playBoxes: p);
  s.parent = s;
  return s;
}

//level 6
Structure level6() {
  Structure s;
  int w = 4;
  int h = 3;

  var b11 = Empty(r: 1, c: 1);
  var b12 = Empty(r: 1, c: 2);
  var b13 = Goal(num: 2, r: 1, c: 3, empty: false);
  var b14 = Block(r: 1, c: 4);
  var b21 = Empty(r: 2, c: 1);
  var b22 = Empty(r: 2, c: 2, empty: false);
  var b23 = Goal(num: 1, r: 2, c: 3);
  var b24 = Goal(num: 5, r: 2, c: 4, empty: false);
  var b31 = Empty(r: 3, c: 1, empty: false);
  var b32 = Block(r: 3, c: 2);
  var b33 = Goal(num: 3, r: 3, c: 3, empty: false);
  var b34 = Goal(num: 4, r: 3, c: 4);
  var b = [
    b11, b12, b13, b14,
    b21, b22, b23, b24,
    b31, b32, b33, b34];

  var p1 = PlayBox(num: 1, r: 2, c: 2);
  var p2 = PlayBox(num: 2, r: 1, c: 3);
  var p3 = PlayBox(num: 3, r: 3, c: 1);
  var p4 = PlayBox(num: 4, r: 3, c: 3);
  var p5 = PlayBox(num: 5, r: 2, c: 4);
  var p = [p1, p2, p3, p4, p5];

  s = Structure(width: w, height: h, board: b, playBoxes: p);
  s.parent = s;
  return s;
}

enum Positions { up, down, right, left }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soko Number',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'level1': (_) => const Level1(),
        'level2': (_) => const Level2(),
        'level3': (_) => const Level3(),
        'level4': (_) => const Level4(),
        'level5': (_) => const Level5(),
        'level6': (_) => const Level6(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'SOKO NUMBER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                wordSpacing: 16,
                fontSize: 30,
                color: Colors.white),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level1');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 1',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
              const SizedBox(width: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level2');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 2',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
              const SizedBox(width: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level3');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 3',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level4');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 4',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
              const SizedBox(width: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level5');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 5',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
              const SizedBox(width: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('level6');
                },
                color: Colors.white,
                minWidth: 120,
                height: 45,
                child: const Text(
                  'Level 6',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                elevation: 2,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.teal,
    );
  }
}