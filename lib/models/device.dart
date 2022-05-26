class Device {
  final String brand;
  final String phoneName;
  final String slug;
  final String imageUrl;
  final int favorites;
  final int hits;

  Device({
    required this.brand,
    required this.phoneName,
    required this.slug,
    required this.imageUrl,
    required this.favorites,
    required this.hits,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        brand: json['brand'] ?? '',
        phoneName: json['phone_name'] ?? 'N/A',
        slug: json['slug'] ?? 'notfound',
        imageUrl: json['image'] ?? '',
        favorites: json['favorites'] ?? 0,
        hits: json['hits'] ?? 0,
      );
}
