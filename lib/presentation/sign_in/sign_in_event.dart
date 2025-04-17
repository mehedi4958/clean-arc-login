abstract class SignInEvent {}

class InitEvent extends SignInEvent {}

class SignInTriggerEvent extends SignInEvent {
  SignInTriggerEvent(this.email);
  String? email;
}
