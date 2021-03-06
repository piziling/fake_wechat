import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/memonts_model.dart';

import 'package:flutter_app/page/wechat/moments_page.dart';
import 'package:flutter_app/page/wechat/subscription_message_page.dart';
import 'package:flutter_app/subscription_box_model.dart';
import 'package:observable_ui/provider.dart';

import 'app_model.dart';
import 'home_model.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: MaterialApp(
        title: 'WeChat',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
            backgroundColor: Colors.transparent),
        routes: {
          '/': (BuildContext context) {
            return ViewModelProvider(
              viewModel: HomeModel(),
              child: HomePage(),
            );
          },
          "/subscription_box": (context) {
            return ViewModelProvider<SubscriptionBoxModel>(
              child: SubscriptionBoxPage(),
              viewModel: SubscriptionBoxModel(),
            );
          },
          "/moments": (context) {
            return ViewModelProvider(
              viewModel: MomentsModel(),
              child: MomentsPage(),
            );
          },
        },
      ),
      viewModel: AppModel(),
    );
  }
}
