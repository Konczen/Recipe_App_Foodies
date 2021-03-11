class Instructions {
  String step;
  int number;

  Instructions({this.step, this.number});

  static Map<String, dynamic> toJson(Instructions instruction) {
    return {'step': instruction.step, 'number': instruction.number};
  }

  static Instructions fromJson(Map<String, dynamic> json) {
    return Instructions(step: json['step'], number: json['number']);
  }
}
