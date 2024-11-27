import 'package:flutter/material.dart';

class ContinuePage extends StatefulWidget {
  const ContinuePage({super.key});

  @override
  State<ContinuePage> createState() => _ContinuePageState();
}

class _ContinuePageState extends State<ContinuePage> {
  @override
  Widget build(BuildContext context) {
    const note = Text(
      '''We are sorry for this inconvenience but this service isn't available at the moment.

Try not to forget your password next time.

Thank you.''',
      style: TextStyle(fontSize: 20),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 100,
                top: 140,
              ),
              child: const Text(
                'UNAVAILABLE',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: 30,
                  right: 30,
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: note,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
