import 'package:flutter/material.dart';
import 'package:shop_app/Widgets/Setting_button.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                top: 75,
              ),
              child: const Text(
                'Setting',
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.33,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SettingButton(
                      content: 'Edit Profile',
                      path: 'signup',
                      width: 0.578,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SettingButton(
                      content: 'Change Password',
                      path: 'signup',
                      width: 0.448,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SettingButton(
                      content: 'Add Payment Method',
                      path: 'continue_page',
                      width: 0.355,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'More',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SettingButton(
                      content: 'About us',
                      path: 'signup',
                      width: 0.61,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SettingButton(
                      content: 'Privacy policy',
                      path: 'signup',
                      width: 0.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
