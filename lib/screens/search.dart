import 'package:flutter/material.dart';
import 'package:knowphones/models/device.dart';
import 'package:knowphones/services/device_data.dart';
import 'package:knowphones/widgets/device_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String _keyword;

  @override
  void initState() {
    super.initState();
    _keyword = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              textAlignVertical: TextAlignVertical.bottom,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                hintText: 'Search devices...',
                hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).textTheme
                          .subtitle1?.color?.withOpacity(0.5),
                    ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                      width: 2.0, color: Theme.of(context).primaryColor),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _keyword = value;
                });
              }),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
        ],
      ),
      body: searchDevice(context, _keyword),
    );
  }

  Widget? searchDevice(BuildContext context, String keyword) {
    if (keyword.trim().isNotEmpty) {
      return FutureBuilder(
        future: DeviceData.searchDevice(keyword),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<Device> devices = snapshot.data as List<Device>;
            if (devices.isNotEmpty) {
              return ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) =>
                    DeviceItem(device: devices[index]),
              );
            }
            return Center(
                child: Text(
              'No matches found.',
              style: Theme.of(context).textTheme.subtitle1,
            ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
    return null;
  }
}
