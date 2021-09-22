import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  // Fade Animation and Controller
  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationController;

  // Slide Animation and Controller
  late Animation<Offset> slideAnimation;
  late AnimationController slideAnimationController;

  @override
  void initState() {
    super.initState();

    // Initializing Fade Animation and Controller
    fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(fadeAnimationController.view);


    // Initializing Slide Animation and Controller
    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slideAnimation = Tween(
      begin: const Offset(-2, 0),
      end: const Offset(0, 0),
    ).animate(slideAnimationController.view);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                position: slideAnimation,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  // Call both at the same time
                  fadeAnimationController.forward();
                  slideAnimationController.forward();
                },
                child: const Text("Show"),
              ),

              ElevatedButton(
                onPressed: () {
                  // Call both at the same time
                  fadeAnimationController.reverse();
                  slideAnimationController.reverse();
                },
                child: const Text("Hide"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}