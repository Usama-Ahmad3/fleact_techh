import 'package:firebase_core/firebase_core.dart';
import 'package:fleact_tech/view/home_screens/main_%20bottom_bar.dart';
import 'package:fleact_tech/view/home_screens/profile/add_family_member/add_family_member_Provider.dart';
import 'package:fleact_tech/view/home_screens/profile/edit_profile/edit_profile_provider.dart';
import 'package:fleact_tech/view/home_screens/profile/profile_screen_provider.dart';
import 'package:fleact_tech/view/login_sigup/login/login.dart';
import 'package:fleact_tech/view/login_sigup/login/login_provider.dart';
import 'package:fleact_tech/view/login_sigup/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'res/colors/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyD8FBOcj85FrfD9dIQBUcsgo6v8Gd76ib8',
          appId: 'com.usama.fleact_tech',
          messagingSenderId: '476621520935',
          storageBucket: "fleacttech-b8eac.appspot.com",
          projectId: 'fleacttech-b8eac'));
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isLogin = false;
  load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isLogin = pref.getBool('login') ?? false;
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyApp(
        isLogin: isLogin,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  bool isLogin;
  MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddFamilyMemberProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: AppColors.themeColor),
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.022),
              headline2: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.015,
                  color: AppColors.black),
              headline3: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.012),
            )),
        home: isLogin ? MainBottomBar() : Login(),
      ),
    );
  }
}
