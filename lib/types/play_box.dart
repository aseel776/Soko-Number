import 'package:soko_number/types/box.dart';

class PlayBox extends Box{

  int? num;

  PlayBox({required this.num, required int r, required int c}): super(r, c);

  @override
  PlayBox copy() {
    return PlayBox(num: num, r: row!, c: column!);
  }

}