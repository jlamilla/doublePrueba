import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/design/copys.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/helpers/validations.dart';
import 'package:prueba/ui/widgets/button/button_normal_custom.dart';
import 'package:prueba/ui/widgets/inputs/text_form_auth_custom.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {

  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final registerForm = Provider.of<UserProvider>(context);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          TextFormFieldAuth(label: BukDoubleCopys.authUserEmail, 
            keyBoardType: TextInputType.emailAddress, 
            validator: (value) => Validations.validateEmail(value),
            onChanged: ( value ) => registerForm.email = value,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 14,),
          TextFormFieldAuth(label: BukDoubleCopys.authUserPassword, 
            keyBoardType: TextInputType.text, 
            validator: (value) => Validations.validatePassword(value),
            onChanged: ( value ) => registerForm.password = value,
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          const SizedBox( height: 30 ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonNormalCustom(
              title: BukDoubleCopys.next, 
              onPressed: () async{
                if(formKey.currentState!.validate()){
                  if(await registerForm.validateEmail()){
                    log('user exists');
                  } else if(context.mounted){
                    Navigator.pushNamed(context, Routes.registerForm);
                  }
                }
              }
            ),
          ),
          const SizedBox( height: 10, ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, Routes.auth), 
            child: Text(BukDoubleCopys.auth, style: Theme.of(context).textTheme.bodySmall)
          )
        ],
      ),
    );
  }
}