import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knowphones/models/brand_devices.dart';
import 'package:knowphones/models/brands.dart';
import 'package:knowphones/models/details.dart';
import 'package:knowphones/models/device.dart';

class DeviceData {
  static const String baseUrl = 'https://phone-specs-api.azharimm.dev/v2';

  static Future<List<Device>?> getByCategory(String category) async {
    late String _endpoint;

    switch (category) {
      case 'Latest':
        _endpoint = 'latest';
        break;

      case 'By Interest':
        _endpoint = 'top-by-interest';
        break;

      case 'By Favorite':
        _endpoint = 'top-by-fans';
        break;
    }

    final _response = await http.get(Uri.parse('$baseUrl/$_endpoint'));

    if (_response.statusCode == 200) {
      var _data = jsonDecode(_response.body)['data']['phones'] as List;
      final List<Device>? _list =
          _data.map((json) => Device.fromJson(json)).toList();
      debugPrint(_response.body);
      return _list;
    } else {
      throw Exception('Unable to get data.');
    }
  }

  static Future<List<Brands>?> getBrands() async {
    final _response = await http.get(Uri.parse('$baseUrl/brands'));

    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body)['data'] as List;
      final List<Brands>? _list =
          _data.map((json) => Brands.fromJson(json)).toList();
      debugPrint(_response.body);
      return _list;
    } else {
      throw Exception('Unable to get data.');
    }
  }

  static Future<BrandDevices?> getBrandDevices(String slug, int page) async {
    final _response =
        await http.get(Uri.parse('$baseUrl/brands/$slug?page=$page'));

    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body)['data'];
      final BrandDevices? _list = BrandDevices.fromJson(_data);
      debugPrint(_response.body);
      return _list;
    } else {
      throw Exception('Unable to get data.');
    }
  }

  static Future<Details?> getDetails(String slug) async {
    final _response = await http.get(Uri.parse('$baseUrl/$slug'));

    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body)['data'];
      final Details? _list = Details.fromJson(_data);
      debugPrint(_response.body);
      return _list;
    } else {
      throw Exception('Unable to get data.');
    }
  }

  static Future<List<Device>?> searchDevice(String keyword) async {
    final _response =
        await http.get(Uri.parse('$baseUrl/search?query=$keyword'));

    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body)['data']['phones'] as List;
      final List<Device>? _list =
          _data.map((json) => Device.fromJson(json)).toList();
      debugPrint(_response.body);
      return _list;
    } else {
      throw Exception('Unable to get data.');
    }
  }
}
