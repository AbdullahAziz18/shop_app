import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String content;
  final String path;
  final double width;
  const SettingButton(
      {super.key,
      required this.content,
      required this.path,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          path,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      child: Row(
        children: [
          Text(
            content,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.5,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * width,
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.black,
            size: 25,
          ),
        ],
      ),
    );
  }
}
