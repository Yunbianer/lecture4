# async_json

第4课课堂案例与课堂作业四：异步读取本地 JSON 并汇总输出的命令行小工具。

## 功能

- `bin/async_json.dart`：异步读取 `data/books.json`，解析为 `List<Book>`，输出图书总数、各类目数量、借阅量 Top3
- `bin/callback_version.dart` / `bin/await_version.dart`：作业四任务1，嵌套回调版与顺序 await 改写版对照，输出一致

## 运行

```
dart run bin/async_json.dart
dart test
```

## 异常处理

- 文件缺失：提示"数据文件缺失，请检查data/books.json"，不崩溃
- 字段缺失：`borrowCount` 缺省时按 0 处理
- 类型错误：提示字段类型不对
- JSON 格式错误：提示检查文件内容

## AI 使用标注

本作业的 Book 模型、异常分支结构参考了课程指南示例代码；嵌套回调场景设计、示例数据编写、调试过程使用了 AI 助手（Trae）辅助，核心逻辑均由本人运行验证并理解。
