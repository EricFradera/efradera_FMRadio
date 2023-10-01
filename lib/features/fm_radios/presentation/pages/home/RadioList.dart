import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmBloc.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(title: const Text("This is an FM  radio"));
  }

  _buildBody() {
    return BlocBuilder<RemoteFMBloc, RemoteFmState>(builder: (_, state) {
      if (state is RemoteFMLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteFMError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteFMLoaded) {
        return const Center(child: Text("Congrast!You got data!"));
      }
      return const SizedBox();
    });
  }
}
