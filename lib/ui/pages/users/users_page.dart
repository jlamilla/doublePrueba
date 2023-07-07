import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/colors.dart';
import 'package:prueba/domain/models/user/user_model.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/widgets/inputs/search_box.dart';
import 'package:prueba/ui/widgets/skeleton/users_skeleton.dart';

class UsersPage extends StatefulWidget {

  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {

    final user = Provider.of<UserProvider>(context, listen: false);
    user.searchUsersClear = '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      children: [
        SearchBox(onChanged: (value) => userProvider.searchUsers = value , hinText: 'Buscar usuario'),
        const SizedBox(height: 20),
        Expanded(
          child: FutureBuilder(
            future: userProvider.getUsers(),
            builder: (_, users) { 
              if(users.hasData && users.data != null){
              final usersFilter = userProvider.filter(users.data!);
                return ListView.builder(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount:  usersFilter.length,
                  itemBuilder: (_, int index) => CardUser(user: usersFilter[index],),
                );
              }else{
                return const UsersSkeltonLoading(itemCount: 2);
              }
            },
          )
        ),
    ],);
  }
}

class CardUser extends StatelessWidget {
  
  const CardUser({Key? key, required this.user}) : super(key: key);
  final  User user;
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 265,
      width: 300,
      child: Stack(
            children:[
              Positioned(
                top: 20,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 210,
                  width: 300,
                  decoration: BoxDecoration(
                    color: BukDoubleColors.brandLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                            BoxShadow(
                              color: BukDoubleColors.brandPrimaryColor.withOpacity(0.25),
                              offset: const Offset(0, 10),
                              blurRadius: 10
                            )
                          ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text( user.name, style: const TextStyle(color: BukDoubleColors.brandPrimaryColor , fontSize: 20, fontWeight: FontWeight.w600,)),
                      Text( user.lastname, style: const TextStyle(color: BukDoubleColors.brandPrimaryColor , fontSize: 20, fontWeight: FontWeight.w600,)),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( 'Fecha de nacimiento: ', style: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
                          Text( user.birthdate, style: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: BukDoubleColors.brandSecondaryColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                        ),
                        child: GestureDetector(
                          onTap: () {
                            userProvider.selectUser = user;
                            Navigator.pushNamed(context, Routes.profile);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text('Ver direcciones', style: TextStyle(color: BukDoubleColors.brandLightColor, fontSize: 16)),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 15,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  },
                child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: BukDoubleColors.brandPrimaryColor.withOpacity(0.4),
                              offset: const Offset(0, 6),
                              blurRadius: 10
                            )
                          ]
                        ),
                        height: 80, 
                        child: const Icon(Icons.person, color: BukDoubleColors.brandPrimaryColor, size: 30,),
                      ),
              ),
              
            ]
          ),
    );
  }
}
