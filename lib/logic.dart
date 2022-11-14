import 'package:soko_number/main.dart';
import 'package:soko_number/structure.dart';

class Logic {
  List<Structure> nodes = [];

  Structure userPlay(Structure s, Positions p) {
    return s.move(p);
  }

  void dfs(Structure s) {
    if (nodes.isEmpty) {
      nodes.add(s);
    } else {
      for (var st in nodes) {
        if (s.equals(st)) {
          return ;
        }
      }
      nodes.add(s);
    }
    Structure su = s.move(Positions.up);
    dfs(su);
    Structure sd = s.move(Positions.down);
    dfs(sd);
    Structure sr = s.move(Positions.right);
    dfs(sr);
    Structure sl = s.move(Positions.left);
    dfs(sl);
    if(s.isFinal()){
      print('DONE');
      for(var ss in nodes){
        ss.printB();
      }
    }else{
      nodes.remove(s);
    }
  }

  void bfs(Structure s) {}

  void ucs(Structure s) {}

  void aStar(Structure s) {}
}
