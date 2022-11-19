import 'package:soko_number/main.dart';
import 'package:soko_number/structure.dart';
import 'dart:collection';

class Logic {
  List<Structure> stack = [];
  Queue<Structure> queue = Queue<Structure>();


  Structure userPlay(Structure s, Positions p) {
    return s.move(p);
  }

  bool dfs(Structure s) {
    if (stack.isEmpty) {
      stack.add(s);
    } else {
      for (var st in stack) {
        if (s.equals(st)) {
          return false;
        }
      }
      stack.add(s);
    }
    if (s.isFinal()) {
      print('DONE');
      print('steps: ${stack.length - 1}');
      return true;
    } else {
      for (var st in s.getNextStates()) {
        if (dfs(st)) {
          return true;
        }
      }
      stack.removeLast();
      return false;
    }
  }

  void bfs(Structure s) {
    if (queue.isEmpty) {
      queue.addFirst(s);
    }
    while (queue.isNotEmpty) {
      if (queue.first.isFinal()) {
        print('DONE');
        print('steps: ........................');
        break;
      } else {
        for (var st in queue.first.getNextStates()) {
          queue.addLast(st);
        }
        queue.removeFirst();
      }
    }
  }

  void ucs(Structure s) {}

  void aStar(Structure s) {}
}
