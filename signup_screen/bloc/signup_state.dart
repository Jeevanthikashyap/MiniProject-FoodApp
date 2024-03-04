// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.emailController,
    this.mobileNumberController,
    this.termsAndConditionsCheckbox = false,
    this.signupModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? mobileNumberController;

  SignupModel? signupModelObj;

  bool termsAndConditionsCheckbox;

  @override
  List<Object?> get props => [
        emailController,
        mobileNumberController,
        termsAndConditionsCheckbox,
        signupModelObj,
      ];
  SignupState copyWith({
    TextEditingController? emailController,
    TextEditingController? mobileNumberController,
    bool? termsAndConditionsCheckbox,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      emailController: emailController ?? this.emailController,
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      termsAndConditionsCheckbox:
          termsAndConditionsCheckbox ?? this.termsAndConditionsCheckbox,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
