import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ucrypted_app/models/login_response_model.dart';
import 'package:ucrypted_app/models/signup_response_model.dart';
import 'package:ucrypted_app/screens/app_imports.dart';
import 'package:ucrypted_app/screens/create_new_pass_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/otp_verifcation_screen.dart';
import 'package:ucrypted_app/screens/reset_pass_success_screen.dart';
import 'package:ucrypted_app/screens/reset_password_screen.dart';
import 'package:ucrypted_app/services/local/local_storage.dart';
import 'package:ucrypted_app/services/network/api_endpoints.dart';
import 'package:ucrypted_app/services/network/api_response.dart';
import 'package:ucrypted_app/services/network/api_service.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/snack_bar.dart';

class AuthController extends GetxController {
  RxBool loginLoader = false.obs; // Login Loader
  TextEditingController emailControllerLogin = TextEditingController(); // Login Controller
  TextEditingController passwordControllerLogin = TextEditingController(); // Login Controller

  LocalStorage localStorage = LocalStorage(); // Local Storage Class Initializes

  RxBool signUpLoader = false.obs; // Sign Up Loader
  TextEditingController emailControllerSignUp = TextEditingController(); // Sign Up Controller
  TextEditingController passwordControllerSignUp = TextEditingController(); // Sign Up Controller
  TextEditingController firstNameControllerSignUp = TextEditingController(); // Sign Up Controller
  TextEditingController lastNamControllerSignUp = TextEditingController(); // Sign Up Controller
  TextEditingController passControllerSignUp = TextEditingController(); // Sign Up Controller
  TextEditingController passConfirmControllerSignUp = TextEditingController(); // Sign Up Controller
  RxBool isTAndC = false.obs; // Sign Up Controller

  TextEditingController emailControllerVerify = TextEditingController(); // Verify Email Controller
  RxBool isVerifyEmailLoading = false.obs; // Verify Email Controller

  TextEditingController otpTextController = TextEditingController(); // validate OPT Controller
  RxString otpCode = "".obs; //validate OPT Controller
  RxBool isOtpVerifying = false.obs; //validate OPT Controller

  RxBool isNewPasswordLoading = false.obs; //Create new password loading
  TextEditingController newPasswordController = TextEditingController(); //Create new password loading
  TextEditingController cnfmNewPassController = TextEditingController(); //Create new password loading

  bool _validateLoginInputs() {
    final email = emailControllerLogin.text.trim();
    final password = passwordControllerLogin.text;

    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    if (!emailRegex.hasMatch(email)) {
      SnackBars().showSnackBar("Invalid Email", "Please enter a valid email address.", AppColors.errorSnackColor);
      return false;
    }

    if (password.length < 5) {
      SnackBars().showSnackBar("Weak Password", "Password must be at least 5 characters long.", AppColors.errorSnackColor);
      return false;
    }

    return true;
  }

  bool _validateCreateNewPassInputs() {
    final pass = newPasswordController.text.trim();
    final cnfmPass = cnfmNewPassController.text.trim();

    if (pass.isEmpty || cnfmPass.isEmpty) {
      SnackBars().showSnackBar(
        "Missing Input",
        "Please fill in all fields.",
        AppColors.errorSnackColor,
      );
      return false;
    }

    if (pass.length < 6) {
      SnackBars().showSnackBar(
        "Weak Password",
        "Password must be at least 6 characters long.",
        AppColors.errorSnackColor,
      );
      return false;
    }

    if (pass != cnfmPass) {
      SnackBars().showSnackBar(
        "Password Mismatch",
        "New password and confirm password do not match.",
        AppColors.errorSnackColor,
      );
      return false;
    }

    return true;
  }

  bool _validateSignUpInputs() {
    final email = emailControllerSignUp.text.trim();
    final password = passControllerSignUp.text;
    final confirmPassword = passConfirmControllerSignUp.text;
    final firstName = firstNameControllerSignUp.text.trim();
    final lastName = lastNamControllerSignUp.text.trim();
    final termsAccepted = isTAndC.value;

    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      SnackBars().showSnackBar("Error", "All fields are required.", AppColors.errorSnackColor);
      return false;
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      SnackBars().showSnackBar("Invalid Email", "Please enter a valid email address.", AppColors.errorSnackColor);
      return false;
    }

    if (password.length < 5) {
      SnackBars().showSnackBar("Weak Password", "Password must be at least 5 characters long.", AppColors.errorSnackColor);
      return false;
    }

    if (password != confirmPassword) {
      SnackBars().showSnackBar("Password Mismatch", "Passwords do not match.", AppColors.errorSnackColor);
      return false;
    }

    if (!termsAccepted) {
      SnackBars().showSnackBar("Error", "Please accept terms and conditions", AppColors.errorSnackColor);
      return false;
    }
    return true;
  }

  // Clear login controllers
  clearLoginControllers() {
    emailControllerLogin.clear();
    passwordControllerLogin.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // Clear Sign Up controllers
  clearSignUpControllers() {
    emailControllerSignUp.clear();
    passConfirmControllerSignUp.clear();
    passControllerSignUp.clear();
    firstNameControllerSignUp.clear();
    lastNamControllerSignUp.clear();
    isTAndC.value = false;
    FocusManager.instance.primaryFocus?.unfocus();
  }

  ///
  /// Login Api Call
  ///
  Future<void> onLogin() async {
    if (!_validateLoginInputs()) {
      return;
    }
    var body = {
      "username": emailControllerLogin.value.text,
      "password": passwordControllerLogin.value.text,
    };

    loginLoader.value = true;

    try {
      NetworkResponse? response = await Api().apiCall(
        ApiEndpoints.login,
        null,
        body,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          final loginResponse = LoginResponseModel.fromJson(data);
          if (loginResponse.success == false) {
            loginLoader.value = false;
            SnackBars().showSnackBar("Error", "User not found.", AppColors.errorSnackColor);
          } else {
            loginLoader.value = false;
            await LocalStorage().saveLoginData(data['data']);
            clearLoginControllers();
            // sendFcmToken();
            RoutingService.pushAndRemoveUntil(const HomeScreen());
            SnackBars().showSnackBar("Success", loginResponse.message.firstOrNull ?? "Login successful.", AppColors.successSnackColor);
          }
        },
        loading: (message) {
          appPrint("Loading State -  $message");
        },
        error: (message) {
          loginLoader.value = false;
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
          appPrint("Error State -  $message");
        },
        orElse: () {
          loginLoader.value = false;
          appPrint("orElse State - on error");
        },
      );
    } on NotFoundException {
      loginLoader.value = false;
      SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
    } on UnauthorizedException {
      loginLoader.value = false;
      SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
    } catch (e) {
      loginLoader.value = false;
      SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
    }

    loginLoader.value = false;
  }

  ///
  /// Sign Up Api Call
  ///
  Future<void> onSignUp() async {
    if (!_validateSignUpInputs()) {
      return;
    }
    var body = {
      "firstname": firstNameControllerSignUp.value.text,
      "lastname": lastNamControllerSignUp.value.text,
      "email": emailControllerSignUp.value.text,
      "password": passControllerSignUp.value.text,
      "password_confirmation": passConfirmControllerSignUp.value.text,
      "accept_terms": isTAndC.value ? 1 : 0,
    };

    signUpLoader.value = true;

    try {
      NetworkResponse? response = await Api().apiCall(
        ApiEndpoints.register,
        null,
        body,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          final signUpResponse = SignUpResponseModel.fromJson(data);
          if (signUpResponse.success == false) {
            signUpLoader.value = false;
            SnackBars().showSnackBar("Error", "User not found.", AppColors.errorSnackColor);
          } else {
            signUpLoader.value = false;
            // await LocalStorage().saveLoginData(data['data']);
            clearSignUpControllers();
            // sendFcmToken();
            RoutingService.pushAndRemoveUntil(const LoginScreen());
            SnackBars().showSnackBar("Success", signUpResponse.message, AppColors.successSnackColor);
          }
        },
        loading: (message) {
          appPrint("Loading State -  $message");
        },
        error: (message) {
          signUpLoader.value = false;
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
          appPrint("Error State -  $message");
        },
        orElse: () {
          signUpLoader.value = false;
          appPrint("orElse State - on error");
        },
      );
    } on NotFoundException {
      signUpLoader.value = false;
      SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
    } on UnauthorizedException {
      signUpLoader.value = false;
      SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
    } catch (e) {
      signUpLoader.value = false;
      SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
    }

    signUpLoader.value = false;
  }

  ///
  /// Verify Email and request OTP
  ///
  Future<void> verifyEmail() async {
    var body = {
      "email": emailControllerVerify.value.text,
    };

    isVerifyEmailLoading.value = true;

    try {
      NetworkResponse? response = await Api().apiCall(
        ApiEndpoints.verifyEmail,
        null,
        body,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          SnackBars().showSnackBar("Success", data['message'].toString(), AppColors.successSnackColor);
          isVerifyEmailLoading.value = false;
          RoutingService.push(OTPVerificationScreen());
        },
        loading: (message) {
          appPrint("Loading State -  $message");
        },
        error: (message) {
          isVerifyEmailLoading.value = false;
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
          appPrint("Error State -  $message");
        },
        orElse: () {
          isVerifyEmailLoading.value = false;
          appPrint("orElse State - on error");
        },
      );
    } on NotFoundException {
      isVerifyEmailLoading.value = false;
      SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
    } on UnauthorizedException {
      isVerifyEmailLoading.value = false;
      SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
    } catch (e) {
      isVerifyEmailLoading.value = false;
      SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
    }

    isVerifyEmailLoading.value = false;
  }

  Future<void> validateOTP() async {
    var body = {
      "email": emailControllerVerify.value.text,
      "code": otpTextController.text,
    };

    isOtpVerifying.value = true;

    try {
      NetworkResponse? response = await Api().apiCall(
        ApiEndpoints.verifyOTP,
        null,
        body,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          SnackBars().showSnackBar("Success", data['message'].toString(), AppColors.successSnackColor);
          isOtpVerifying.value = false;
          RoutingService.push(CreateNewPassScreen());
        },
        loading: (message) {
          appPrint("Loading State -  $message");
        },
        error: (message) {
          isOtpVerifying.value = false;
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
          appPrint("Error State -  $message");
        },
        orElse: () {
          isOtpVerifying.value = false;
          appPrint("orElse State - on error");
        },
      );
    } on NotFoundException {
      isOtpVerifying.value = false;
      SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
    } on UnauthorizedException {
      isOtpVerifying.value = false;
      SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
    } catch (e) {
      isOtpVerifying.value = false;
      SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
    }
  }

  ///
  /// Create New Password Api
  ///
  Future<void> createNewPassword() async {
    if (!_validateCreateNewPassInputs()) {
      return;
    }
    var body = {
      "email": emailControllerVerify.value.text,
      "code": otpTextController.text,
      "password": newPasswordController.value.text,
      "password_confirmation": cnfmNewPassController.value.text,
    };

    isNewPasswordLoading.value = true;

    try {
      NetworkResponse? response = await Api().apiCall(
        ApiEndpoints.resetPassword,
        null,
        body,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          SnackBars().showSnackBar("Success", data['message'].toString(), AppColors.successSnackColor);
          isNewPasswordLoading.value = false;
          RoutingService.push(ResetPassSuccessScreen());
        },
        loading: (message) {
          appPrint("Loading State -  $message");
        },
        error: (message) {
          isNewPasswordLoading.value = false;
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
          appPrint("Error State -  $message");
        },
        orElse: () {
          isNewPasswordLoading.value = false;
          appPrint("orElse State - on error");
        },
      );
    } on NotFoundException {
      isNewPasswordLoading.value = false;
      SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
    } on UnauthorizedException {
      isNewPasswordLoading.value = false;
      SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
    } catch (e) {
      isNewPasswordLoading.value = false;
      SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
    }

    isNewPasswordLoading.value = false;
  }

  ///
  /// Logout Api Call
  ///
  Future<void> onLogout(BuildContext context) async {
    AppLoader.startLoading();

    try {
      final response = await Api().apiCall(
        ApiEndpoints.logout,
        null,
        null,
        RequestType.POST,
      );

      response?.maybeWhen(
        success: (data) async {
          if (!context.mounted) return;
          AppLoader.stopLoading();
          SnackBars().showSnackBar("Success", data['message'].toString(), AppColors.errorSnackColor);
          clearLoginControllers();
          await localStorage.clear();
          RoutingService.pushAndRemoveUntil(const LoginScreen());
        },
        loading: (_) {},
        error: (message) {
          if (!context.mounted) return;
          AppLoader.stopLoading();
          SnackBars().showSnackBar("Error", message.toString(), AppColors.errorSnackColor);
        },
        orElse: () {
          if (!context.mounted) return;
          AppLoader.stopLoading();
        },
      );
    } on NotFoundException {
      if (context.mounted) {
        AppLoader.stopLoading();
        SnackBars().showSnackBar("Error", "User not found, please try again.", AppColors.errorSnackColor);
      }
    } on UnauthorizedException {
      if (context.mounted) {
        AppLoader.stopLoading();
        SnackBars().showSnackBar("Error", "Unauthorized access. Please check your credentials.", AppColors.errorSnackColor);
      }
    } catch (_) {
      if (context.mounted) {
        AppLoader.stopLoading();
        SnackBars().showSnackBar("Error", "An unexpected error occurred. Please try again.", AppColors.errorSnackColor);
      }
    }
  }
}
