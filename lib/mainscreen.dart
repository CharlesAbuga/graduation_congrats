import 'package:flutter/material.dart';
import 'package:graduation_celebration/homepage.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(name: nameController.text)));
                    },
                    child: const Text('Go'))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
