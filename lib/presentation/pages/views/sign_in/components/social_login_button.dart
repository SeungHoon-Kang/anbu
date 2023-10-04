import 'package:flutter/material.dart';

class KakaoLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const KakaoLoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Trigger the onPressed function when tapped
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate image width based on screen width
          double imageWidth = constraints.maxWidth * 0.95;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/kakao_login.png', // Provide the correct path to your Kakao login button image
                width: imageWidth,
                fit: BoxFit.fitWidth, // Ensure the image fits the width
              ),
              const SizedBox(width: 4),
            ],
          );
        },
      ),
    );
  }
}

class NaverLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NaverLoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Trigger the onPressed function when tapped
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate image width based on screen width
          double imageWidth = constraints.maxWidth * 0.95;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/naver_login.png', // Provide the correct path to your Kakao login button image
                width: imageWidth,
                fit: BoxFit.fitWidth, // Ensure the image fits the width
              ),
              const SizedBox(width: 4),
            ],
          );
        },
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Trigger the onPressed function when tapped
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate image width based on screen width
          double imageWidth = constraints.maxWidth * 0.95;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/google_login.png', // Provide the correct path to your Kakao login button image
                width: imageWidth,
                fit: BoxFit.fitWidth, // Ensure the image fits the width
              ),
              const SizedBox(width: 4),
            ],
          );
        },
      ),
    );
  }
}

class AppleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppleLoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Trigger the onPressed function when tapped
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate image width based on screen width
          double imageWidth = constraints.maxWidth * 0.95;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/apple_login.png', // Provide the correct path to your Kakao login button image
                width: imageWidth,
                fit: BoxFit.fitWidth, // Ensure the image fits the width
              ),
              const SizedBox(width: 4),
            ],
          );
        },
      ),
    );
  }
}
