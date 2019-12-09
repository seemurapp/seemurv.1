import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seemur_v1/auth/auth.dart';
import 'package:seemur_v1/login_admin/checkroles.dart';
import 'package:seemur_v1/models/user_model.dart';
import 'package:seemur_v1/screens/descubrir.dart';
import 'package:seemur_v1/screens/home.dart';
import 'package:seemur_v1/screens/user/preferences_page.dart';

//final LocalStorage storage = new LocalStorage('userdata');
class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key key, this.user, this.auth}) : super(key: key);
  final usuario = Usuario;
  final FirebaseUser user;
  final BaseAuth auth;

  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  @override
  Widget build(BuildContext context) {
    Color _colorInicio = Colors.black;
    var changecolorInicio = _colorInicio;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 173,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0, // has the effect of softening the shadow
            spreadRadius: 3.5, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ], color: Color(0xffffffff)),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  tooltip: 'Inicio',
                  icon: Icon(
                    IconData(
                      0xF447,
                      fontFamily: 'CupertinoIcons',
                    ),
                    color: changecolorInicio,
                  ),
                  iconSize: 24,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage(
                        auth: Auth(),
                      );
                    }));
                    setState(() {
                      changecolorInicio = Colors.yellow;
                    });
                  },
                ),
                Text("Inicio",
                    style: TextStyle(
                      fontFamily: 'HankenGrotesk',
                      color: Color(0xff17202c),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.compass,
                    color: Color(0xff3d3d3d),
                  ),
                  iconSize: 24,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Descubrir();
                    }));
                  },
                ),
                Text("Descubrir",
                    style: TextStyle(
                      fontFamily: 'HankenGrotesk',
                      color: Color(0xff3d3d3d),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(IconData(59558, fontFamily: 'MaterialIcons')),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return CheckRoles(
                        auth: Auth(),
                      );

                      //return ClientAddPage ();
                    }));
                  },
                ),
                Text("Perfil",
                    style: TextStyle(
                      fontFamily: 'HankenGrotesk',
                      color: Color(0xff3d3d3d),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    IconData(
                      0xF43C,
                      fontFamily: 'CupertinoIcons',
                    ),
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return PreferencesPage(
                        auth: Auth(),
                      );
                      //return ClientAddPage ();
                    }));
                  },
                ),
                Text("Ajustes",
                    style: TextStyle(
                      fontFamily: 'HankenGrotesk',
                      color: Color(0xff3d3d3d),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
