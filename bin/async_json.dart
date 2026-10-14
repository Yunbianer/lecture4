import 'dart:convert';
import 'dart:io';

import 'package:async_json/book.dart';

Future<void> main() async {
  final text = await File('data/books.json').readAsString();
  final list = jsonDecode(text) as List<dynamic>;
  final books =
      list.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();

  print('图书总数: ${books.length}');

  final counts = <String, int>{};
  for (final b in books) {
    counts[b.category] = (counts[b.category] ?? 0) + 1;
  }
  print('各类目数量:');
  counts.forEach((k, v) => print('  $k: $v本'));

  final sorted = [...books]
    ..sort((a, b) => b.borrowCount.compareTo(a.borrowCount));
  print('借阅量Top3:');
  for (final b in sorted.take(3)) {
    print('  ${b.title} - ${b.borrowCount}次');
  }
}
