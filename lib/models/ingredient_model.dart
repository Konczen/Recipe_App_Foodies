class Ingredients {
  String originalString;

  Ingredients({
    this.originalString,
  });

  static Map<String, dynamic> toJson(Ingredients ingredient) {
    return {
      'originalString': ingredient.originalString,
    };
  }

  static Ingredients fromJson(Map<String, dynamic> json) {
    return Ingredients(
      originalString: json['originalString'],
    );
  }
}
