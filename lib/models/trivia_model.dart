class TriviaItem {
  String text;

  TriviaItem({
    this.text,
  });

  factory TriviaItem.fromJson(Map<String, dynamic> json) {
    return TriviaItem(
      text: json['text'],
    );
  }
}
