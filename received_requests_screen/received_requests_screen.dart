import 'package:jyothika_s_application8/presentation/profile_container_screen/profile_container_screen.dart';

import 'bloc/received_requests_bloc.dart';
import 'models/received_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';
import 'package:jyothika_s_application8/widgets/custom_bottom_bar.dart';
import 'package:jyothika_s_application8/widgets/custom_elevated_button.dart';
import 'package:jyothika_s_application8/widgets/custom_text_form_field.dart';
import 'package:jyothika_s_application8/presentation/categories_screen/categories_screen.dart';
import 'package:jyothika_s_application8/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsScreen extends StatelessWidget {
  ReceivedRequestsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsBloc>(
        create: (context) => ReceivedRequestsBloc(ReceivedRequestsState(
            receivedRequestsModelObj: ReceivedRequestsModel()))
          ..add(ReceivedRequestsInitialEvent()),
        child: ReceivedRequestsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 34.v),
                child: Column(children: [
                  SizedBox(height: 6.v),
                  _buildResqfoodHighR(context),
                  SizedBox(height: 39.v),
                  _buildSelectCategory(context),
                  SizedBox(height: 56.v),
                  CustomElevatedButton(
                      width: 225.h,
                      text: "msg_complete_request".tr,
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                      onPressed: () {
                        onTapCompleteRequest(context);
                      }),
                  SizedBox(height: 31.v),
                  Text("msg_only_registered".tr,
                      style: CustomTextStyles.bodyMediumInterDeeporange600)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildResqfoodHighR(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h, right: 21.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    height: 64.v,
                    width: 57.h,
                    onTap: () {
                      onTapImgResqfoodHighR(context);
                    }),
                Padding(
                    padding:
                        EdgeInsets.only(left: 13.h, top: 12.v, bottom: 10.v),
                    child: Text("msg_place_your_request".tr,
                        style: theme.textTheme.headlineLarge))
              ])),
          SizedBox(height: 9.v),
          Divider(color: appTheme.gray600)
        ]));
  }

  /// Section Widget
  Widget _buildSelectCategory(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            margin: EdgeInsets.only(left: 20.h, right: 33.h),
            padding: EdgeInsets.symmetric(vertical: 25.v),
            decoration: AppDecoration.outlineBlack9001
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Text("lbl_select_category".tr,
                          style: theme.textTheme.titleLarge)),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.only(left: 22.h),
                      child: Text("lbl_fruits".tr,
                          style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 12.v),
                  Divider(indent: 4.h, endIndent: 4.h),
                  SizedBox(height: 7.v),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Text("lbl_select_item".tr,
                          style: theme.textTheme.titleLarge)),
                  SizedBox(height: 21.v),
                  Padding(
                      padding: EdgeInsets.only(left: 23.h),
                      child: Text("lbl_apples".tr,
                          style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 23.v),
                  Divider(indent: 8.h),
                  SizedBox(height: 34.v),
                  Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text("msg_item_description".tr,
                          style: theme.textTheme.titleLarge)),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: BlocSelector<ReceivedRequestsBloc,
                              ReceivedRequestsState, TextEditingController?>(
                          selector: (state) => state.nameController,
                          builder: (context, nameController) {
                            return CustomTextFormField(
                                width: 203.h,
                                controller: nameController,
                                hintText: "msg_enter_the_quantity".tr,
                                textInputAction: TextInputAction.done);
                          })),
                  SizedBox(height: 36.v)
                ])));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        print("Bottom bar tapped: $type");
        final currentRoute = getCurrentRoute(type);
        Navigator.of(context).pushNamed(currentRoute);
            },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Categories:
        return AppRoutes.categoriesScreen;
      case BottomBarEnum.Requests:
        return "/";
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsInboxScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileContainerScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
      BuildContext context,
      String currentRoute,
      ) {
    switch (currentRoute) {
      case AppRoutes.profileContainerScreen:
        return ProfileContainerScreen();
      case AppRoutes.categoriesScreen:
        return CategoriesScreen();
      case AppRoutes.notificationsInboxScreen:
        return NotificationsInboxScreen();
      default:
        return DefaultWidget();
    }
  }
  /// Navigates to the homePageScreen when the action is triggered.
  onTapImgResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapCompleteRequest(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
