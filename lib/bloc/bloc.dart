import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:tutorial_flutter/bloc/bloc_validator.dart';

class Bloc extends Object with ValidatorMixin{

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get getEmail => _email.stream.transform(emailValidator);
  Stream<String> get getPassword => _password.stream.transform(passwordValidator);
  Stream<bool> get submitValid => Rx.combineLatest2(getEmail, getPassword, (e, p) => true);

  // Getter is an shortcut to access property
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;

  submit(){
    print(_email.value);
    print(_password.value);
  }

  void dispose(){
    _email.close();
    _password.close();
  }

}