import 'package:flutter/material.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/FlashCards/flash_cards.dart';
import 'package:study_mate/Features/Home/presentation/screens/home_screen.dart';
import 'package:study_mate/Features/Home/presentation/nav_bar.dart';
import 'package:study_mate/Features/Music/music_screen.dart';
import 'package:study_mate/Features/Notes/notes_screen.dart';
import 'package:study_mate/Features/Pomodoro/pomodoro_screen.dart';
import 'package:study_mate/Features/Summarization/summarization_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => MusicScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => MusicScreen());

      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => ProfileScreen());
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
