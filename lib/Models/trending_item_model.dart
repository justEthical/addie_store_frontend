class TrendingItemCardModel {
  final String title;
  final String imgUrl;
  final String price;

  TrendingItemCardModel(
      {required this.title, required this.imgUrl, required this.price});

  factory TrendingItemCardModel.fromJson(json) => TrendingItemCardModel(
      title: json["title"], imgUrl: json["imgUrl"], price: json["price"]);
}
