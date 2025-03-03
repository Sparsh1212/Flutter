import 'package:flutter/material.dart';
import 'package:bugheist/config/login_signup_structure.dart';
import 'package:bugheist/pages/login_signup/footer.dart';
import 'package:bugheist/pages/login_signup/fresh.dart';
import 'package:bugheist/pages/login_signup/loading.dart';
import 'package:bugheist/pages/login_signup/reset_password.dart';
import 'package:bugheist/pages/login_signup/signup.dart';
import 'package:bugheist/pages/login_signup/user_password.dart';
import 'package:bugheist/data/login_model.dart';
import 'package:bugheist/data/signup_model.dart';
import 'package:bugheist/pages/issues.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BugHeist',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline6: TextStyle(color: Colors.black),
          button: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        body: buildLoginFresh(),
      ),
    );
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {},
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
        callFunction: (BuildContext _buildContext) {},
        logo: TypeLogo.google,
      ),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            print("APPLE");
          },
          logo: TypeLogo.apple),
      LoginFreshTypeLoginModel(
        callFunction: (BuildContext _buildContext) {
          Navigator.of(_buildContext).push(MaterialPageRoute(
            builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
          ));
        },
        logo: TypeLogo.userPassword,
      ),
    ];

    return LoginFresh(
      pathLogo: 'assets/logo_white.png',
      isExploreApp: true,
      functionExploreApp: () {},
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
      backgroundColor: Color(0xFFDC4654),
      cardColor: Color(0xFFF3F3F5),
      keyWord: LoginFreshWords(),
      textColor: Color(0xFF0F2E48),
    );
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);
        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(user);
          print(password);
          print('--------------   end call   ----------------');

          isRequest(false);
        });
      },
      logo: 'assets/logo_white.png',
      loginFreshWords: LoginFreshWords(),
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
      textColor: Color(0xFF0F2E48),
      backgroundColor: Color(0xFFE7004C),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/logo_white.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      loginFreshWords: LoginFreshWords(),
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      textColor: Color(0xFF0F2E48),
      backgroundColor: Color(0xFFE7004C),
    );
  }

  Widget widgetFooter() {
    return Container();
    // return Row(
    //   children: <Widget>[
    //     Expanded(
    //       child: LoginFreshFooter(
    //         logo: 'assets/logo.png',
    //         text: 'BugHeist',
    //         textColor: Color(0xFF42A5F5),
    //         funFooterLogin: () {},
    //       ),
    //     ),
    //   ],
    // );
    // return LoginFreshFooter(
    //   logo: 'assets/logo.png',
    //   text: 'BugHeist',
    //   textColor: Color(0xFF42A5F5),
    //   funFooterLogin: () {},
    // );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      loginFreshWords: LoginFreshWords(),
      logo: 'assets/logo_white.png',
      funSignUp:
          (BuildContext _context, Function isRequest, SignUpModel signUpModel) {
        isRequest(true);
        print(signUpModel.email);
        print(signUpModel.password);
        print(signUpModel.repeatPassword);
        print(signUpModel.surname);
        print(signUpModel.name);
        isRequest(false);
      },
      textColor: Color(0xFF0F2E48),
      backgroundColor: Color(0xFFE7004C),
    );
  }
}
