import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pur_in.dart';

double toD(dynamic v) =>
    (v == null) ? 0 : double.tryParse(v.toString().replaceAll(',', '')) ?? 0;

Future<List<PurIn>> fetchPurIn({
  required String host,
  required int port,
  required String s,
  required String e,
}) async {
  final uri = Uri.parse('http://$host:$port/?S=$s&E=$e');
  final res = await http.get(uri);
  if (res.statusCode != 200) throw Exception('HTTP ${res.statusCode}: ${res.body}');

  final decoded = jsonDecode(utf8.decode(res.bodyBytes));
  final list = (decoded is List)
      ? decoded
      : (decoded is Map && decoded['data'] is List)
          ? decoded['data'] as List
          : null;
  if (list == null) throw Exception('Unexpected JSON shape');

  return list.map((e) => PurIn.fromJson(e as Map<String, dynamic>, toD)).toList();
}
