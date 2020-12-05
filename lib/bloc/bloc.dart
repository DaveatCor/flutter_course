import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:tutorial_flutter/bloc/bloc_validator.dart';

class Bloc extends Object with ValidatorMixin{

  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Stream<String> get getEmail => _email.stream.transform(emailValidator);
  Stream<String> get getPassword => _password.stream.transform(passwordValidator);
  Stream<bool> get submitValid => Rx.combineLatest2(getEmail, getPassword, (e, p) => true);

  // Getter is an shortcut to access property
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;

  void dispose(){
    _email.close();
    _password.close();
  }

}