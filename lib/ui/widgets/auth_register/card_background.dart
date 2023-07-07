import 'package:flutter/material.dart';
import 'package:prueba/design/colors.dart';
import 'package:prueba/ui/constants/images.dart';

class CardBackground extends StatelessWidget {
  final Widget child;
  const CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BackgroundBox(),
          Column(
            children: [
              _HeaderIcon(),
              Expanded(child: Container()),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50),
          child: Image.asset(Images.logo, height: 100,)),
    );
  }
}

class _BackgroundBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [BukDoubleColors.brandDarkColor, BukDoubleColors.brandPrimaryColor])),
    );
  }
}
