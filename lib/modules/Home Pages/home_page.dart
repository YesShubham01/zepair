import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_container.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double w; // width
  late double h; // height
  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: <Widget>[
          _getNotificationButton(),
          _getProfileAvatar(),
        ],
      ),
      body: const Center(child: CustomText(text: "HomePage")),
    );
  }

  _getProfileAvatar() {
    return //profile
        const CircleAvatar(
      foregroundColor: CustomColors.lightBlue,
    );
  }

  _getNotificationButton() {
    return IconButton(
      icon: const Badge(
        child: Icon(
          Icons.notifications,
        ),
      ),
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const NotificationPage(),
        //   ),
        // );
      },
    );
  }
}
