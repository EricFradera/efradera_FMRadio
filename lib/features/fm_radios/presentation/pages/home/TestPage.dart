import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmBloc.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
        title: const Text(
      "This is an FM  radio",
    ));
  }

  _buildBody() {
    return Center(
      child: _buildCard(),
    );
  }

  _buildCard() {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          color: const Color.fromARGB(100, 232, 228, 217),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: const Color.fromARGB(255, 49, 47, 40), width: 2.0)),
      child: Container(
          margin: const EdgeInsets.all(10.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hyper Meteor",
                  style: TextStyle(fontFamily: 'Tapem', fontSize: 40)),
              Text("by Vertex  Pop",
                  style: TextStyle(fontFamily: 'Sani', fontSize: 20)),
              Spacer(),
              Text("Genre: POP",
                  style: TextStyle(fontFamily: 'Sani', fontSize: 20))
            ],
          )),
    );
  }
}
