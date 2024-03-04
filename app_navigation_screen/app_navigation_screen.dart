import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "get started  One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.getStartedOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "get started ".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.getStartedScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "get started  Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.getStartedTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "signup".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signupScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "signin".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signinScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "home page".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.homePageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "categories".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.categoriesScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "needed in categories".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.neededInCategoriesScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "profile - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.profileContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "help center".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.helpCenterScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "about us".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.aboutUsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "received requests Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.receivedRequestsTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "received requests Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.receivedRequestsThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "received requests One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.receivedRequestsOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "received requests".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.receivedRequestsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "notifications-inbox".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationsInboxScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "notifications-outbox".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationsOutboxScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
