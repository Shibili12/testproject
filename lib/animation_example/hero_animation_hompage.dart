import 'package:flutter/material.dart';

class Heroanimationexample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SecondScreen();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: const Row(
              children: [
                Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://b.fssta.com/uploads/application/soccer/headshots/713.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Neymar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: 'imageHero',
                child: Image.network(
                  'https://b.fssta.com/uploads/application/soccer/headshots/713.png',
                ),
              ),
              Text(
                "Neymar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
