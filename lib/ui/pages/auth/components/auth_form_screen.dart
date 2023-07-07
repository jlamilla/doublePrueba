import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/auth_provider.dart';
import 'package:prueba/design/copys.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/helpers/validations.dart';
import 'package:prueba/ui/widgets/button/button_normal_custom.dart';
import 'package:prueba/ui/widgets/inputs/text_form_auth_custom.dart';

class AuthFormScreen extends StatefulWidget {
  const AuthFormScreen({super.key});

  @override
  State<AuthFormScreen> createState() => _AuthFormScreenState();
}

class _AuthFormScreenState extends State<AuthFormScreen> {

  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authForm = Provider.of<AuthProvider>(context);
    
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          TextFormFieldAuth(label: BukDoubleCopys.authUserEmail, 
            keyBoardType: TextInputType.emailAddress, 
            validator: (value) => Validations.validateEmail(value),
            onChanged: ( value ) => authForm.email = value,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox( height: 14 ),
          TextFormFieldAuth(label: BukDoubleCopys.authUserPassword, 
            keyBoardType: TextInputType.text, 
            validator: (value) => Validations.validatePassword(value),
            onChanged: ( value ) => authForm.password = value,
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          const SizedBox( height: 30 ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonNormalCustom(
                      title: BukDoubleCopys.authButton, 
                      onPressed: () async{
                        if(formKey.currentState!.validate()){
                          final validate = await authForm.signInEmailAndPassword();
                          if(validate && context.mounted){
                            Navigator.pushReplacementNamed(context, Routes.authState);
                          }
                        }
                      } 
                    ),
          ),
          const SizedBox( height: 10 ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, Routes.register), 
            child: Text(BukDoubleCopys.register, style: Theme.of(context).textTheme.bodySmall)
          )
        ],
      ),
    );
  }
}