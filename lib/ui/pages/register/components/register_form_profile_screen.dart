import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/copys.dart';
import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/domain/models/user/user_model.dart';
import 'package:prueba/ui/constants/fields.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/helpers/validations.dart';
import 'package:prueba/ui/widgets/button/button_normal_custom.dart';
import 'package:prueba/ui/widgets/inputs/calendar_custom.dart';
import 'package:prueba/ui/widgets/inputs/text_form_custom.dart';


class RegisterFormProfileScreen extends StatefulWidget {
  
  const RegisterFormProfileScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormProfileScreen> createState() => _RegisterFormProfileScreenState();
}

class _RegisterFormProfileScreenState extends State<RegisterFormProfileScreen> {
  
  late TextEditingController _nameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _birthdateController;
  late TextEditingController _addressController;
  late TextEditingController _departmentController;
  late TextEditingController _cityController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _lastnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthdateController = TextEditingController();
    _addressController = TextEditingController();
    _departmentController = TextEditingController();
    _cityController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthdateController.dispose();
    _addressController.dispose();
    _departmentController.dispose();
    _cityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final  registerForm = Provider.of<UserProvider>(context,);
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox( height: 20),
                  Text(BukDoubleCopys.bonding, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox( height: 30),
                  Text(BukDoubleCopys.bondingContext, textAlign: TextAlign.justify , style: Theme.of(context).textTheme.bodySmall ),
                  const SizedBox( height: 20),
                  TextFormFiledCustom(label: Fields.name, keyBoardType: TextInputType.text, controller: _nameController, validator: (value) =>  Validations.validateNoEmptyString(value) ),
                  TextFormFiledCustom(label: Fields.lastname, keyBoardType: TextInputType.text, controller: _lastnameController, validator: (value) =>  Validations.validateNoEmptyString(value)  ),
                  CalendarCustom(label: Fields.birthdate, controller: _birthdateController),
                  TextFormFiledCustom(label: Fields.department, keyBoardType: TextInputType.text, controller: _departmentController, validator: (value) =>  Validations.validateLocation(value)),
                  TextFormFiledCustom(label: Fields.city, keyBoardType: TextInputType.text, controller: _cityController, validator: (value) =>  Validations.validateLocation(value)),
                  TextFormFiledCustom(label: Fields.address, keyBoardType: TextInputType.text, controller: _addressController, validator: (value) =>  Validations.validateLocation(value)),
                  const SizedBox( height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ButtonNormalCustom(
                      title: BukDoubleCopys.bondingButton,
                      boxShadow: true,
                      onPressed: () async{
                        if(await registerForm.createUserWithEmailAndPassword()){
                          final validateCreateUser = await registerForm.createUserProfile(
                            User(
                              name: _nameController.text, 
                              lastname: _lastnameController.text, 
                              birthdate: _birthdateController.text, 
                              email: registerForm.email
                            ),
                            Location(
                              department: _departmentController.text, 
                              city: _cityController.text, 
                              address: _addressController.text
                            )
                          );
                          if(validateCreateUser && context.mounted){
                            Navigator.pushReplacementNamed(context, Routes.auth);
                          }else{
                            log('user not create');
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