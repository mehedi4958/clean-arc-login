class SignInState {
  SignInState({this.isLoggedIn, this.email});
  bool? isLoggedIn = false;
  String? email = '';

  SignInState copyWith({bool? isLoggedIn, String? email}) {
    return SignInState(
      isLoggedIn: isLoggedIn ?? false,
      email: email ?? 'test@test.com',
    );
  }
}
