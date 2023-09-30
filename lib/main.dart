import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmBloc.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmEvent.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/pages/home/RadioList.dart';
import 'package:efradera_fmradio/features/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteFMBloc>(
      create: (context) => sl()..add(const GetRadios()),
      child: const MaterialApp(
        home: RadioList(),
        title: 'Flutter Demo',
      ),
    );
  }
}
