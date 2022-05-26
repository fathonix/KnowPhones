import 'package:knowphones/constants.dart';

class Details {
  Details({
    required this.brand,
    required this.phoneName,
    required this.phoneImages,
    required this.specs,
  });

  final String brand;
  final String phoneName;
  final List<String> phoneImages;
  List<Specs> specs;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        brand: json['brand'] ?? '',
        phoneName: json['phone_name'] ?? 'N/A',
        phoneImages: List<String>.from(json['phone_images'].map((x) => x)),
        specs: List<Specs>.from(
            json['specifications'].map((x) => Specs.fromJson(x))),
      );
}

class Specs {
  Specs({
    required this.title,
    required this.spec,
  });

  final String title;
  final List<Spec> spec;

  factory Specs.fromJson(Map<String, dynamic> json) => Specs(
        title: json['title'] ?? 'N/A',
        spec: List<Spec>.from(json['specs'].map((x) => Spec.fromJson(x))),
      );
}

class Spec {
  Spec({
    required this.key,
    required this.val,
  });

  final String key;
  final List<String> val;

  factory Spec.fromJson(Map<String, dynamic> json) => Spec(
        key: json['key'] ?? 'N/A',
        val: List<String>.from(json['val'].map((x) => x)),
      );
}
