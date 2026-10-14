import 'package:async_json/tasks.dart';

/// 作业四任务1原版：嵌套回调（回调地狱）
void main() {
  print('开始');
  loadConfig().then((config) {
    print('配置: $config');
    downloadData(config).then((data) {
      print('数据: $data');
      saveResult(data).then((_) {
        print('完成');
      });
    });
  });
}
