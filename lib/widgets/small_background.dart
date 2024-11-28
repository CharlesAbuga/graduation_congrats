import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:graduation_celebration/widgets/congratscont.dart';
import 'package:graduation_celebration/widgets/congratscontsmall.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class SmallBackground extends StatefulWidget {
  final String name;
  const SmallBackground({
    required this.name,
    super.key,
  });

  @override
  State<SmallBackground> createState() => _SmallBackgroundState();
}

class _SmallBackgroundState extends State<SmallBackground> {
  final controller = ConfettiController();
  bool isPlaying = false;
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
        ContainerSmallCongrats(),
        Positioned(
            top: 10,
            child: ConfettiWidget(
              confettiController: controller,
              blastDirection: 0,
              numberOfParticles: 100,
            )),
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
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return RadialGradient(
                            center: Alignment.topLeft,
                            radius: 1.0,
                            colors: <Color>[
                              const Color.fromARGB(255, 82, 7, 95),
                              Colors.purple,
                              Colors.orange,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '''
    Congratulations, ${widget.name}! 🎓
    
    You’ve done it! This milestone is a 
    testament to your hard work, determination, 
    and resilience. From late-night study 
    sessions to tackling endless assignments, 
    you’ve overcome every challenge and emerged victorious.
    
    Today, we celebrate your incredible achievement and the bright future ahead of you. 
    May this success be the first of many as you continue to chase your
    dreams and make a difference in the world.
    
    Cheers to your graduation and all the amazing adventures that await! 🚀✨
    ''',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (!isPlaying) {
                                        controller.play();
                                        isPlaying = true;
                                      } else {
                                        controller.stop();
                                        isPlaying = false;
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star),
                                        Text('Click for Suprise'),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ).animate().fadeIn(duration: 1.seconds),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.2,
          top: MediaQuery.of(context).size.height * 0.2,
          child: Image.asset(
                  'assets/images/—Pngtree—graduation caps vector convocation students_5320293.png',
                  width: 100,
                  height: 100)
              .animate()
              .fadeIn(duration: 2.seconds)
              .scale(duration: 1.seconds),
        ),
      ],
    );
  }
}
