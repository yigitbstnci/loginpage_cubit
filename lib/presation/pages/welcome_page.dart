import 'package:flutter/material.dart';



class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key, required this.newUsername});

  final String newUsername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox.fromSize(size:const Size.fromHeight(200)),
            Card(child: Text('Welcome, $newUsername!')),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
                child: Text ('Logout')),
          ],
        ),
      ),
    );
  }
}
