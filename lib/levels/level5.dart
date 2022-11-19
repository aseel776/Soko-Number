import 'package:flutter/material.dart';
import 'package:soko_number/logic.dart';
import 'package:soko_number/main.dart';
import 'package:soko_number/structure.dart';

class Level5 extends StatefulWidget {
  const Level5({Key? key}) : super(key: key);

  @override
  State<Level5> createState() => _Level5State();
}

class _Level5State extends State<Level5> {
  late Structure s;
  late Logic l;

  @override
  void initState() {
    super.initState();
    s = level5();
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Level 5',
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
              const SizedBox(height: 50),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                s = level5();
              });
            },
            child: const Icon(
              Icons.refresh,
              color: Colors.teal,
            ),
            backgroundColor: Colors.white,
            heroTag: 0,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              l.stack.clear();
              l.dfs(s);
            },
            backgroundColor: Colors.white,
            child: Text(
              'DFS',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            heroTag: 1,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              l.queue.clear();
              l.bfs(s);
            },
            backgroundColor: Colors.white,
            child: Text(
              'BFS',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            heroTag: 2,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              l.ucs(s);
            },
            backgroundColor: Colors.white,
            child: Text(
              'UCS',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            heroTag: 3,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              l.aStar(s);
            },
            backgroundColor: Colors.white,
            child: Text(
              'A*',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            heroTag: 4,
          ),
        ],
      ),
    );
  }
}
