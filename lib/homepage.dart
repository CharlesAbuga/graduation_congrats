import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_celebration/widgets/congratscont.dart';
import 'package:graduation_celebration/widgets/small_background.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  const MyHomePage({super.key, required this.name});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return LargeBackground(name: widget.name);
          } else {
            return SmallBackground(name: widget.name);
          }
        },
      ),
    );
  }
}

class LargeBackground extends StatelessWidget {
  final String name;
  const LargeBackground({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedMeshGradient(
            colors: [
              Color.fromRGBO(40, 49, 59, 1),
              Color.fromRGBO(72, 84, 97, 1),
              Color.fromRGBO(44, 62, 80, 1),
              Color.fromRGBO(41, 83, 155, 1),
            ],
            options: AnimatedMeshGradientOptions(),
          ),
        ),
        ContainerCongrats(),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.3,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.3),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return RadialGradient(
                                center: Alignment.topLeft,
                                radius: 1.0,
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.orange,
                                ],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: Text(
                              '''
                                               🎉 Congratulations, $name! 🎓
                                                  
                                                  You’ve done it! This milestone is a testament to your hard work, determination, 
                                                  and resilience. From late-night study sessions to tackling endless assignments, 
                                                  you’ve overcome every challenge and emerged victorious.
                                                  
                                                  Today, we celebrate your incredible achievement and the bright future ahead of you. 
                                                  May this success be the first of many as you continue to chase your
                                                   dreams and make a difference in the world.
                                                  
                                                  Cheers to your graduation and all the amazing adventures that await! 🚀✨
                                                  
                                                  ''',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.2,
          top: MediaQuery.of(context).size.height * 0.2,
          child: Image.asset(
              'assets/images/—Pngtree—graduation caps vector convocation students_5320293.png',
              width: 300,
              height: 300),
        ),
      ],
    );
  }
}
