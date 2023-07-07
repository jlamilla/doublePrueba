import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  
  final ValueChanged onChanged;
  final String hinText;
  final Color? color;
  final IconData? icon;
  const SearchBox({ Key? key, required this.onChanged, required this.hinText, this.color, this.icon, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20,),
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 5),
      decoration: BoxDecoration(color: color ?? const Color(0xFFf5f5f5),
      borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Color(0xFF200e32), fontSize: 20),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey.shade700,),
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey.shade500)),
      ),
    );
  }
}