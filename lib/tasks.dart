import 'dart:async';

/// 三个模拟耗时操作，供回调版与await版共用
Future<String> loadConfig() =>
    Future.delayed(const Duration(milliseconds: 300), () => 'lib.school.cn');

Future<String> downloadData(String server) => Future.delayed(
    const Duration(milliseconds: 500), () => '来自$server的图书数据');

Future<void> saveResult(String data) => Future.delayed(
    const Duration(milliseconds: 200), () => print('已保存: $data'));
