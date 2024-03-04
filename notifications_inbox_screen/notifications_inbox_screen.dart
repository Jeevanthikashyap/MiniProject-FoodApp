import 'package:jyothika_s_application8/presentation/profile_container_screen/profile_container_screen.dart';

import 'bloc/notifications_inbox_bloc.dart';
import 'models/notifications_inbox_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';
import 'package:jyothika_s_application8/presentation/categories_screen/categories_screen.dart';
import 'package:jyothika_s_application8/presentation/received_requests_two_screen/received_requests_two_screen.dart';
import 'package:jyothika_s_application8/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationsInboxScreen extends StatelessWidget {
  NotificationsInboxScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsInboxBloc>(
        create: (context) => NotificationsInboxBloc(NotificationsInboxState(
            notificationsInboxModelObj: NotificationsInboxModel()))
          ..add(NotificationsInboxInitialEvent()),
        child: NotificationsInboxScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsInboxBloc, NotificationsInboxState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.h, vertical: 40.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 2.h, right: 70.h),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgResqfoodHighR,
                                  height: 64.v,
                                  width: 57.h,
                                  onTap: () {
                                    onTapImgResqfoodHighR(context);
                                  }),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 12.h, top: 9.v, bottom: 8.v),
                                  child: Text("lbl_notifications".tr,
                                      style: theme.textTheme.displaySmall))
                            ])),
                        SizedBox(height: 20.v),
                        Container(
                            margin: EdgeInsets.only(left: 7.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.h, vertical: 15.v),
                            decoration: AppDecoration.outlineBlack9001.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder15),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, right: 34.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.v),
                                                child: Text("lbl_inbox".tr,
                                                    style: CustomTextStyles
                                                        .headlineLargeGreen900_1)),
                                            GestureDetector(
                                                onTap: () {
                                                  onTapTxtOutbox(context);
                                                },
                                                child: Text("lbl_outbox".tr,
                                                    style: theme.textTheme
                                                        .headlineLarge))
                                          ])),
                                  SizedBox(height: 15.v),
                                  Divider(
                                      color: appTheme.orangeA700,
                                      endIndent: 6.h),
                                  SizedBox(height: 16.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 305.h,
                                          margin: EdgeInsets.only(
                                              left: 6.h, right: 24.h),
                                          child: Text(
                                              "msg_thank_you_we_have".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  theme.textTheme.titleLarge))),
                                  SizedBox(height: 38.v),
                                  Container(
                                      width: 316.h,
                                      margin: EdgeInsets.only(
                                          left: 7.h, right: 12.h),
                                      child: Text(
                                          "msg_received_the_donation".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.titleLarge)),
                                  SizedBox(height: 38.v)
                                ])),
                        SizedBox(height: 5.v)
                      ])),
              bottomNavigationBar: _buildBottomBar(context)));
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
        return AppRoutes.receivedRequestsTwoScreen;
      case BottomBarEnum.Notifications:
        return "/";
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
      case AppRoutes.receivedRequestsTwoScreen:
        return ReceivedRequestsTwoScreen();
      case AppRoutes.profileContainerScreen:
        return ProfileContainerScreen();
      case AppRoutes.categoriesScreen:
        return CategoriesScreen();
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

  /// Navigates to the notificationsOutboxScreen when the action is triggered.
  onTapTxtOutbox(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationsOutboxScreen,
    );
  }
}
