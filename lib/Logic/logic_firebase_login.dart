import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_swipper/Data/data_firebase_authentication_service.dart';
import 'package:meta/meta.dart';

class LoginFirebaseBaseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginFirebaseBaseState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginFirebaseEvent extends LoginFirebaseBaseEvent {
  final String email;
  final String password;

  LoginFirebaseEvent(
      {required this.email,
      required this.password
     });
}

class LoginFirebaseLoading extends LoginFirebaseBaseState {}

class LoginFirebaseInitiate extends LoginFirebaseBaseState {}

class LoginFirebaseError extends LoginFirebaseBaseState {}

class LoginFirebaseSuccess extends LoginFirebaseBaseState {
  final User _user;

  LoginFirebaseSuccess(this._user);
  User get user => _user;
  @override
  // TODO: implement props
  List<Object> get props => [_user];
}

class LoginFirebaseLogic
    extends Bloc<LoginFirebaseBaseEvent, LoginFirebaseBaseState> {
  final FireBaseAuthentication _fireBaseAuthentication;
  LoginFirebaseLogic(this._fireBaseAuthentication)
      : super(LoginFirebaseInitiate()) {
    on<LoginFirebaseBaseEvent>(eventMapper);
  }

  Future<void> eventMapper(
    LoginFirebaseBaseEvent event,
    Emitter<LoginFirebaseBaseState> emit,
  ) async {
    if (event is LoginFirebaseEvent) {
      try {
        emit(LoginFirebaseLoading());
        var response = await _fireBaseAuthentication.loginAsync(
            event.email, event.password);

        if (response != null) {
          emit(LoginFirebaseSuccess(response));
        }

        emit(LoginFirebaseError());
      } catch (e) {
        emit(LoginFirebaseError());
      }
    }
  }
}
