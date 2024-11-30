class Phone {
  final String brand;
  final String model;
  final double price;
  final String imageUrl;

  Phone({
    required this.brand,
    required this.model,
    required this.price,
  }) : imageUrl = _getDefaultImageForBrand(brand, model);

  // Method to create an invalid placeholder phone
  static Phone empty() => Phone(brand: '', model: '', price: 0.0);

  // Method to validate a phone
  bool isValid() => brand.isNotEmpty && model.isNotEmpty && price > 0;

  static String _getDefaultImageForBrand(String brand, String model) {
    final brandLower = brand.toLowerCase();
    final modelLower = model.toLowerCase();

    if (brandLower.contains('vivo')) {
      if (modelLower.contains('v21')) return 'assets/images/vivo_v21.jpg';
      if (modelLower.contains('v23')) return 'assets/images/vivo_v23.png';
      if (modelLower.contains('x60')) return 'assets/images/vivo_x60.jpg';
      if (modelLower.contains('x70')) return 'assets/images/vivo_x70.png';
    }

    if (brandLower.contains('iphone')) {
      if (modelLower.contains('11')) return 'assets/images/iphone_11.png';
      if (modelLower.contains('12')) return 'assets/images/iphone_12.jpg';
      if (modelLower.contains('13')) return 'assets/images/iphone_13.jpg';
      if (modelLower.contains('14')) return 'assets/images/iphone_14.png';
    }

    if (brandLower.contains('samsung')) {
      if (modelLower.contains('s21')) return 'assets/images/samsung_s21.jpg';
      if (modelLower.contains('s22')) return 'assets/images/samsung_s22.png';
      if (modelLower.contains('fold')) {
        return 'assets/images/samsung_fold_3.png';
      }
      if (modelLower.contains('note')) {
        return 'assets/images/samsung_note_20.png';
      }
    }

    if (brandLower.contains('huawei')) {
      if (modelLower.contains('mate 40')) {
        return 'assets/images/huawei_mate_40.jpg';
      }
      if (modelLower.contains('mate 50')) {
        return 'assets/images/huawei_mate_50.png';
      }
      if (modelLower.contains('p40')) return 'assets/images/huawei_p40.png';
      if (modelLower.contains('p50')) return 'assets/images/huawei_p50.png';
    }

    return 'assets/images/default_phone.png';
  }
}
