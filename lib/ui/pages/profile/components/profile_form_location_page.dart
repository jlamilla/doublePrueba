import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/copys.dart';
import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/ui/constants/fields.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/helpers/validations.dart';
import 'package:prueba/ui/widgets/app_bar/app_bar_custom.dart';
import 'package:prueba/ui/widgets/button/button_normal_custom.dart';
import 'package:prueba/ui/widgets/inputs/text_form_custom.dart';


class ProfileFormLocationPage extends StatefulWidget {
  
  const ProfileFormLocationPage({Key? key}) : super(key: key);

  @override
  State<ProfileFormLocationPage> createState() => _ProfileFormLocationPage();
}

class _ProfileFormLocationPage extends State<ProfileFormLocationPage> {
  
  late TextEditingController _addressController;
  late TextEditingController _departmentController;
  late TextEditingController _cityController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _addressController = TextEditingController();
    _departmentController = TextEditingController();
    _cityController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _addressController.dispose();
    _departmentController.dispose();
    _cityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final  registerForm = Provider.of<UserProvider>(context,);
    return Scaffold(
      appBar: const AppBarCustom(backButton: true,),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox( height: 30),
                  Text(BukDoubleCopys.createLocationContext, textAlign: TextAlign.justify , style: Theme.of(context).textTheme.bodySmall ),
                  const SizedBox( height: 20),
                  TextFormFiledCustom(label: Fields.department, keyBoardType: TextInputType.text, controller: _departmentController, validator: (value) =>  Validations.validateLocation(value)),
                  TextFormFiledCustom(label: Fields.city, keyBoardType: TextInputType.text, controller: _cityController, validator: (value) =>  Validations.validateLocation(value)),
                  TextFormFiledCustom(label: Fields.address, keyBoardType: TextInputType.text, controller: _addressController, validator: (value) =>  Validations.validateLocation(value)),
                  const SizedBox( height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ButtonNormalCustom(
                      title: BukDoubleCopys.createLocationButton,
                      boxShadow: true,
                      onPressed: () async{
                        if(formKey.currentState!.validate()){
                          final validateCreateUser = await registerForm.updateUserLocation(
                            Location(
                              department: _departmentController.text, 
                              city: _cityController.text, 
                              address: _addressController.text
                            )
                          );
                          if(validateCreateUser && context.mounted){
                            Navigator.pushReplacementNamed(context, Routes.home);
                          }else{
                            log('location not create');
                          }
                        }
                    }, 
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),  
    );
  }
}