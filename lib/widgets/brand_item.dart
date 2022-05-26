import 'package:flutter/material.dart';
import 'package:knowphones/models/brands.dart';
import 'package:knowphones/screens/brand_devices.dart';
import 'package:knowphones/widgets/custom_page_route.dart';

class BrandItem extends StatelessWidget {
  final Brands brands;

  const BrandItem({Key? key, required this.brands}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: () => Navigator.of(context).push(
              CustomPageRoute(context, BrandDevicesScreen(brands: brands))),
          title: Text(
            brands.brand,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text('${brands.deviceCount} devices'),
        ),
      ),
    );
  }
}
