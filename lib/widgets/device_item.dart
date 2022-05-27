import 'package:flutter/material.dart';
import 'package:knowphones/models/device.dart';
import 'package:knowphones/screens/detail.dart';
import 'package:knowphones/widgets/custom_page_route.dart';

class DeviceItem extends StatelessWidget {
  final Device device;

  const DeviceItem({Key? key, required this.device}) : super(key: key);

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
          onTap: () => Navigator.of(context)
              .push(CustomPageRoute(context, DetailScreen(device: device))),
          leading: device.imageUrl.isNotEmpty
              ? Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(device.imageUrl),
                    ),
                  ),
                )
              : null,
          title: Text(
            device.phoneName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: device.brand.isNotEmpty ? Text(device.brand) : null,
          trailing: _showIcon(context),
        ),
      ),
    );
  }

  Widget? _showIcon(BuildContext context) {
    if (device.favorites > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(device.favorites.toString()),
          const SizedBox(width: 5.0),
          Icon(
            Icons.favorite,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    } else if (device.hits > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(device.hits.toString()),
          const SizedBox(width: 8.0),
          Icon(
            Icons.show_chart,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    }
    return null;
  }
}
