import 'package:async_json/tasks.dart';

/// 作业四任务1改写：顺序await，逻辑拉平
Future<void> main() async {
  print('开始');
  final config = await loadConfig();
  print('配置: $config');
  final data = await downloadData(config);
  print('数据: $data');
  await saveResult(data);
  print('完成');
}
