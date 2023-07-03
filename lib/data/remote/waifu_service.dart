import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../model/waifu.dart';

class WaifuService {
  //final String _baseUrl = 'https://api.waifu.pics/sfw/waifu';
  final String _baseUrl = 'https://api.waifu.im/search';

  Future<List?> getWaifu() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final maps = json['images'];
      return maps.map((map) => Waifu.fromJson(map)).toList();
    } else {
      throw Exception('Failed to load waifu');
    }
  }
}