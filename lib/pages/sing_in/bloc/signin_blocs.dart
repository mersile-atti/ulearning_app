import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()){
    on<EmailEvent>(_emailEvent); // _emailEvent is a function
    on<PasswordEvent>(_passwordEvent); // _passwordEvent is a function
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}