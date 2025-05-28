import 'package:flutter/material.dart';
import 'package:qr_forwarder/app/pages/mains/home_page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Controller',
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        // 데스크톱에 맞는 밀도 설정
        visualDensity: VisualDensity.compact,
      ),
      home: const HomePage(title: 'QR Controller'),
    );
  }
}
