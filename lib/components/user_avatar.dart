import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double size;

  const UserAvatar({Key? key, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.asset(
          "assets/images/cheesy_vortex.jpg",
          width: size,
          height: size,
          fit: BoxFit.cover, // Esto ajusta la imagen para cubrir completamente el espacio
        ),
      ),
    );
  }
}
