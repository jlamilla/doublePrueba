class Validations{
  Validations._();

  static String? validateEmail( value ) {
  
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = RegExp(pattern);
              
              return regExp.hasMatch(value ?? '')
                ? null
                : 'Ingrese un correo valido.';
  
  }

  static String? validatePassword( value ) {
  
              return ( value != null && value.length >= 6 ) 
                ? null
                : 'Mínimo 6 caracteres';                                    
              
  }

  static String? validateLocation( value ) {
  
              return ( value != null && value.length >= 4 ) 
                ? null
                : 'Mínimo 4 caracteres';                                    
              
  }

  static String? validateNoEmptyString( value ) {

              String pattern = r'^[a-zA-Z\u00C0-\u017F\s]+$';
              RegExp regExp  = RegExp(pattern);
              if(value != null){
                if(value.length < 3){
                  return 'Mínimo 3 caracteres';
                }else if (!regExp.hasMatch(value)){
                  return 'No luce como una letra';
                }
              }
              return null;
  }

  static String? validateNoEmpty( value ) {

              if(value != null){
                if(value.length < 2){
                  return 'Mínimo 2 caracteres';
                }
              }
              return null;
  }
}