import 'bloc/signin_bloc.dart';
import 'models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';
import 'package:jyothika_s_application8/core/utils/validation_functions.dart';
import 'package:jyothika_s_application8/widgets/custom_elevated_button.dart';
import 'package:jyothika_s_application8/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SigninBloc>(
        create: (context) =>
            SigninBloc(SigninState(signinModelObj: SigninModel()))
              ..add(SigninInitialEvent()),
        child: SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.green50,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 36.h, top: 64.v, right: 36.h),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgResqfoodHighR,
                          height: 242.v,
                          width: 215.h),
                      SizedBox(height: 17.v),
                      Text("lbl_welcome_back".tr,
                          style: theme.textTheme.displayLarge),
                      SizedBox(height: 29.v),
                      BlocSelector<SigninBloc, SigninState,
                              TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailController) {
                            return CustomTextFormField(
                                controller: emailController,
                                hintText: "msg_enter_your_email".tr,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email"
                                        .tr;
                                  }
                                  return null;
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 15.v),
                                borderDecoration: TextFormFieldStyleHelper
                                    .outlineSecondaryContainer);
                          }),
                      SizedBox(height: 11.v),
                      Text("lbl_or".tr, style: theme.textTheme.titleLarge),
                      SizedBox(height: 14.v),
                      BlocSelector<SigninBloc, SigninState,
                              TextEditingController?>(
                          selector: (state) => state.mobileNumberController,
                          builder: (context, mobileNumberController) {
                            return CustomTextFormField(
                                controller: mobileNumberController,
                                hintText: "msg_enter_your_mobile".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.phone,
                                validator: (value) {
                                  if (!isValidPhone(value)) {
                                    return "err_msg_please_enter_valid_phone_number"
                                        .tr;
                                  }
                                  return null;
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.h, vertical: 19.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineBlack);
                          }),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                          width: 169.h,
                          text: "lbl_sign_in2".tr,
                          rightIcon: Container(
                              margin: EdgeInsets.only(left: 7.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgMakiarrow,
                                  height: 20.v,
                                  width: 32.h)),
                          buttonStyle: CustomButtonStyles.fillDeepOrange,
                          buttonTextStyle: CustomTextStyles
                              .headlineSmallOnSecondaryContainer,
                          onPressed: () {
                            onTapSignIn(context);
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
