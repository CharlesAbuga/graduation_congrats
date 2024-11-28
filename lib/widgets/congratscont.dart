import 'package:flutter/material.dart';

class ContainerCongrats extends StatelessWidget {
  const ContainerCongrats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.flip(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Column(
              children: [
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.black12,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.black26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.black38,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
