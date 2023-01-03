import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/constants/strings.dart';
import 'package:flutter_background_service/screen/expenses.dart';
import 'package:flutter_background_service/screen/saving_intial.dart';
import 'package:flutter_background_service/services/storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(AppStrings.hiveBoxName);
  StorageService.init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await _initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Monieto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ValueNotifier<bool> notifier;

  @override
  void initState() {
    notifier = ValueNotifier(StorageService.savingState ?? false);
    StorageService.stream(AppStrings.saving).listen((event) {
      log('Key: ${event.key} Value: ${event.value}');
      if (event.value == null) return;
      notifier.value = event.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          if (value) return const ExpensesScreen();

          return const SavingIntial();
        },
      ),
    );
  }
}
