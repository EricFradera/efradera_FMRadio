import 'package:efradera_fmradio/features/fm_radios/presentation/pages/home/RadioList.dart';
import 'package:efradera_fmradio/features/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadioList(),
      title: 'Flutter Demo',
    );
  }
}
