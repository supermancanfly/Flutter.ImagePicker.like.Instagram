import 'package:flutter/material.dart';
import 'package:lgcy_flutter/views/auth/login_view.dart';
import 'package:lgcy_flutter/views/auth/register_view.dart';
import 'package:lgcy_flutter/views/auth/create_username.dart';
import 'package:lgcy_flutter/views/auth/create_password.dart';
import 'package:lgcy_flutter/views/auth/forget_password.dart';
import 'package:lgcy_flutter/views/auth/enter_code.dart';
import 'package:lgcy_flutter/views/pages/homepage.dart';
import 'package:lgcy_flutter/views/pages/like_page.dart';
import 'package:lgcy_flutter/views/pages/notification_alram.dart';
// import 'package:lgcy_flutter/views/pages/profile/profile_page.dart';
// import 'package:lgcy_flutter/views/pages/profile/private_user_profile.dart';
// import 'package:lgcy_flutter/views/pages/profile/account_setting.dart';
// import 'package:lgcy_flutter/views/pages/profile/profile_setting.dart';
import 'package:lgcy_flutter/views/pages/setting.dart';
import 'package:lgcy_flutter/views/pages/timeline/public_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/public_timeline_public.dart';
import 'package:lgcy_flutter/views/pages/timeline/secret_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/suggested_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/time_capsule.dart';
import 'package:lgcy_flutter/views/pages/timeline/timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/private_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/edit_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/edit_private_timeline.dart';
import 'package:lgcy_flutter/views/pages/timeline/invite_members.dart';

import 'package:lgcy_flutter/views/pages/user_page/change_password.dart';
import 'package:lgcy_flutter/views/pages/user_page/change_phonenumber.dart';
import 'package:lgcy_flutter/views/pages/user_page/change_username.dart';

import 'package:lgcy_flutter/views/pages/chat_pages/chat_page.dart';
import 'package:lgcy_flutter/views/pages/user_page/search_img.dart';

import 'package:lgcy_flutter/views/pages/user_page/search_user.dart';
import 'package:lgcy_flutter/views/pages/picker/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lgcy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ImagePickerPage(),
        '/xxx': (context) => SuggestTimeline(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/create-username': (context) => CreateUserName(),
        '/create-password': (context) => CreatePassword(),
        '/forget-password': (context) => ForgetPassword(),
        '/enter-code': (context) => EnterCode(),

        '/homepage': (context) => HomePage(),
        '/like-page': (context) => LikePage(),
        '/setting': (context) => Setting(),

        // '/profile-page': (context) => ProfilePage(),
        // '/user-profile': (context) => PrivateUserProfile(),
        // '/account-setting': (context) => AccountSetting(),
        // '/profile-setting': (context) => ProfileSetting(),

        '/create-timeline': (context) => TimeLine(),
        '/private-timeline': (context) => PrivateTimeLine(),
        '/edit-timeline': (context) => EditTimeLine(),
        '/edit-private-timeline': (context) => EditPrivateTimeLine(),
        '/invite-members': (context) => InviteMembers(),

        '/change-password': (context) => ChangePassword(),
        '/change-phonenumber': (context) => ChangePhoneNumber(),
        '/change-username': (context) => ChangeUsername(),

        '/chat-page': (context) => ChatPage(),

        '/search-user': (context) => SearchUser(),
        '/search-image': (context) => SearchImage(),

        '/public-timeline': (context) => PublicTimeline(),
        '/public-timeline-public-view': (context) => PublicTimelinePublic(),
        '/secret-timeline': (context) => SecretTimeline(),
        '/time-capsule': (context) => TimeCapsule(),
        '/suggest-timeline': (context) => SuggestTimeline(),
        '/notification': (context) => NotificationAlram(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
