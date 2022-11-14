import 'package:soko_number/types/box.dart';

class Empty extends Box{

  Empty({required int r, required int c, bool empty = true}) : super(r, c, isEmpty: empty);

  @override
  Empty copy() {
    return Empty(r: row!, c: column!, empty: isEmpty!);
  }

}