import 'package:soko_number/types/box.dart';

class Goal extends Box{

  int? num;

  Goal({required this.num, required int r, required int c, bool empty = true}) : super(r, c, isEmpty: empty, isGoal: true);

  @override
  Goal copy() {
    return Goal(num: num, r: row!, c: column!, empty: isEmpty!);
  }

}