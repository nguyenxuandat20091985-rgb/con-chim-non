import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khóa orientation portrait cho trải nghiệm ổn định
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Khởi tạo Hive
  await Hive.initFlutter();

  // Có thể mở các box cần thiết ở đây
  // await Hive.openBox('settings');
  // await Hive.openBox('emotions');
  // await Hive.openBox('schedule');

  runApp(
    const ProviderScope(
      child: ConChimNonApp(),
    ),
  );
}
