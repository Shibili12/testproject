import 'package:flutter/material.dart';

class Staggeredanimationexample extends StatefulWidget {
  @override
  _StaggeredanimationexampleState createState() =>
      _StaggeredanimationexampleState();
}

class _StaggeredanimationexampleState extends State<Staggeredanimationexample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          0.2,
          curve: Curves.easeIn,
        ),
      ),
    );

    _animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _animation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation1,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            ScaleTransition(
              scale: _animation2,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            ScaleTransition(
              scale: _animation3,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
