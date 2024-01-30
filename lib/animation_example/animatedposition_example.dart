import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: isExpanded ? 60 : 100,
              width: isExpanded ? size.width * 0.78 : size.width * 0.7,
              height: isExpanded ? size.height * 0.5 : size.height * 0.5,
              child: Container(
                color: Colors.white,
                child: const Stack(
                  children: [
                    Positioned(
                      left: 150,
                      bottom: 30,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: isExpanded ? 150 : 100,
              child: GestureDetector(
                onPanUpdate: onPanUpdate,
                onTap: () {},
                child: Center(
                  child: Container(
                    height: 400,
                    width: 280,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1682695794947-17061dc284dd?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
