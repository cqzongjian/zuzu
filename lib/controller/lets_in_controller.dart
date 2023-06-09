/*
* @author: zongjian
* @createTime: 2023/6/12 16:46
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zuzu/controller/app_user_controller.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/model/resp_model.dart';
import 'package:zuzu/model/user_model.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/utils/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zuzu/utils/logger.dart';
import 'package:zuzu/utils/toast_message.dart';
import 'package:zuzu/widgets/app_report.dart';

final log = logger(LetsInController);

class LetsInController extends AppGetxController {

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final FirebaseAuth _auth = FirebaseAuth.instance; // firebase instance/object

  // getting user auth status
  Stream<User?> get authChanges => _auth.authStateChanges();

  // getter for our user to access the user data from outside using this authChange getter
  User get user => _auth.currentUser!;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);
  }

  // sign in with google account function
  // this function will return a boolean value
  signInWithGoogle(BuildContext context) async {
    bool result = false;
    try {
      _isLoading.value = true;
      update();
      // getting google user
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // taking google auth with the authentication
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      if (googleAuth == null) {
        _isLoading.value = false;
        update();
      }
      // taking the credential of the user
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, // accessToken from google auth
        idToken: googleAuth?.idToken, // idToken from google auth
      );

      // user credential to use the firebase credential and sign in with the google account
      // also after this line of code the data will be reflected in the fireStore database
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Get the user form the firebase
      User? user = userCredential.user;

      _userFunctionDataStore(user, userCredential);
    } on FirebaseAuthException catch (e) {
      log.e(
          "🐞🐞🐞 Printing Error FirebaseAuthException => ${e.message!}  🐞🐞🐞");
      ToastMessage.error(e.message!);
      _isLoading.value = false;
      update();
      result = false;
    } on PlatformException catch (e) {
      _isLoading.value = false;
      update();
      log.e("🐞🐞🐞 Printing Error PlatformException => ${e.message!}  🐞🐞🐞");
    }
    _isLoading.value = false;
    update();
    return result;
  }

  _userFunctionDataStore(User? user, UserCredential userCredential) {
    debugPrint("----------Before Condition---------");
    debugPrint("----------${user?.uid}---------");
    print(user.toString());

    if (user != null) {

      signInWithGoogle2(user);
      debugPrint("----------After Start Condition---------");

      // storing some data for future use
      // ToastMessage.success("Login Success");
      // LocalStorage.isLoginSuccess(isLoggedIn: true);
      // LocalStorage.saveEmail(email: user.email ?? '');
      // LocalStorage.saveName(name: user.displayName ?? "");
      // LocalStorage.saveId(id: user.uid);

      debugPrint("----------Before Loc Save al Storage---------");


      // debugPrint(user.toString());

      debugPrint("_________________________________");


      // UserModel userData = UserModel(
      //   name: user.displayName ?? "",
      //   uniqueId: user.uid,
      //   phoneNumber: user.phoneNumber ?? "",
      //   isActive: true,
      //   imageUrl: user.photoURL ?? "",
      //   isPremium: false,
      //   textCount: 0,
      //   imageCount: 0,
      //   contentCount: 0,
      //   hashTagCount: 0,
      //   date: 0,
      //   email: user.email ?? '',
      // );

      // if (userCredential.additionalUserInfo!.isNewUser) {
      //   setData(userData);
      //
      // }
      // else {
      //   checkPremiumOrNot(userData);
      // }

    }
    else {
      _isLoading.value = false;
      update();
    }
  }

  Future<void> signInWithGoogle2(User user) async {
    const String url = '/passport/signInWithGoogle';

    try {
      final Map<String, dynamic> data = {
        'uid': user.uid,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'photoURL': user.photoURL,
        'displayName': user.displayName
      };

      final Map<String, dynamic> json = await AppHttp.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );

      print(json);

      final Resp res = Resp.fromJson(json);

      if (res.code == 200) {
        ToastMessage.success("Login Success");
        LocalStorage.saveId(id: user.uid);
        LocalStorage.isLoginSuccess(isLoggedIn: true);
        AppUserController.to.userData = UserData.fromJson(res.data);
        Get.offAndToNamed(Routes.indexScreen);
      }
    } catch (e, t) {
      AppReport.modelError(
        url: url,
        e: e,
        t: t,
      );
    }
  }


}
