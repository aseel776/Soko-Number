import 'package:soko_number/types/box.dart';

class Block extends Box{

  Block({required int r, required int c}): super(r, c);

  @override
  Block copy() {
    return Block(r: row!, c: column!);
  }

}