import 'package:go_router/go_router.dart';
import 'package:speak/views/Auth/log_in.dart';
import 'package:speak/views/Auth/sign_up.dart';
import 'package:speak/views/auth/auth_actions/forgot_password.dart';
import 'package:speak/views/home.dart';
import 'package:speak/views/introScreen/intro_screen.dart';
import 'package:speak/views/stt_screen.dart';

import 'views/auth/initial_auth_page.dart';
import 'views/tts_screen.dart';

class Routes {
  static const signUp = '/signUp';
  static const logIn = '/logIn';
  static const home = '/home';
  static const stt = '/stt';
  static const tts = '/tss';
  static const authPage = '/authPage';
  static const intro = '/introScreen';
  static const forgotPassword = '/forgotPasswordScreen';
}

final router = GoRouter(initialLocation: Routes.authPage, routes: routes);

List<RouteBase> routes = [
  GoRoute(
      path: Routes.signUp, builder: (context, state) => const SignUpScreen()),
  GoRoute(path: Routes.logIn, builder: (context, state) => const LoginScreen()),
  GoRoute(path: Routes.intro, builder: (context, state) => const IntroScreen()),
  GoRoute(path: Routes.home, builder: (context, state) => const Home()),
  GoRoute(path: Routes.stt, builder: (context, state) => const STT()),
  GoRoute(path: Routes.tts, builder: (context, state) => const TextToSpeech()),
  GoRoute(path: Routes.authPage, builder: (context, state) => const InitialAuthPage()),
  GoRoute(path: Routes.forgotPassword, builder: (context, state) => const ForgotPasswordScreen(),),
];
