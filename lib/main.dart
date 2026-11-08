import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khóa orientation portrait cho trải nghiệm ổn định
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Khởi tạo Hive + StorageService
  await Hive.initFlutter();
  await StorageService().init();

  runApp(
    const ProviderScope(
      child: ConChimNonApp(),
    ),
  );
}
