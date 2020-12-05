import 'dart:async';

class ValidatorMixin {

  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if (email.contains('@')){
        sink.add('');
      } else {
        sink.addError("Invalid email");
      }
    }
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length < 5){
        sink.add('');
      } else {
        sink.addError("Invalid password");
      }
    }
  );
}