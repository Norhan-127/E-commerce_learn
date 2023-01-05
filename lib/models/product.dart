import 'package:e_commerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final String imgUrl;
  final int price;
  final String? category;
  final int? descountValue;
  final double? rate;

  Product(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.price,
      this.rate,
      this.category = 'Other',
      this.descountValue});
}

List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 'Jacket',
      imgUrl: AppAssets.tempProductAsset1,
      price: 900,
      category: 'Clothes',
      descountValue: 20),
  Product(
      id: '1',
      title: 'Jacket',
      imgUrl: AppAssets.tempProductAsset1,
      price: 900,
      category: 'Clothes',
      descountValue: 20),
  Product(
      id: '1',
      title: 'Jacket',
      imgUrl: AppAssets.tempProductAsset1,
      price: 900,
      category: 'Clothes',
      descountValue: 20),
  Product(
      id: '1',
      title: 'Jacket',
      imgUrl: AppAssets.tempProductAsset1,
      price: 900,
      category: 'Clothes',
      descountValue: 20),
  Product(
      id: '1',
      title: 'Jacket',
      imgUrl: AppAssets.tempProductAsset1,
      price: 900,
      category: 'Clothes',
      descountValue: 20),
  Product(id:'1', title: 'Jacket', imgUrl: AppAssets.tempProductAsset1, price: 900,category: 'Clothes',descountValue: 20),

];
