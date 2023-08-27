import 'package:addie_store/Models/shop_search_model.dart';

class DummyData {
  static var nearbyStores = [
    StoreModel(
        name: 'Vaishno Amritsari Naan - Satish Dhaba',
        address: 'IP Extension, New Delhi',
        tags: northIndianFoodTags,
        imageUrl:
            'https://b.zmtcdn.com/data/pictures/0/303590/82385b359f08ad37159e3133aeaa7b5a.jpg?output-format=webp&fit=around|960:500&crop=960:500;*,*'),
    
    StoreModel(
        name: 'Parcham Bazaar - Grocery Store',
        address: 'Paschim vihar',
        tags: _shuffle(),
        imageUrl:
            'https://lh3.googleusercontent.com/p/AF1QipOFVLpz3Xwvp1uLp4xRBzUZPUq4EqcXy5iOGf3z=s1360-w1360-h1020'),
    
    StoreModel(
        name: 'Vishal Mega Mart - Shopping mall',
        address: 'Nangloi',
        tags: _shuffle(),
        imageUrl:
            'https://bloc-i.thgim.com/public/incoming/8d8rxd/article65805362.ece/alternates/FREE_660/Vishal%20Mega%20Mart%20Deoghar.jpg'),
  ];

  static List<String> _shuffle(){
    northIndianFoodTags.shuffle();
    return northIndianFoodTags;
  }

  static var northIndianFoodTags = [
  "Indian Cuisine",
  "North Indian Cuisine",
  "Punjabi Food",
  "Spicy Food",
  "Curry",
  "Tandoori Dishes",
  "Roti/Naan",
  "Paneer Dishes",
  "Chaat",
  "Dal Recipes",
  "Biryani",
  "Samosa",
  "Vegetarian Cuisine",
  "Ghee",
  "Masala",
  "Indian Sweets",
  "Mughlai Cuisine",
  "Dum Cooking",
  "Chutney",
  "Fusion Recipes"
];
}
