import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/bottom_nav_bar_provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/colors.dart';
import 'package:prueba/ui/constants/images.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/widgets/app_bar/app_bar_curve_custom.dart';
import 'package:prueba/ui/widgets/button/button_normal_custom.dart';
import 'package:prueba/ui/widgets/skeleton/locations_skeleton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnbProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const InfoUser(),
              AppBarCurveCustom( buttonBack: bnbProvider.index != 0,),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: UserDetailsLocation(),
            ),
          ),
          const SizedBox(height: 20),
          const CreateLocation(),
          const SizedBox(height: 20),
          ],
      )
      );
  }
}

class CreateLocation extends StatelessWidget {
  const CreateLocation({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40 ),
      child: SizedBox(
        height: 60,
        child: ButtonNormalCustom(
          boxShadow: true,
          title: 'Agregar dirección',
          onPressed: () => Navigator.pushNamed(context, Routes.createLocation)
        ),
      )
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({ Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SizedBox(
      height: 270,
      child: Stack(
        children: <Widget>[
          const CurveAppBarBackground(color: BukDoubleColors.brandSecondaryColor, height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff220032).withOpacity(0.6),
                        offset: const Offset(0, 6),
                        blurRadius: 10
                      )
                    ]
                  ),
                  child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: const FadeInImage(
                                  height: 99,
                                  width: 99,
                                  placeholder: AssetImage(Images.loading),
                                  image: AssetImage(Images.profile),
                                  fit: BoxFit.cover,
                                )
                        ),
                ),
                Text( '${userProvider.selectUser.name} ${userProvider.selectUser.lastname}', style: Theme.of(context).textTheme.bodyMedium),
                Text( userProvider.selectUser.email, style: Theme.of(context).textTheme.bodyMedium),
                Text( userProvider.selectUser.birthdate, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              ],
            ),
          )
        ]),
    );
  }
}

class UserDetailsLocation extends StatelessWidget {
  const UserDetailsLocation({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
            future: userProvider.getLocations(userProvider.selectUser.id!),
            builder: (_, locations) {
                if(locations.hasData && locations.data != null){
                  return ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount:  locations.data!.length, 
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 80,
                                margin:  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                      SizedBox(
                                        width:  100,
                                        height:  100,
                                        child: GestureDetector(
                                                onTap: () {
                                                  },
                                                child: Container(
                                                        height: 120, 
                                                        decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                          color: BukDoubleColors.brandLightColor,
                                                          boxShadow: [
                                                              BoxShadow( color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 10,)
                                                          ]
                                                        ),
                                                        child: const ClipRRect(
                                                          borderRadius:  BorderRadius.all(Radius.circular(10)),
                                                          child:  FadeInImage(
                                                                    height: 99,
                                                                    width: 99,
                                                                    placeholder: AssetImage(Images.loading),
                                                                    image: AssetImage(Images.map),
                                                                    fit: BoxFit.cover,
                                                                  )
                                                        )
                                                      ),
                                              ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20 ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                              Text("Departamento: ${locations.data![index].department}", style: Theme.of(context).textTheme.bodyMedium,),
                                              Text("Municipio: ${locations.data![index].city}", style: Theme.of(context).textTheme.bodyMedium),
                                              Text("Dirección: ${locations.data![index].address}", style: Theme.of(context).textTheme.bodyMedium),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        );
                }else{
                  return const LocationSkeltonLoading(itemCount: 3,);
                }  
                }
          );
  }
}
