import 'package:knowphones/models/device.dart';

class BrandDevices {
  final int currentPage;
  final int lastPage;
  final List<Device> devices;

  BrandDevices({
    required this.currentPage,
    required this.lastPage,
    required this.devices,
  });

  factory BrandDevices.fromJson(Map<String, dynamic> json) => BrandDevices(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        devices:
            List<Device>.from(json['phones'].map((x) => Device.fromJson(x))),
      );
}
