import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:knowphones/models/brands.dart';
import 'package:knowphones/models/device.dart';
import 'package:knowphones/screens/search.dart';
import 'package:knowphones/services/device_data.dart';
import 'package:knowphones/widgets/custom_page_route.dart';
import 'package:knowphones/widgets/device_item.dart';

import '../widgets/reload_dialog.dart';

class BrandDevicesScreen extends StatefulWidget {
  final Brands brands;

  const BrandDevicesScreen({Key? key, required this.brands}) : super(key: key);

  @override
  State<BrandDevicesScreen> createState() => _BrandDevicesScreenState();
}

class _BrandDevicesScreenState extends State<BrandDevicesScreen> {
  final _pagingController = PagingController<int, Device>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.brands.brand} Devices'),
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
      body: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Device>(
          itemBuilder: (context, device, index) => DeviceItem(device: device),
          noItemsFoundIndicatorBuilder: (context) =>
              const Center(child: Text('No item')),
          firstPageErrorIndicatorBuilder: (context) {
            debugPrint(_pagingController.error.toString());
            return ReloadDialog(callback: () => _pagingController.refresh());
          },
          newPageErrorIndicatorBuilder: (context) {
            debugPrint(_pagingController.error.toString());
            return ReloadDialog(callback: () => _pagingController.refresh());
          },
        ),
        separatorBuilder: (context, index) => const SizedBox.shrink(),
      ),
    );
  }

  Future<void> _fetchPage(int page) async {
    try {
      final newPage =
          await DeviceData.getBrandDevices(widget.brands.slug, page);
      final isLastPage = newPage?.currentPage == newPage?.lastPage;

      if (isLastPage) {
        _pagingController.appendLastPage(newPage!.devices);
      } else {
        _pagingController.appendPage(newPage!.devices, newPage.currentPage + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
