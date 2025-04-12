import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/login/data/login_repo.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';
import 'package:study_mate/Features/Auth/login/presentation/Screens/reset_password_screen.dart';
import 'package:study_mate/Features/Auth/login/presentation/screens/forget_password_screen.dart';
import 'package:study_mate/Features/Auth/login/presentation/screens/login_screen.dart';
import 'package:study_mate/Features/Auth/register/data/register_repo.dart';
import 'package:study_mate/Features/Auth/register/domain/register-cubit/register_cubit.dart';
import 'package:study_mate/Features/Auth/register/presentation/screens/register_screen.dart';
import 'package:study_mate/Features/Auth/verity_otp/verify_otp_screen.dart';
import 'package:study_mate/Features/FlashCards/flash_cards.dart';
import 'package:study_mate/Features/Home/presentation/nav_bar.dart';
import 'package:study_mate/Features/Home/presentation/screens/home_screen.dart';
import 'package:study_mate/Features/Music/music_screen.dart';
import 'package:study_mate/Features/Notes/notes_screen.dart';
import 'package:study_mate/Features/Pomodoro/pomodoro_screen.dart';
import 'package:study_mate/Features/Summarization/summarization_screen.dart';
import 'package:study_mate/Features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.nav_bar:
        return MaterialPageRoute(builder: (_) => NavBar());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.notes:
        return MaterialPageRoute(builder: (_) => NotesScreen());
      case Routes.summarization:
        return MaterialPageRoute(builder: (_) => SummarizationScreen());
      case Routes.flashcards:
        return MaterialPageRoute(builder: (_) => FlashCardsScreen());
      case Routes.pomodoro:
        return MaterialPageRoute(builder: (_) => PomodoroScreen());
      case Routes.music:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.quiz:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.chatbot:
        return MaterialPageRoute(builder: (_) => MusicScreen());

      //Auth
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.signIn:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => LoginCubit(getIt<loginRepository>()),
                child: LoginScreen(),
              ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => RegisterCubit(getIt<RegisterRepo>()),
                child: RegisterScreen(),
              ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routes.verifyOtp:
        return MaterialPageRoute(builder: (_) => VerifyOtpScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
