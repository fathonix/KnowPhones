import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:knowphones/constants.dart';
import 'package:knowphones/models/device_category.dart';
import 'package:knowphones/models/device.dart';
import 'package:knowphones/services/device_data.dart';
import 'package:knowphones/widgets/device_item.dart';

class TabBarMenu extends StatefulWidget {
  const TabBarMenu({Key? key}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabs = [
    const Tab(text: 'Latest'),
    const Tab(text: 'By Interest'),
    const Tab(text: 'By Favorite'),
  ];

  @override
  void initState() {
    DeviceCategory.byFavorite;
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TabBar(
            tabs: tabs,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontFamily: Constants.fontFamily,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: Constants.fontFamily,
              fontWeight: FontWeight.w700,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            indicator: BubbleTabIndicator(
              indicatorHeight: 30.0,
              indicatorColor: Theme.of(context).primaryColor,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
                controller: _tabController,
                children: tabs.map((Tab tab) {
                  return FutureBuilder(
                    future: DeviceData.getByCategory(tab.text!),
                    builder: (context, snapshot) => snapshot.data != null
                        ? _deviceCategory(snapshot.data as List<Device>)
                        : const Center(child: CircularProgressIndicator()),
                  );
                }).toList())),
      ],
    );
  }

  Widget _deviceCategory(List<Device> device) {
    return ListView.builder(
      itemBuilder: (context, index) => DeviceItem(device: device[index]),
      itemCount: device.length,
    );
  }
}
