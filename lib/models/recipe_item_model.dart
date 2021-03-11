class RecipeItem {
  int id;
  String title;
  String image;
  int readyInMinutes;
  int servings;

  RecipeItem({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
    this.servings,
  });

  static Map<String, dynamic> toJson(RecipeItem item) {
    return {
      'id': item.id,
      'title': item.title,
      'image': item.image,
      'readyInMinutes': item.readyInMinutes,
      'servings': item.servings
    };
  }

  static RecipeItem fromJson(Map<String, dynamic> json) {
    return RecipeItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
    );
  }
}
