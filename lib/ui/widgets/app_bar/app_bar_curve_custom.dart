
import 'package:flutter/material.dart';
import 'package:prueba/design/colors.dart';

class AppBarCurveCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCurveCustom({Key? key,required this.buttonBack, this.loader = false,}) : super(key: key);
  final bool buttonBack;
  final bool? loader;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      leading: buttonBack 
        ? Container(
          margin: const EdgeInsets.only(left: 30, bottom: 6, top: 6),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      width: 0.4
                  ),
                  color: Colors.white
                ),
                child: IconButton(
                    icon:  const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF200e32), size: 20,),
                    onPressed: () => Navigator.pop(context)
                  ),
              )
            : Container(),
      backgroundColor: BukDoubleColors.brandSecondaryColor,
      elevation: 0,
      centerTitle: false,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(200);
}

class CurveAppBarBackground extends StatelessWidget {
  const CurveAppBarBackground({ super.key, required this.color, required this.height,});
  final Color? color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        height: height,
        color: color
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width/2, height, width, height -100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }

}