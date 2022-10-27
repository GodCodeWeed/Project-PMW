import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_swipper/Data/data_firebase_authentication_service.dart';
import 'package:meta/meta.dart';

class SignUpFirebaseBaseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUpFirebaseBaseState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SignUpFirebaseEvent extends SignUpFirebaseBaseEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpFirebaseEvent(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}

class SignUpFirebaseLoading extends SignUpFirebaseBaseState {}

class SignUpFirebaseInitiate extends SignUpFirebaseBaseState {}

class SignUpFirebaseError extends SignUpFirebaseBaseState {}

class SignUpFirebaseSuccess extends SignUpFirebaseBaseState {
  final User _user;

  SignUpFirebaseSuccess(this._user);
  User get user => _user;
  @override
  // TODO: implement props
  List<Object> get props => [_user];
}

class SignUpFirebaseLogic
    extends Bloc<SignUpFirebaseBaseEvent, SignUpFirebaseBaseState> {
  final FireBaseAuthentication _fireBaseAuthentication;
  SignUpFirebaseLogic(this._fireBaseAuthentication)
      : super(SignUpFirebaseInitiate()) {
    on<SignUpFirebaseBaseEvent>(eventMapper);
  }

  Future<void> eventMapper(
    SignUpFirebaseBaseEvent event,
    Emitter<SignUpFirebaseBaseState> emit,
  ) async {
    if (event is SignUpFirebaseEvent) {
      try {
        emit(SignUpFirebaseLoading());
        var response = await _fireBaseAuthentication.signUpAsync(
            event.email, event.password);

        if (response != null) {
          emit(SignUpFirebaseSuccess(response));
        }

        emit(SignUpFirebaseError());
      } catch (e) {
        emit(SignUpFirebaseError());
      }
    }
  }
}
