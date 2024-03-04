import 'package:jyothika_s_application8/presentation/profile_container_screen/profile_container_screen.dart';

import '../received_requests_two_screen/widgets/userrequest_item_widget.dart';
import 'bloc/received_requests_two_bloc.dart';
import 'models/received_requests_two_model.dart';
import 'models/userrequest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';
import 'package:jyothika_s_application8/widgets/app_bar/appbar_subtitle.dart';
import 'package:jyothika_s_application8/widgets/app_bar/appbar_title_image.dart';
import 'package:jyothika_s_application8/widgets/app_bar/custom_app_bar.dart';
import 'package:jyothika_s_application8/widgets/custom_bottom_bar.dart';
import 'package:jyothika_s_application8/widgets/custom_elevated_button.dart';
import 'package:jyothika_s_application8/presentation/categories_screen/categories_screen.dart';
import 'package:jyothika_s_application8/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsTwoScreen extends StatelessWidget {
  ReceivedRequestsTwoScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsTwoBloc>(
        create: (context) => ReceivedRequestsTwoBloc(ReceivedRequestsTwoState(
            receivedRequestsTwoModelObj: ReceivedRequestsTwoModel()))
          ..add(ReceivedRequestsTwoInitialEvent()),
        child: ReceivedRequestsTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
                child: Column(children: [
                  _buildUserRequest(context),
                  SizedBox(height: 45.v),
                  _buildPlaceARequest(context),
                  SizedBox(height: 75.v),
                  Text("msg_only_registered".tr,
                      style: CustomTextStyles.bodyMediumInterDeeporange600),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 116.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 13.h, right: 146.h),
              child: Row(children: [
                AppbarTitleImage(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    onTap: () {
                      onTapResqfoodHighR(context);
                    }),
                AppbarSubtitle(
                    text: "lbl_requests2".tr,
                    margin:
                        EdgeInsets.only(left: 25.h, top: 12.v, bottom: 10.v))
              ])),
          SizedBox(height: 9.v),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 378.h, child: Divider(color: appTheme.gray600)))
        ]),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildUserRequest(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: BlocSelector<ReceivedRequestsTwoBloc, ReceivedRequestsTwoState,
                ReceivedRequestsTwoModel?>(
            selector: (state) => state.receivedRequestsTwoModelObj,
            builder: (context, receivedRequestsTwoModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 1.v);
                  },
                  itemCount:
                      receivedRequestsTwoModelObj?.userrequestItemList.length ??
                          0,
                  itemBuilder: (context, index) {
                    UserrequestItemModel model = receivedRequestsTwoModelObj
                            ?.userrequestItemList[index] ??
                        UserrequestItemModel();
                    return UserrequestItemWidget(model, onTapPrimaryButton: () {
                      onTapPrimaryButton(context);
                    }, onTapTxtConfirmButtonText: () {
                      onTapTxtConfirmButtonText(context);
                    }, onTapPrimaryButton1: () {
                      onTapPrimaryButton1(context);
                    });
                  });
            }));
  }

  /// Section Widget
  Widget _buildPlaceARequest(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_place_a_request".tr,
        margin: EdgeInsets.only(left: 39.h, right: 47.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallInterOnPrimary,
        onPressed: () {
          onTapPlaceARequest(context);
        });
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

  /// Navigates to the neededInCategoriesScreen when the action is triggered.
  onTapPrimaryButton(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.neededInCategoriesScreen);
  }

  /// Navigates to the neededInCategoriesScreen when the action is triggered.
  onTapTxtConfirmButtonText(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.neededInCategoriesScreen);
  }

  /// Navigates to the receivedRequestsThreeScreen when the action is triggered.
  onTapPrimaryButton1(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.receivedRequestsThreeScreen);
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }

  /// Navigates to the receivedRequestsOneScreen when the action is triggered.
  onTapPlaceARequest(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.receivedRequestsOneScreen,
    );
  }
}
