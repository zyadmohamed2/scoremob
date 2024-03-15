import 'goal.dart';

class Scorer {
  int id;
  String name;
  List<Goal> goals;

  Scorer(this.id, this.name, this.goals);

  String getFormattedText() {
    var res = '${name} ';
    goals.forEach((element) {
      res += '${element.time}\' ';
      res += element.isPenalty ? '(Pen) ' : '';
      res += element.isOwn ? '(Own) ' : '';
    });
    res += '\n';
    return res;
  }
}
