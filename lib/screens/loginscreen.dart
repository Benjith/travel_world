import 'package:flutter/material.dart';
import 'package:travel_world/appinfo.dart';
import 'package:travel_world/database/db_helper.dart';
import 'package:travel_world/datamodel/user.dart';
import 'package:travel_world/screens/dashboard.dart';
import 'package:travel_world/screens/registerform.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  VideoPlayerController _controller;

  String _username = '';
  String _password = '';
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/intro.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setVolume(0);

        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var deviceH = MediaQuery.of(context).size.height;
    var deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              // If your background video doesn't look right, try changing the BoxFit property.
              // BoxFit.fill created the look I was going for.
              fit: BoxFit.fill,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Expanded(child: Container(),),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                height: deviceH * 30 / 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withAlpha(200),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) => _username = val,
                          onFieldSubmitted: (val) => _username = val,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) => _password = val,
                          onFieldSubmitted: (val) => _password = val,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.vpn_key)),
                        ),
                      ),
                      Hero(
                        tag: 'login',
                                              child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.green.withRed(50),
                          onPressed: _checkLogin,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      FlatButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterForm(),
                                ),
                              ),
                          child: Text(
                            'Not registered? Tap here',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _checkLogin() async {
    if (_password.isNotEmpty && _username.isNotEmpty) {
      List data = await dbHelper.checkLogin(_username, _password);
      if (data.isNotEmpty) {
        AppInfo.loggedInUser = UserModel.fromJson(data.first);
        // redirect to dashboard
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      }
      // check login
    } else {
      // show snackbar

    }
  }
}
