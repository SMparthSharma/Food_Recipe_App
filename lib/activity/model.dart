class RecipeModel{
  late String foodLabel;
  late String image;
  late List<String> mealType;
  late double calories;
  late List<String> ingredientLines;
  RecipeModel(
      {this.image="pizza",
      this.foodLabel="pizza",
      this.calories=500.0,
      //this.ingredientLines="milk",
      //this.mealType=
      });
  factory RecipeModel.fromMap(Map recipe){
    return RecipeModel(
      foodLabel: recipe["label"],
      image: recipe["image"],
      // mealType: recipe["mealType"],
      // ingredientLines: recipe["ingredientLines"],
      calories: recipe["calories"]

    );
  }

}