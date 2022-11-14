import 'package:soko_number/main.dart';
import 'package:soko_number/types/block.dart';
import 'package:soko_number/types/box.dart';
import 'package:soko_number/types/empty.dart';
import 'package:soko_number/types/goal.dart';
import 'package:soko_number/types/play_box.dart';

class Structure {
  int? height;
  int? width;
  List<Box>? board;
  List<PlayBox>? playBoxes;
  Structure? parent;

  Structure(
      {required this.width,
      required this.height,
      required this.board,
      required this.playBoxes});

  List<Positions> checkMoves(PlayBox box) {
    Box up = board!.singleWhere(
      (element) =>
          element.column == box.column && element.row == (box.row! - 1),
      orElse: () => Block(r: -1, c: -1),
    );
    Box down = board!.singleWhere(
      (element) =>
          element.column == box.column && element.row == (box.row! + 1),
      orElse: () => Block(r: -1, c: -1),
    );
    Box right = board!.singleWhere(
      (element) =>
          element.row == box.row && element.column == (box.column! + 1),
      orElse: () => Block(r: -1, c: -1),
    );
    Box left = board!.singleWhere(
      (element) =>
          element.row == box.row && element.column == (box.column! - 1),
      orElse: () => Block(r: -1, c: -1),
    );

    List<Positions> p = [];

    //up
    if (box.row!.compareTo(1) == 1) {
      if (up.isEmpty!) {
        p.add(Positions.up);
      }
    }
    //down
    if (box.row!.compareTo(height!) == -1) {
      if (down.isEmpty!) {
        p.add(Positions.down);
      }
    }
    //right
    if (box.column!.compareTo(width!) == -1) {
      if (right.isEmpty!) {
        p.add(Positions.right);
      }
    }
    //left
    if (box.column!.compareTo(1) == 1) {
      if (left.isEmpty!) {
        p.add(Positions.left);
      }
    }
    return p;
  }

  Structure move(Positions p) {
    var b = <Box>[];
    for (var x in board!) {
      b.add(x.copy());
    }

    var pb = <PlayBox>[];
    for (var x in playBoxes!) {
      pb.add(x.copy());
    }

    var temp = <Box>[];

    for (var element in pb) {
      List<Positions> moves = checkMoves(element);
      if (moves.contains(p)) {
        temp.add(b.singleWhere(
            (x) => x.row == element.row && x.column == element.column));
        switch (p) {
          case Positions.right:
            element.column = element.column! + 1;
            break;
          case Positions.left:
            element.column = element.column! - 1;
            break;
          case Positions.up:
            element.row = element.row! - 1;
            break;
          case Positions.down:
            element.row = element.row! + 1;
            break;
          default:
            break;
        }
        b
            .singleWhere(
                (x) => x.row == element.row && x.column == element.column)
            .isEmpty = false;
      }
    }
    for (var x in temp) {
      b
          .singleWhere(
              (element) => element.row == x.row && element.column == x.column)
          .isEmpty = true;
    }
    var s = Structure(width: width, height: height, board: b, playBoxes: pb);
    return s;
  }

  List<Structure> getNextStates() {
    List<Structure> states = [];
    for (var pb in playBoxes!) {
      var positions = checkMoves(pb);
      for (var p in positions) {
        var s = move(p);
        var included = false;
        for (var temp in states) {
          if (s.equals(temp)) {
            included = true;
            break;
          }
        }
        if(!included){
          states.add(s);
        }
      }
    }
    return states;
  }

  bool equals(Structure s) {
    return (width == s.width) &&
        (height == s.height) &&
        (listsEquality(board!, s.board!)) &&
        (listsEquality(playBoxes!, s.playBoxes!));
  }

  bool isFinal() {
    var pb = <PlayBox>[];
    List<Goal?> goals = <Goal>[];
    pb.addAll(playBoxes!);
    goals.addAll(board!.whereType<Goal>());
    for (var p in playBoxes!) {
      for (var g in board!.whereType<Goal>()) {
        if (p.row == g.row && p.column == g.column && p.num == g.num) {
          pb.remove(p);
          goals.remove(g);
        }
      }
    }
    return pb.isEmpty && goals.isEmpty;
  }

  String printBoard() {
    board!.sort((a, b) => a.column!.compareTo(b.column!));
    board!.sort((a, b) => a.row!.compareTo(b.row!));
    playBoxes!.sort((a, b) => a.column!.compareTo(b.column!));
    playBoxes!.sort((a, b) => a.row!.compareTo(b.row!));

    var b = <Box>[];
    for (var x in board!) {
      b.add(x.copy());
    }
    var p = <PlayBox>[];
    for (var x in playBoxes!) {
      p.add(x.copy());
    }

    String s = '\n';

    for (int i = 0; i < height!; i++) {
      for (int j = 0; j < width!; j++) {
        if (p.isNotEmpty &&
            p.first.row == b.first.row &&
            p.first.column == b.first.column) {
          s += 'P${p.first.num}      ';
          p.remove(p.first);
          b.remove(b.first);
        } else {
          if (b.first is Block) {
            s += 'B      ';
          } else if (b.first is Empty) {
            s += 'E      ';
          } else if (b.first is Goal) {
            var temp = b.first as Goal;
            s += 'G${temp.num}      ';
          } else {
            s += 'ERROR';
          }
          b.remove(b.first);
        }
      }
      s += '\n';
    }
    return s;
  }

  void printB() {
    board!.sort((a, b) => a.column!.compareTo(b.column!));
    board!.sort((a, b) => a.row!.compareTo(b.row!));
    playBoxes!.sort((a, b) => a.column!.compareTo(b.column!));
    playBoxes!.sort((a, b) => a.row!.compareTo(b.row!));

    var b = <Box>[];
    for (var x in board!) {
      b.add(x.copy());
    }
    var p = <PlayBox>[];
    for (var x in playBoxes!) {
      p.add(x.copy());
    }

    String s = '\n';

    for (int i = 0; i < height!; i++) {
      for (int j = 0; j < width!; j++) {
        if (p.isNotEmpty &&
            p.first.row == b.first.row &&
            p.first.column == b.first.column) {
          s += 'P${p.first.num}      ';
          p.remove(p.first);
          b.remove(b.first);
        } else {
          if (b.first is Block) {
            s += 'B      ';
          } else if (b.first is Empty) {
            s += 'E      ';
          } else if (b.first is Goal) {
            var temp = b.first as Goal;
            s += 'G${temp.num}      ';
          } else {
            s += 'ERROR';
          }
          b.remove(b.first);
        }
      }
      s += '\n';
    }
    print(s);
  }

  //HELPERS
  bool listsEquality(List<Box> s1, List<Box> s2) {
    var list1 = [];
    var list2 = [];
    list1.addAll(s1);
    list2.addAll(s2);

    for (Box b1 in s1) {
      for (Box b2 in s2) {
        var type = checkType(b1, b2);
        switch (type) {
          case 'PlayBox':
            {
              if (b1.row == b2.row && b1.column == b2.column) {
                var p1 = b1 as PlayBox;
                var p2 = b2 as PlayBox;
                if (p1.num == p2.num) {
                  list1.remove(b1);
                  list2.remove(b2);
                }
              }
              break;
            }
          case 'Goal':
            {
              if (b1.row == b2.row &&
                  b1.column == b2.column &&
                  b1.isEmpty == b2.isEmpty) {
                var g1 = b1 as Goal;
                var g2 = b2 as Goal;
                if (g1.num == g2.num) {
                  list1.remove(b1);
                  list2.remove(b2);
                }
              }
              break;
            }
          case 'Empty':
            {
              if (b1.row == b2.row &&
                  b1.column == b2.column &&
                  b1.isEmpty == b2.isEmpty) {
                list1.remove(b1);
                list2.remove(b2);
              }
              break;
            }
          case 'Block':
            {
              if (b1.row == b2.row && b1.column == b2.column) {
                list1.remove(b1);
                list2.remove(b2);
              }
              break;
            }
          default:
            break;
        }
      }
    }
    return list1.isEmpty && list2.isEmpty;
  }

  String checkType(Box b1, Box b2) {
    if (b1 is PlayBox && b2 is PlayBox) {
      return 'PlayBox';
    } else if (b1 is Goal && b2 is Goal) {
      return 'Goal';
    } else if (b1 is Empty && b2 is Empty) {
      return 'Empty';
    } else if (b1 is Block && b2 is Block) {
      return 'Block';
    } else {
      return 'No Match';
    }
  }

  List<Box> deepCopy(List list) {
    List<Box> c = [];
    for (var element in list) {
      c.add(element.copy());
    }
    return c;
  }

// void move(Positions p) {
//   for (var element in playBoxes!) {
//     List<Positions> moves = checkMoves(element);
//
//     if (moves.contains(p)) {
//       switch (p) {
//         case Positions.right:
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = true;
//           element.column = element.column! + 1;
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = false;
//           break;
//         case Positions.left:
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = true;
//           element.column = element.column! - 1;
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = false;
//           break;
//         case Positions.up:
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = true;
//           element.row = element.row! - 1;
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = false;
//           break;
//         case Positions.down:
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = true;
//           element.row = element.row! + 1;
//           board!
//               .singleWhere(
//                   (x) => x.row == element.row && x.column == element.column)
//               .isEmpty = false;
//           break;
//         default:
//           break;
//       }
//     }
//   }
// }

// void printBoard() {
//   board!.sort((a, b) => a.column!.compareTo(b.column!));
//   board!.sort((a, b) => a.row!.compareTo(b.row!));
//
//   var b = board!;
//   var p = playBoxes!;
//
//   String s = '\n';
//
//   for (int i = 0; i < height!; i++) {
//     for (int j = 0; j < width!; j++) {
//       if (p.first.row == b.first.row && p.first.column == b.first.column) {
//         s += 'P${p.first.num}      ';
//         p.remove(p.first);
//         b.remove(b.first);
//       } else {
//         if (b.first is Block) {
//           s += 'B      ';
//         } else if (b.first is Empty) {
//           s += 'E      ';
//         } else if (b.first is Goal) {
//           var temp = b.first as Goal;
//           s += 'G${temp.num}      ';
//         }
//         b.remove(b.first);
//       }
//     }
//     s += '\n';
//   }
//
//   // for (int i = 1; i <= height!; i++) {
//   //   for (int j = 1; j <= width!; j++) {
//   //     for (var x in playBoxes!) {
//   //       for (var y in board!) {
//   //         if (x.row == bo.row && x.column == y.column) {
//   //           s += 'P${x.num}   ';
//   //           j++;
//   //           continue;
//   //         }
//   //         else {
//   //           if (y is Block) {
//   //             s += 'B   ';
//   //           } else if (y is Empty && s.isEmpty) {
//   //             s += 'E   ';
//   //           } else if (y is Goal) {
//   //             s += 'G${y.num}   ';
//   //           } else {
//   //             s += 'ERROR   ';
//   //           }
//   //           j++;
//   //         }
//   //       }
//   //       s += '\n';
//   //     }
//   //   }
//   //   i++;
//   // }
//
//   print(s);
// }

}
