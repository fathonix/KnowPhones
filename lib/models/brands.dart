class Brands {
  final String brand;
  final String slug;
  final int deviceCount;

  Brands({
    required this.brand,
    required this.slug,
    required this.deviceCount,
  });

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        brand: json['brand_name'],
        slug: json['brand_slug'],
        deviceCount: json['device_count'],
      );
}
