import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton(
      {super.key,
      required this.bcolor,
      required this.bwidth,
      required this.bheight,
      required this.bicon,
      required this.btext});

  final Color bcolor;
  final double bwidth;
  final double bheight;
  final IconData bicon;
  final String btext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Elevated Button Pressed');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: bheight,
          width: bwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bcolor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  bicon,
                  color: Colors.black87,
                  size: 45,
                ),
                Text(
                  btext,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
