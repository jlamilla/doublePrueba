import 'package:flutter/material.dart';
import 'package:prueba/design/copys.dart';
import 'package:prueba/ui/widgets/auth_register/card_background.dart';
import 'package:prueba/ui/widgets/auth_register/card_container.dart';
import 'components/auth_form_screen.dart';

class AuthPage extends StatelessWidget {
  
  const AuthPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox( height: 220 ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox( height: 20 ),
                    Text(BukDoubleCopys.authTitle, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox( height: 30 ),
                    const AuthFormScreen()
                  ],
                )
              ),
            ],
          ),
        )
      )
    );
  }
}