import 'package:flutter/material.dart';
import 'package:testing/add_todo.dart';
import 'package:testing/list_test.dart';
// import 'package:misiku_client/models/mission_model.dart';
// import 'package:misiku_client/views/auth/login_client_screen.dart';
// import 'package:misiku_client/views/auth/register_client_screen.dart';
// import 'package:misiku_client/views/home/client_home.dart';
// import 'package:misiku_client/views/home/deposit_screen.dart';
// import 'package:misiku_client/views/home/tambah_reward_screen.dart';
// import 'package:misiku_client/views/home/test_tambah_reward.dart';
// import 'package:misiku_client/views/mission/misi_baru_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  welcomePage() {
    // return LoginClientScreen();
    // return DepositScreen();
    // return TambahRewards();
    return ListTest();
    // return AddTodo();

  }

  @override
  Widget build(BuildContext context) {
    welcomePage();
    return MaterialApp(
      title: 'Misiku-Client',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: welcomePage(),
      ),
      routes: <String, WidgetBuilder>{
        '/home': (_) => new ListTest(),
        '/addTodo': (_) => new AddTodo(),
      //   '/homeScreen': (_) => new HomeClient(),
      //   '/deposit': (_) => new DepositScreen(),
      //   '/createMission': (_) => new MisiBaruScreen()
      },
    );
  }
}
