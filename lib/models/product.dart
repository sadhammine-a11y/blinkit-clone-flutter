class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String quantityLabel; // e.g. "500 g", "1 L"
  final double price;
  final double? mrp; // original price before discount
  final int deliveryTimeMins;
  final String categoryId;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.quantityLabel,
    required this.price,
    required this.categoryId,
    this.mrp,
    this.deliveryTimeMins = 8,
  });

  int? get discountPercent {
    if (mrp == null || mrp! <= price) return null;
    return (((mrp! - price) / mrp!) * 100).round();
  }
}
