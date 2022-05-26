import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowphones/models/details.dart';
import 'package:knowphones/models/device.dart';
import 'package:knowphones/services/device_data.dart';
import 'package:knowphones/widgets/carousel.dart';
import 'package:knowphones/widgets/detail_item.dart';

class DetailScreen extends StatelessWidget {
  final Device device;

  const DetailScreen({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceData.getDetails(device.slug),
      builder: (context, snapshot) => snapshot.data != null
          ? _showDetails(context, snapshot.data as Details)
          : Scaffold(
              appBar: AppBar(title: Text(device.phoneName)),
              body: const Center(child: CircularProgressIndicator()),
            ),
    );
  }

  Widget _showDetails(BuildContext context, Details details) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              snap: true,
              pinned: true,
              floating: true,
              expandedHeight: 350,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '${details.brand} ${details.phoneName}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                background: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(color: Colors.white),
                    CarouselWidget(images: details.phoneImages),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: details.specs.length,
          itemBuilder: (context, index) =>
              DetailItem(specs: details.specs[index]),
        ),
      ),
    );
  }
}
