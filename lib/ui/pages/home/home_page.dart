import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/auth_provider.dart';
import 'package:prueba/config/providers/bottom_nav_bar_provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/colors.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/pages/profile/profile_page.dart';
import 'package:prueba/ui/pages/users/users_page.dart';
import 'package:prueba/ui/widgets/app_bar/app_bar_custom.dart';

class HomePage extends StatelessWidget {
  final int? index;
  const HomePage({Key? key, this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final bnbProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xfffafafe),
        appBar: bnbProvider.index == 0 
              ? null
              : const AppBarCustom(actions: true,),
        body: bnbProvider.index == 0 
              ? const ProfilePage()
              : const UsersPage(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 20, bottom: 10),
              child: GNav(
                backgroundColor: Colors.white,
                hoverColor: Colors.white,
                rippleColor: Colors.white,
                gap: 8,
                activeColor: Colors.white,
                tabBorderRadius: 15,
                tabMargin: const EdgeInsets.all(1),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: BukDoubleColors.brandPrimaryColor,
                color: Colors.black,
                tabs: [
                  GButton(
                    onPressed: () => userProvider.selectUser = userProvider.userProfile!,
                    iconColor: BukDoubleColors.brandPrimaryColor,
                    icon: Icons.person,
                    text: 'Perfil',
                  ),
                  const GButton(
                    iconColor: BukDoubleColors.brandPrimaryColor,
                    icon: Icons.group_sharp,
                    text: 'Usuarios',
                  ),
                  GButton(
                    onPressed: () async{
                      await auth.signOut();
                      if(context.mounted){
                        Navigator.pushReplacementNamed(context, Routes.authState);
                      }
                    },
                    iconColor: BukDoubleColors.brandPrimaryColor,
                    icon: Icons.arrow_forward_ios,
                    text: 'Salir',
                  ),
                ],
                selectedIndex: bnbProvider.index,
                onTabChange: (index) => bnbProvider.index = index
              ),
            ),
          ),
        ),
      );
      }
}

