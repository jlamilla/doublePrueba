import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba/design/colors.dart';

class TextFormFiledCustom extends StatelessWidget {
  
  const TextFormFiledCustom({
    Key? key,
    required this.label,
    required this.keyBoardType,
    required this.controller,
    this.formatter,
    this.validator,
    this.buttonDelete = false,
    this.maxLength,
    this.inactivate = false
  }
  ) : super(key: key);

  final String label;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final bool? buttonDelete;
  final int? maxLength;
  final bool? inactivate;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextFormField(
        readOnly: inactivate!,
        maxLength: maxLength,
        validator: validator,
        inputFormatters: formatter,
        cursorColor:BukDoubleColors.brandPrimaryColor,
        autocorrect: false,
        keyboardType: keyBoardType,
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
        contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
        fillColor: inactivate! ? Colors.grey.shade100 : Colors.white,
        filled: true,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 19),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: BukDoubleColors.brandSecondaryColor),
          borderRadius: BorderRadius.circular(6)
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide( color: BukDoubleColors.brandSecondaryColor,width: 1),
          borderRadius: BorderRadius.circular(6)
        ),
        suffix: inactivate! 
                ? IconButton(
                      icon: const Icon(
                              Icons.copy, 
                              color: Color(0xFF6762be),
                            ), 
                      onPressed: () => Clipboard.setData(ClipboardData(text: controller.text)),
                  )
                : buttonDelete! 
                    ? GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () { controller.clear();},
                      ) 
                    : null
      );
  }
}