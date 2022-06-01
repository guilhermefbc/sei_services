class CustomFormBuilderValidators {

  static equalPasswords<T>(String? password1, String? password2, {String? errorText}) {
    return (val) {
      if(password1 == password2) {
        return null;
      }else{
        return errorText ?? 'Pass';
      }
    };
  }
}