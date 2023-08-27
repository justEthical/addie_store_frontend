class StoreModel {
  final String name;
  final String address;
  final String imageUrl;
  final List<String> tags;

  StoreModel({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.tags,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json['name'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      tags: json['tags']
    );
  }
}
