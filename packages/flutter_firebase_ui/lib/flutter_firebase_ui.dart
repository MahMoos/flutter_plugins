library flutter_firebase_ui;

export 'utils.dart';

import 'package:flutter/material.dart';
import 'login_view.dart';
import 'utils.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({
    Key key,
    this.appBar,
    this.header,
    this.footer,
    this.signUpPasswordCheck,
    this.providers,
    this.color = Colors.white,
    this.twitterConsumerKey,
    this.twitterConsumerSecret,
  }) : super(key: key);

  final Widget appBar;
  final Widget header;
  final Widget footer;
  final List<ProvidersTypes> providers;
  final Color color;
  final bool signUpPasswordCheck;
  final String twitterConsumerKey;
  final String twitterConsumerSecret;

  @override
  _SignInScreenState createState() => new _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Widget get _appBar => widget.appBar ?? new Container();
  Widget get _header => widget.header ?? new Container();
  Widget get _footer => widget.footer ?? new Container();

  bool get _passwordCheck => widget.signUpPasswordCheck ?? false;

  List<ProvidersTypes> get _providers =>
      widget.providers ?? [ProvidersTypes.email];

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: _appBar;
      body: new Builder(
        builder: (BuildContext context) {
          return new Container(
              padding: const EdgeInsets.all(16.0),
              decoration: new BoxDecoration(color: widget.color),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _header,
                  new Expanded(
                      child: new LoginView(
                          providers: _providers,
                          passwordCheck: _passwordCheck,
                          twitterConsumerKey: widget.twitterConsumerKey,
                          twitterConsumerSecret: widget.twitterConsumerSecret)),
                  _footer
                ],
              ));
        },
      ));
}
