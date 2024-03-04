import '../received_requests_three_screen/widgets/userprofile_item_widget.dart';
import 'bloc/received_requests_three_bloc.dart';
import 'models/received_requests_three_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jyothika_s_application8/core/app_export.dart';
import 'package:jyothika_s_application8/presentation/profile_page/profile_page.dart';
import 'package:jyothika_s_application8/widgets/app_bar/appbar_subtitle.dart';
import 'package:jyothika_s_application8/widgets/app_bar/appbar_title_image.dart';
import 'package:jyothika_s_application8/widgets/app_bar/custom_app_bar.dart';
import 'package:jyothika_s_application8/widgets/custom_bottom_bar.dart';
import 'package:jyothika_s_application8/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsThreeScreen extends StatelessWidget {
  ReceivedRequestsThreeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsThreeBloc>(
        create: (context) => ReceivedRequestsThreeBloc(
            ReceivedRequestsThreeState(
                receivedRequestsThreeModelObj: ReceivedRequestsThreeModel()))
          ..add(ReceivedRequestsThreeInitialEvent()),
        child: ReceivedRequestsThreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 12.v),
                child: Column(children: [
                  _buildUserProfile(context),
                  Spacer(),
                  _buildPlaceARequest(context),
                  SizedBox(height: 75.v),
                  Text("msg_only_registered".tr,
                      style: CustomTextStyles.bodyMediumInterDeeporange600),
                  SizedBox(height: 22.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 117.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h, right: 147.h),
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
          SizedBox(height: 10.v),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 378.h, child: Divider(color: appTheme.gray600)))
        ]),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: BlocSelector<ReceivedRequestsThreeBloc,
                ReceivedRequestsThreeState, ReceivedRequestsThreeModel?>(
            selector: (state) => state.receivedRequestsThreeModelObj,
            builder: (context, receivedRequestsThreeModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.v);
                  },
                  itemCount: receivedRequestsThreeModelObj
                          ?.userprofileItemList.length ??
                      0,
                  itemBuilder: (context, index) {
                    UserprofileItemModel model = receivedRequestsThreeModelObj
                            ?.userprofileItemList[index] ??
                        UserprofileItemModel();
                    return UserprofileItemWidget(model, onTapConfirmButton: () {
                      onTapConfirmButton(context);
                    });
                  });
            }));
  }

  /// Section Widget
  Widget _buildPlaceARequest(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_place_a_request".tr,
        margin: EdgeInsets.only(left: 36.h, right: 44.h),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallInterOnPrimary,
        onPressed: () {
          onTapPlaceARequest(context);
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Categories:
        return AppRoutes.profilePage;
      case BottomBarEnum.Requests:
        return "/";
      case BottomBarEnum.Notifications:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
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
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the neededInCategoriesScreen when the action is triggered.
  onTapConfirmButton(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.neededInCategoriesScreen);
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
