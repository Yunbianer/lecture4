import 'package:async_json/book.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson/toJson roundtrip一致', () {
    final json = {
      'id': 'B001',
      'title': 'Dart编程实战',
      'category': '技术',
      'borrowCount': 92,
    };
    final book = Book.fromJson(json);
    expect(book.toJson(), json);
  });
}
