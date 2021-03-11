class JokeItem {
  String text;

  JokeItem({
    this.text,
  });

  factory JokeItem.fromJson(Map<String, dynamic> json) {
    return JokeItem(
      text: json['text'],
    );
  }
}
