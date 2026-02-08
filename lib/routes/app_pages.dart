import 'package:get/get.dart';
import 'package:jewelry_ai/routes/app_routes.dart';
import 'package:jewelry_ai/views/splash/splash_view.dart';
import 'package:jewelry_ai/view_models/splash_view_model.dart';
import 'package:jewelry_ai/views/login/login_view.dart';
import 'package:jewelry_ai/view_models/login_view_model.dart';
import 'package:jewelry_ai/views/signup/signup_view.dart';
import 'package:jewelry_ai/view_models/signup_view_model.dart';
import 'package:jewelry_ai/views/forgot/forgot_view.dart';
import 'package:jewelry_ai/view_models/forgot_view_model.dart';
import 'package:jewelry_ai/views/client/home/home_view.dart';
import 'package:jewelry_ai/view_models/home_view_model.dart';
import 'package:jewelry_ai/views/client/collections/collections_view.dart';
import 'package:jewelry_ai/view_models/collections_view_model.dart';
import 'package:jewelry_ai/views/client/product_details/product_details_view.dart';
import 'package:jewelry_ai/view_models/product_details_view_model.dart';
import 'package:jewelry_ai/views/client/profile/profile_view.dart';
import 'package:jewelry_ai/view_models/profile_view_model.dart';
import 'package:jewelry_ai/views/client/ai_design_result/ai_design_result_view.dart';
import 'package:jewelry_ai/view_models/ai_design_result_view_model.dart';

import 'package:jewelry_ai/views/client/logout/logout_view.dart';
import 'package:jewelry_ai/view_models/logout_view_model.dart';
import 'package:jewelry_ai/views/client/order_history/order_history_view.dart';
import 'package:jewelry_ai/view_models/order_history_view_model.dart';
import 'package:jewelry_ai/views/vendor/send_quotation/send_quotation_view.dart';
import 'package:jewelry_ai/view_models/send_quotation_view_model.dart';
import 'package:jewelry_ai/views/client/request_quotation/request_quotation_view.dart';
import 'package:jewelry_ai/view_models/request_quotation_view_model.dart';
import 'package:jewelry_ai/views/client/my_quotations/my_quotations_view.dart';
import 'package:jewelry_ai/view_models/my_quotations_view_model.dart';
import 'package:jewelry_ai/views/client/saved_designs/saved_designs_view.dart';
import 'package:jewelry_ai/view_models/saved_designs_view_model.dart';
import 'package:jewelry_ai/views/vendor/admin_login/admin_login_view.dart';
import 'package:jewelry_ai/view_models/admin_login_view_model.dart';
import 'package:jewelry_ai/views/vendor/admin_dashboard/admin_dashboard_view.dart';
import 'package:jewelry_ai/view_models/admin_dashboard_view_model.dart';
import 'package:jewelry_ai/views/vendor/user_management/user_management_view.dart';
import 'package:jewelry_ai/view_models/user_management_view_model.dart';
import 'package:jewelry_ai/views/vendor/add_product/add_product_view.dart';
import 'package:jewelry_ai/view_models/add_product_view_model.dart';
import 'package:jewelry_ai/views/vendor/chat/chat_view.dart';
import 'package:jewelry_ai/view_models/chat_view_model.dart';
import 'package:jewelry_ai/views/vendor/chat/inbox_view.dart';
import 'package:jewelry_ai/view_models/inbox_view_model.dart';
import 'package:jewelry_ai/views/vendor/admin_product_list/admin_product_list_view.dart';
import 'package:jewelry_ai/view_models/admin_product_list_view_model.dart';
import 'package:jewelry_ai/views/vendor/admin_settings/admin_settings_view.dart';
import 'package:jewelry_ai/view_models/admin_settings_view_model.dart';
import 'package:jewelry_ai/views/client/create_design/create_design_view.dart';
import 'package:jewelry_ai/view_models/create_design_view_model.dart';
import 'package:jewelry_ai/views/client/support_chat/support_chat_view.dart';
import 'package:jewelry_ai/view_models/support_chat_view_model.dart';
import 'package:jewelry_ai/views/vendor/design_requests/design_requests_view.dart';
import 'package:jewelry_ai/view_models/design_requests_view_model.dart';
import 'package:jewelry_ai/views/client/notifications/notifications_view.dart';
import 'package:jewelry_ai/view_models/notifications_view_model.dart';
import 'package:jewelry_ai/views/client/personal_information/personal_information_view.dart';
import 'package:jewelry_ai/view_models/personal_information_view_model.dart';
import 'package:jewelry_ai/views/client/settings/app_settings_view.dart';
import 'package:jewelry_ai/view_models/app_settings_view_model.dart';
import 'package:jewelry_ai/views/client/settings/notifications_settings_view.dart';
import 'package:jewelry_ai/view_models/notifications_settings_view_model.dart';
import 'package:jewelry_ai/views/client/help_support/help_support_view.dart';
import 'package:jewelry_ai/view_models/help_support_view_model.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginViewModel>(() => LoginViewModel());
      }),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignupViewModel>(() => SignupViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotViewModel>(() => ForgotViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeViewModel>(() => HomeViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.collections,
      page: () => const CollectionsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CollectionsViewModel>(() => CollectionsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProductDetailsViewModel>(() => ProductDetailsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.aiDesignResult,
      page: () => const AIDesignResultView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AIDesignResultViewModel>(() => AIDesignResultViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.logout,
      page: () => const LogoutView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LogoutViewModel>(() => LogoutViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.orderHistory,
      page: () => const OrderHistoryView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OrderHistoryViewModel>(() => OrderHistoryViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.sendQuotation,
      page: () => const SendQuotationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SendQuotationViewModel>(() => SendQuotationViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.myQuotations,
      page: () => const MyQuotationsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MyQuotationsViewModel>(() => MyQuotationsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.requestQuotation,
      page: () => const RequestQuotationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RequestQuotationViewModel>(() => RequestQuotationViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.savedDesigns,
      page: () => const SavedDesignsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SavedDesignsViewModel>(() => SavedDesignsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.adminLogin,
      page: () => const AdminLoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdminLoginViewModel>(() => AdminLoginViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdminDashboardViewModel>(() => AdminDashboardViewModel());
        Get.lazyPut<AdminProductListViewModel>(() => AdminProductListViewModel());
        Get.lazyPut<DesignRequestsViewModel>(() => DesignRequestsViewModel());
        Get.lazyPut<InboxViewModel>(() => InboxViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.userManagement,
      page: () => const UserManagementView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<UserManagementViewModel>(() => UserManagementViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.addProduct,
      page: () => const AddProductView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const InboxView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<InboxViewModel>(() => InboxViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.chatDetail,
      page: () => const ChatView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatViewModel>(() => ChatViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.adminProductList,
      page: () => const AdminProductListView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdminProductListViewModel>(() => AdminProductListViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.adminSettings,
      page: () => const AdminSettingsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdminSettingsViewModel>(() => AdminSettingsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.createDesign,
      page: () => const CreateDesignView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CreateDesignViewModel>(() => CreateDesignViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.supportChat,
      page: () => const SupportChatView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SupportChatViewModel>(() => SupportChatViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.designRequests,
      page: () => const DesignRequestsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DesignRequestsViewModel>(() => DesignRequestsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationsViewModel>(() => NotificationsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.personalInformation,
      page: () => const PersonalInformationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PersonalInformationViewModel>(() => PersonalInformationViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.appSettings,
      page: () => const AppSettingsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AppSettingsViewModel>(() => AppSettingsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.notificationSettings,
      page: () => const NotificationSettingsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationSettingsViewModel>(() => NotificationSettingsViewModel());
      }),
    ),
    GetPage(
      name: AppRoutes.helpSupport,
      page: () => const HelpSupportView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HelpSupportViewModel>(() => HelpSupportViewModel());
      }),
    ),
  ];
}
