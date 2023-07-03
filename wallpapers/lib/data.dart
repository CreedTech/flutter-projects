import 'category_model.dart';

String apiKEY = "563492ad6f917000010000012c86b620b42240f8928c3f44f2447e54";

List<CategoriesModel> categories = [];
List<CategoriesModel> getCategories() {


  String imgUrl1 = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName1 = "Street Art";
  CategoriesModel categoriesModel = CategoriesModel(
    imgUrl: imgUrl1, categoryName: categoriesName1
  );
  categories.add(categoriesModel);

  String imgUrl2 = "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName2 = "Wild Life";
  CategoriesModel categoriesModel2 = CategoriesModel(
      imgUrl: imgUrl2, categoryName: categoriesName2
  );
  categories.add(categoriesModel2);

  String imgUrl3 = "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName3 = "Nature";
  CategoriesModel categoriesModel3 = CategoriesModel(
      imgUrl: imgUrl3, categoryName: categoriesName3
  );
  categories.add(categoriesModel3);

  String imgUrl4 = "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName4 = "City";
  CategoriesModel categoriesModel4 = CategoriesModel(
      imgUrl: imgUrl4, categoryName: categoriesName4
  );
  categories.add(categoriesModel4);

  String imgUrl5 = "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  String categoriesName5 = "Motivation";
  CategoriesModel categoriesModel5 = CategoriesModel(
      imgUrl: imgUrl5, categoryName: categoriesName5
  );
  categories.add(categoriesModel5);

  String imgUrl6 =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName6 = "Bikes";
  CategoriesModel categoriesModel6 = CategoriesModel(
      imgUrl: imgUrl6, categoryName: categoriesName6
  );
  categories.add(categoriesModel6);
  //
  String imgUrl7 =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  String categoriesName7 = "Cars";
  CategoriesModel categoriesModel7 = CategoriesModel(
      imgUrl: imgUrl7, categoryName: categoriesName7
  );
  categories.add(categoriesModel7);

  return categories;
}