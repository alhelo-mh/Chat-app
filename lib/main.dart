import 'package:chat_app/ap_router/app_router.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/registratoin_screen.dart';
import 'package:chat_app/screens/signin_screen.dart';
import 'package:chat_app/screens/splish.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        navigatorKey: AppRouter.navkey,
        debugShowCheckedModeBanner: false,
        // home: WelcomeScreen(),

        routes: {
          'welcome_screen': (context) => WelcomeScreen(),
          'registr_screen': (context) => RegistrScreen(),
          'signIn_screen': (context) => SignInScreen(),
          'chat_screen': (context) => ChatScreen(),
        },
        home: SplishScreen(),
      ),
    );
  }
}
