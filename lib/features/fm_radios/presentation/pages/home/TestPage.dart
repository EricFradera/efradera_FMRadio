import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 197, 0),
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        bottomOpacity: 0.0,
        title: const Text(
          "Walkfar player",
          style: TextStyle(
              color: Color.fromARGB(255, 22, 110, 216),
              fontFamily: 'Tapem',
              fontSize: 30),
        ));
  }

  _buildBody() {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard(),
          _buildCard()
        ],
      ),
    );
  }

  _buildCard() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 228, 217),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: const Color.fromARGB(255, 49, 47, 40), width: 2.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.85),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      child: Container(
          margin: const EdgeInsets.all(6.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hyper Meteor",
                  style: TextStyle(fontFamily: 'Tapem', fontSize: 30)),
              Text("by Vertex  Pop",
                  style: TextStyle(fontFamily: 'Sani', fontSize: 15)),
              Spacer(),
              Text("Genre: POP",
                  style: TextStyle(fontFamily: 'Sani', fontSize: 15))
            ],
          )),
    );
  }
}
