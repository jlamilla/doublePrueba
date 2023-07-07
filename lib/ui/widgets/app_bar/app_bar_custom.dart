
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/bottom_nav_bar_provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/ui/constants/images.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {


  const AppBarCustom({ 
    Key? key, 
    this.title, 
    this.backButton = false,
    this.actions = false,
    }) : super(key: key);

  final String? title;
  final bool backButton;
  final bool actions;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final bnbProvider = Provider.of<BottomNavBarProvider>(context);
    return AppBar(
      backgroundColor: const Color(0xfffafafe),
      elevation: 0,
      centerTitle: false,
      title: title != null ?
      Text(title! ,style: const TextStyle( color: Color(0xFF200e32), fontSize: 20 ))
      : SizedBox(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( userProvider.userProfile?.name ?? '', style: TextStyle( color: Colors.grey.shade800, fontSize: 20 )),
            Text( userProvider.userProfile?.email ?? '', style: const TextStyle( color: Color(0xFF200e32), fontSize: 12 )),
          ],
        ),
      ),
      leading: (backButton)
          ? InkWell(
              onTap:() => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF200e32),
                size: 20,
              )
          )
          : Container(),          
      actions: [
                Padding(
                    padding: const EdgeInsets.only(right:20),
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.white,width: 0.25)
                        ),  
                      child: GestureDetector(
                        onTap: () => bnbProvider.index = 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: const FadeInImage(
                                  height: 70,
                                  width: 70,
                                  placeholder: AssetImage(Images.loading),
                                  image: AssetImage(Images.profile),
                                  fit: BoxFit.cover,
                                )
                        ),
                      ),
                    ),
                )
              ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}