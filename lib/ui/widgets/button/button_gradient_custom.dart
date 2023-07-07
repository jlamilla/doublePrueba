import 'package:flutter/material.dart';
import 'package:prueba/design/colors.dart';

class ButtonGradientCustom extends StatelessWidget {

  final Function()? onPressed;
  final String title;
  final IconData? icon;
  final bool? boxShadow;
  const ButtonGradientCustom({Key? key, required this.onPressed, required this.title, this.icon, this.boxShadow}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(colors: [BukDoubleColors.brandPrimaryColor, BukDoubleColors.brandSecondaryColor]),
                  boxShadow: [
                              boxShadow ?? false 
                              ? const BoxShadow( color: BukDoubleColors.brandSecondaryColor, blurRadius: 10, offset: Offset(0, 5) )
                              : BoxShadow( color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 10,)
                            ]
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      Text(title, style: const TextStyle(color: BukDoubleColors.brandLightColor)),
                      Visibility(
                        visible: icon != null,
                        child: Row(
                          children: [
                            const SizedBox(width: 30,),
                            Icon(icon)
                          ],
                        )
                        ),
                  ],
                ),
              ),
    );
  }
}