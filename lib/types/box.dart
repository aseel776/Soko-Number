abstract class Box{

  int? row;
  int? column;
  bool? isEmpty;
  bool? isGoal;

  Box(this.row, this.column, {this.isEmpty = false, this.isGoal = false});

  Box copy();

}