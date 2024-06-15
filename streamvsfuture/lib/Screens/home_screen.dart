import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //FUTURE RETURN ONE TIME
  Future futureCall() async {
    int counter = 4;
    await Future.delayed(const Duration(seconds: 3));
    return counter * counter;
  }

  //CONTINOUS DATA RETURN

  Stream streamCall() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: futureCall(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: streamCall(),
              builder: (context, AsyncSnapshot snapshot) {
                return Center(child: Text(snapshot.data.toString()));
              },
            )
          ],
        ),
      ),
    );
  }
}
