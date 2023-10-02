import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key,required this.head,this.image,required this.text});

  final String head;
  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        image != null ?
        Image.asset(image!,height: 45,) : const Text(''),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(head,style: GoogleFonts.aBeeZee(
              fontSize: 18,
              color: const Color.fromARGB(149, 255, 255, 255) ,
            ),),
            Text(text,style: GoogleFonts.notoSansSamaritan(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),)
          ],
        )
      ],
    );
  }
}