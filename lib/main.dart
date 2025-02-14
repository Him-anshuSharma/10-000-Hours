import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/providers/timer_provider.dart';
import 'package:ten_thousand_hours/view/screens/edit_taskname.dart';
import 'package:ten_thousand_hours/view/screens/splash_screen.dart';
import 'package:ten_thousand_hours/view/screens/onboarding_screen.dart';
import 'view/screens/add_task.dart';
import 'view/screens/timer_screen.dart';
import 'view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  TaskListProvider taskListProvider = TaskListProvider();
  await taskListProvider.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => taskListProvider,
      ),
      ChangeNotifierProvider(
        create: (context) => TimerProvider(),
      )
    ],
    child: MaterialApp(
      title: "10,000 Hours",
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnboardingScreen.id: (context) => const OnboardingScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        EditTaskName.id: (context) => const EditTaskName(),
        HomeScreen.id: (context) => const HomeScreen(),
        AddTask.id: (context) => AddTask(),
        TaskTimer.id: (context) => const TaskTimer(),
      },
    ),
  ));
}
