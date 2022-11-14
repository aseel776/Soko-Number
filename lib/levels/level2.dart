import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soko_number/logic.dart';
import 'package:soko_number/main.dart';
import 'package:soko_number/structure.dart';

class Level2 extends StatefulWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  late Structure s;
  late Logic l;

  @override
  void initState() {
    super.initState();
    s = level2();
    l = Logic();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                s = level2();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Level 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Divider(
                indent: w * .3,
                endIndent: w * .3,
                color: Colors.white38,
              ),
              SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    s = l.userPlay(s, Positions.up);
                  });
                },
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.teal,
                ),
                color: Colors.white,
                elevation: 1,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        s = l.userPlay(s, Positions.left);
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.teal,
                    ),
                    color: Colors.white,
                    elevation: 1,
                  ),
                  SizedBox(width: 10),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        s = l.userPlay(s, Positions.down);
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.teal,
                    ),
                    color: Colors.white,
                    elevation: 1,
                  ),
                  SizedBox(width: 10),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        s = l.userPlay(s, Positions.right);
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.teal,
                    ),
                    color: Colors.white,
                    elevation: 1,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                s.printBoard(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              if (s.isFinal())
                const Text(
                  'You won!',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'Next States:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                ),
              ),
              ...s
                  .getNextStates()
                  .map(
                    (e) =>
                    Text(
                      e.printBoard(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
              )
                  .toList(),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          l.dfs(s);
        },
        backgroundColor: Colors.white,
        child: Text('DFS',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
