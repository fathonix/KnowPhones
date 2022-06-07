import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowphones/models/brands.dart';
import 'package:knowphones/screens/category.dart';
import 'package:knowphones/screens/search.dart';
import 'package:knowphones/services/device_data.dart';
import 'package:knowphones/widgets/brand_item.dart';
import 'package:knowphones/widgets/custom_page_route.dart';
import 'package:knowphones/widgets/reload_dialog.dart';

class AllDevicesScreen extends StatefulWidget {
  const AllDevicesScreen({Key? key}) : super(key: key);

  @override
  State<AllDevicesScreen> createState() => _AllDevicesScreenState();
}

class _AllDevicesScreenState extends State<AllDevicesScreen> {
  // late final List<Brands> data;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   data = [];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
            statusBarIconBrightness:
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? Brightness.dark
                    : Brightness.light),
        title: Row(
          children: const [
            Icon(Icons.phone_android_outlined),
            Text('KnowPhones'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRoute(context, const SearchScreen()));
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'All Devices',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () => Navigator.of(context)
                      .push(CustomPageRoute(context, const CategoryScreen())),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.5,
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DeviceData.getBrands(),
              builder: (context, snapshot) {
                if (!snapshot.hasError) {
                  if (snapshot.hasData) {
                    // data.addAll(snapshot.data as List<Brands>);
                    final data = snapshot.data as List<Brands>;
                    return ListView.builder(
                      itemBuilder: (context, index) => BrandItem(
                        brands: data[index]),
                      itemCount: data.length,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }
                return ReloadDialog(callback: () => setState(() {}));
              }
            ),
          ),
        ],
      ),
    );
  }
}
