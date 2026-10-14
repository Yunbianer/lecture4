import 'dart:convert';
import 'dart:io';

import 'package:async_json/book.dart';

Future<void> main() async {
  List<Book> books;
  try {
    final text = await File('data/books.json').readAsString();
    final list = jsonDecode(text) as List<dynamic>;
    books =
        list.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();
  } on FileSystemException catch (e) {
    print('数据文件缺失，请检查data/books.json (${e.path})');
    return;
  } on FormatException catch (e) {
    print('JSON格式有误，请检查文件内容: ${e.message}');
    return;
  } on TypeError {
    print('字段类型不对，请检查id/title/category是否为文字、borrowCount是否为数字');
    return;
  } catch (e) {
    print('数据解析失败: $e');
    return;
  }

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
