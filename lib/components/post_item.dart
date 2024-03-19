import 'package:flutter/material.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/user.png", width: 40, height: 40,),
              SizedBox(width: 10,),
              Text(user, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.white),)
            ], 
          ),
          Image.asset("/Users/Armando09/DART/flutter_application_5/assets/components/postImage.png", ),
          Text("Hola, esto es una foto de muchos postes en el desierto pero esta nevado", style: AppText.subtitle2,)
        ],
      ),
    );
  }
}