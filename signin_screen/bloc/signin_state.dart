// ignore_for_file: must_be_immutable

part of 'signin_bloc.dart';

/// Represents the state of Signin in the application.
class SigninState extends Equatable {
  SigninState({
    this.emailController,
    this.mobileNumberController,
    this.signinModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? mobileNumberController;

  SigninModel? signinModelObj;

  @override
  List<Object?> get props => [
        emailController,
        mobileNumberController,
        signinModelObj,
      ];
  SigninState copyWith({
    TextEditingController? emailController,
    TextEditingController? mobileNumberController,
    SigninModel? signinModelObj,
  }) {
    return SigninState(
      emailController: emailController ?? this.emailController,
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      signinModelObj: signinModelObj ?? this.signinModelObj,
    );
  }
}
