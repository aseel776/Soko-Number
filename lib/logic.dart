import 'package:soko_number/main.dart';
import 'package:soko_number/structure.dart';
import 'dart:collection';

class Logic {

  List<Structure> stack = [];
  //defined as a list but dealt with as a stack using add() which adds to the end of the list to and removeLast()

  int counter = 0;
  //to keep track of the visited nodes in dfs algo

  Queue<Structure> queue = Queue<Structure>();

  List<Structure> pq = [];
  //defined as a list to get use of sort() function since Priority Queue isn't defined in dart

  Structure userPlay(Structure s, Positions p) {
    return s.move(p);
  }

  bool dfs(Structure s) {
    counter++;

    if (stack.isEmpty) {
      stack.add(s);
    }
    else {
      for (var st in stack) {
        if (s.equals(st)) {
          //check if this node was visited
          return false;
        }
      }
      stack.add(s);
    }

    if (s.isFinal()) {
      print('DFS');
      print('steps: ${stack.length - 1}');
      print('visited nodes: $counter');
      print('Solution\'s Path');
      for (var st in stack){
        st.printB();
      }
      return true;
    }
    else {
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
    queue.clear();
    queue.addFirst(s);

    var space = <Structure>[];
    //used to store all visited nodes

    outer: while (queue.isNotEmpty) {
      for (var temp in space) {
        if (queue.first.equals(temp)) {
          //check if this node was visited
          queue.removeFirst();
          continue outer;
        }
      }

      space.add(queue.first);

      if (queue.first.isFinal()) {
        print('BFS');
        print('steps: ${queue.first.road.length}');
        print('visited nodes: ${space.length}');
        print('Solution\'s Path');
        queue.first.road.add(queue.first.hashCode);
        for(var hash in queue.first.road){
          space.singleWhere((element) => element.hashCode == hash).printB();
        }
        break;
      }
      else {
        for (var st in queue.first.getNextStates()) {
          //full path = parent's path + parent
          st.road.addAll(queue.first.road);
          st.road.add(queue.first.hashCode);
          queue.addLast(st);
        }
        queue.removeFirst();
      }
    }
  }

  void ucs(Structure s) {

    double minCost = double.infinity;
    List<int> shortestPath = [];
    List<Structure> space = [];

    pq.clear();
    pq.add(s);

    outer: while(pq.isNotEmpty){

      //sort according to path length to get priority-queue idea done
      pq.sort((a, b) => a.road.length.compareTo(b.road.length));

      for (var temp in space){
        if(pq.first.equals(temp)){
          pq.removeAt(0);
          continue outer;
        }
      }

      space.add(pq.first);

      if(pq.first.isFinal()){
        if(minCost > pq.first.road.length){
          minCost = pq.first.road.length.toDouble();
          shortestPath.addAll(pq.first.road);
          shortestPath.add(pq.first.hashCode);
        }
        break;
      }

      for(var st in pq.first.getNextStates()){
        //full path = parent's path + parent
        st.road.addAll(pq.first.road);
        st.road.add(pq.first.hashCode);
        pq.add(st);
      }

      pq.removeAt(0);
    }

    print('UCS');
    print('cost: ${minCost.toInt()}');
    print('visited nodes ${space.length}');
    print('Solution\'s Path');
    for(var hash in shortestPath){
      space.singleWhere((element) => element.hashCode == hash).printB();
    }

  }

  void aStar(Structure s) {}
}
