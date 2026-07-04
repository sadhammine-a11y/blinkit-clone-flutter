import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/category.dart';

/// Static mock categories, styled like Blinkit's home grid.
final categoriesProvider = Provider<List<ProductCategory>>((ref) {
  return const [
    ProductCategory(
      id: 'cat1',
      name: 'Vegetables\n& Fruits',
      imageUrl: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=200',
    ),
    ProductCategory(
      id: 'cat2',
      name: 'Dairy,\nBread & Eggs',
      imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=200',
    ),
    ProductCategory(
      id: 'cat3',
      name: 'Atta, Rice\n& Dal',
      imageUrl: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200',
    ),
    ProductCategory(
      id: 'cat4',
      name: 'Masala &\nDry Fruits',
      imageUrl: 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=200',
    ),
    ProductCategory(
      id: 'cat5',
      name: 'Cold Drinks\n& Juices',
      imageUrl: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=200',
    ),
    ProductCategory(
      id: 'cat6',
      name: 'Snacks &\nMunchies',
      imageUrl: 'https://images.unsplash.com/photo-1600952841320-db92ec4047ca?w=200',
    ),
    ProductCategory(
      id: 'cat7',
      name: 'Breakfast\n& Sauces',
      imageUrl: 'https://images.unsplash.com/photo-1613564834361-9436948817d1?w=200',
    ),
    ProductCategory(
      id: 'cat8',
      name: 'Sweet\nTooth',
      imageUrl: 'https://images.unsplash.com/photo-1548907040-4baa419551d6?w=200',
    ),
  ];
});

/// Returns only the products belonging to a given category id.
final productsByCategoryProvider =
    Provider.family<List<Product>, String>((ref, categoryId) {
  final allProducts = ref.watch(productsProvider);
  return allProducts.where((p) => p.categoryId == categoryId).toList();
});
final productsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(
      id: 'p1',
      name: 'Fresh Onion',
      imageUrl: 'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?w=300',
      quantityLabel: '1 kg',
      price: 38,
      mrp: 45,
      categoryId: 'cat1',
      deliveryTimeMins: 8,
    ),
    Product(
      id: 'p2',
      name: 'Amul Toned Milk',
      imageUrl: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300',
      quantityLabel: '500 ml',
      price: 27,
      categoryId: 'cat2',
      deliveryTimeMins: 10,
    ),
    Product(
      id: 'p3',
      name: 'Aashirvaad Atta',
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300',
      quantityLabel: '5 kg',
      price: 249,
      mrp: 279,
      categoryId: 'cat3',
      deliveryTimeMins: 12,
    ),
    Product(
      id: 'p4',
      name: 'Lays Classic Salted',
      imageUrl: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=300',
      quantityLabel: '52 g',
      price: 20,
      categoryId: 'cat6',
      deliveryTimeMins: 9,
    ),
    Product(
      id: 'p5',
      name: 'Coca-Cola Can',
      imageUrl: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=300',
      quantityLabel: '300 ml',
      price: 40,
      mrp: 45,
      categoryId: 'cat5',
      deliveryTimeMins: 11,
    ),
    Product(
      id: 'p6',
      name: 'Fresh Tomato',
      imageUrl: 'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=300',
      quantityLabel: '500 g',
      price: 22,
      mrp: 28,
      categoryId: 'cat1',
      deliveryTimeMins: 8,
    ),
    Product(
      id: 'p7',
      name: 'Brown Eggs',
      imageUrl: 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300',
      quantityLabel: '6 pcs',
      price: 54,
      categoryId: 'cat2',
      deliveryTimeMins: 10,
    ),
    Product(
      id: 'p8',
      name: 'Cadbury Dairy Milk',
      imageUrl: 'https://images.unsplash.com/photo-1549007994-cb92caebd54b?w=300',
      quantityLabel: '38 g',
      price: 45,
      categoryId: 'cat8',
      deliveryTimeMins: 9,
    ),
  ];
});
