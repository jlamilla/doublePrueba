import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/auth_provider.dart';
import 'package:prueba/design/colors.dart';

class TextFormFieldAuth extends StatelessWidget {
  
  const TextFormFieldAuth({
    Key? key,
    required this.label,
    required this.keyBoardType,
    required this.validator,
    this.formatter,
    required this.onChanged, 
    this.prefixIcon, 
    this.obscureText, 
  }
  ) : super(key: key);

  final String label;
  final TextInputType keyBoardType;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final Function(dynamic value) onChanged;
  final IconData? prefixIcon;
  final bool? obscureText;
  
  @override
  Widget build(BuildContext context) {
    final authForm = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20,),
      child: TextFormField(
        obscureText: obscureText==null ? false: authForm.obscureText,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: formatter,
        cursorColor:BukDoubleColors.brandPrimaryColor,
        autocorrect: false,
        keyboardType: keyBoardType,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: _inputDecoration(authForm),
      ),
    );
  }

  InputDecoration _inputDecoration(AuthProvider authForm) {
    return InputDecoration(
          contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.black87): null,
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54, fontSize: 20),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder( borderSide: const BorderSide( color: Colors.black12),borderRadius: BorderRadius.circular(6)),
          focusedBorder:  OutlineInputBorder(borderSide: const BorderSide( color: BukDoubleColors.brandSecondaryColor,width: 1),borderRadius: BorderRadius.circular(6)
          ),
          suffixIcon: obscureText == null ? null : authForm.obscureText == true ? 
              IconButton(onPressed: () {authForm.obscureText = false;} , icon: const Icon(Icons.remove_red_eye, color: Colors.black54,)): 
              IconButton(onPressed: () {authForm.obscureText = true;} , icon: const Icon(Icons.visibility_off,color: BukDoubleColors.brandPrimaryColor,)),);
  }
}