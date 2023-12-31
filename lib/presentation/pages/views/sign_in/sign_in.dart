import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../../bloc/main_screen.dart';
import '../commerce_page/commerce_page.dart';
import 'components/loginform.dart';
import 'components/social_login_button.dart';
import 'sign_up.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = false;
  String? accessToken;
  String? expiresAt;
  String? tokenType;
  String? name;
  String? birth;
  String? gender;
  String? refreshToken;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void _showSnackError(String error) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error.toString()),
      ),
    );
  }

  Future<void> _naverLogin() async {
    try {
      final NaverLoginResult user = await FlutterNaverLogin.logIn();
      NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;

      setState(() {
        accessToken = res.accessToken;
        tokenType = res.tokenType;
        refreshToken = res.refreshToken;
      });

      String id = user.account.email;
      String name = user.account.name;
      String tel = user.account.mobile
          .replaceAll('+82', '0')
          .replaceAll('-', '')
          .replaceAll(' ', '')
          .replaceAll('+', '');
      String sex = user.account.gender;
      String socialNo = '${user.account.birthyear}${user.account.birthday}'
          .replaceAll('-', '');
      String idx = user.account.id.toString();

      print('$id,$name,$tel,$sex,$socialNo, $idx');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } catch (error) {
      print('naver login error $error');
      _showSnackError('Naver Sign-In Failed: $error');
    }
  }

  Future<void> _googleLogin() async {
    try {
      await _googleSignIn.signIn();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    } catch (error) {
      print('google login error $error');
      _showSnackError('Google Sign-In Failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Material(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/image/anbu.png',
                  color: HexColor("#FF6A3D"),
                ),
                LoginForm(), // Use the LoginForm component
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("SNS 계정으로 간편 로그인"),
                  Expanded(child: Divider()),
                ]),

                // Add the social login buttons below the LoginForm
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: KakaoLoginButton(
                        onPressed: () async {
                          if (await isKakaoTalkInstalled()) {
                            try {
                              await UserApi.instance.loginWithKakaoTalk();
                              print('카카오톡으로 로그인 성공');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            } catch (error) {
                              print('카카오톡으로 로그인 실패 $error');

                              // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                              // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                              if (error is PlatformException &&
                                  error.code == 'CANCELED') {
                                return;
                              }
                              // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                              try {
                                await UserApi.instance.loginWithKakaoAccount();
                                print('카카오계정으로 로그인 성공');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ),
                                );
                              } catch (error) {
                                print('카카오계정으로 로그인 실패 $error');
                              }
                            }
                          } else {
                            try {
                              await UserApi.instance.loginWithKakaoAccount();
                              print('카카오계정으로 로그인 성공');
                            } catch (error) {
                              print('카카오계정으로 로그인 실패 $error');
                            }
                          }
                          try {
                            User user = await UserApi.instance.me();
                            print('사용자 정보 요청 성공'
                                '\n회원번호: ${user.id}'
                                '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                                '\n이메일: ${user.kakaoAccount?.email}');
                          } catch (error) {
                            print('사용자 정보 요청 실패 $error');
                          }
                          User user;

                          try {
                            user = await UserApi.instance.me();
                          } catch (error) {
                            print('사용자 정보 요청 실패 $error');

                            return;
                          }

                          List<String> scopes = [];

                          if (user.kakaoAccount?.emailNeedsAgreement == true) {
                            scopes.add('account_email');
                          }
                          if (user.kakaoAccount?.birthdayNeedsAgreement ==
                              true) {
                            scopes.add("birthday");
                          }
                          if (user.kakaoAccount?.birthyearNeedsAgreement ==
                              true) {
                            scopes.add("birthyear");
                          }
                          if (user.kakaoAccount?.ciNeedsAgreement == true) {
                            scopes.add("account_ci");
                          }
                          if (user.kakaoAccount?.phoneNumberNeedsAgreement ==
                              true) {
                            scopes.add("phone_number");
                          }
                          if (user.kakaoAccount?.profileNeedsAgreement ==
                              true) {
                            scopes.add("profile");
                          }
                          if (user.kakaoAccount?.ageRangeNeedsAgreement ==
                              true) {
                            scopes.add("age_range");
                          }

                          if (scopes.length > 0) {
                            print('사용자에게 추가 동의 받아야 하는 항목이 있습니다');

                            // OpenID Connect 사용 시
                            // scope 목록에 "openid" 문자열을 추가하고 요청해야 함
                            // 해당 문자열을 포함하지 않은 경우, ID 토큰이 재발급되지 않음
                            // scopes.add("openid")

                            //scope 목록을 전달하여 카카오 로그인 요청
                            OAuthToken token;
                            try {
                              token = await UserApi.instance
                                  .loginWithNewScopes(scopes);
                              print('현재 사용자가 동의한 동의 항목: ${token.scopes}');
                            } catch (error) {
                              print('추가 동의 요청 실패 $error');

                              return;
                            }

                            // 사용자 정보 재요청
                            try {
                              User user = await UserApi.instance.me();
                              print('사용자 정보 요청 성공'
                                  '\n회원번호: ${user.id}'
                                  '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                                  '\n이메일: ${user.kakaoAccount?.email}');
                            } catch (error) {
                              print('사용자 정보 요청 실패 $error');
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: NaverLoginButton(
                        onPressed: _naverLogin,
                      ),
                    ),
                    Expanded(
                      child: GoogleLoginButton(
                        onPressed: _googleLogin,
                      ),
                    ),
                    Expanded(
                      child: AppleLoginButton(
                        onPressed: () {
                          // Apple login logic here
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
