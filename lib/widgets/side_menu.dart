import 'package:flutter/material.dart';
import 'package:mobile/models/status.dart';
import 'package:mobile/pages/about.dart';
import 'package:mobile/pages/blog.dart';
import 'package:mobile/pages/home.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/register.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Status status = Status();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          !status.isLogin ? LoginBtn() : Container(),
          !status.isLogin ? RegisterBtn() : Container(),
          status.isLogin
              ? ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                  onTap: () {
                    // Action on click
                    Navigator.pop(context);
                  },
                )
              : Container(),
          status.isLogin
              ? ListTile(
                  leading: Icon(Icons.library_books_outlined),
                  title: Text('Blog'),
                  onTap: () {
                    // Action on click
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BlogPage()),
                    );
                  },
                )
              : Container(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () {
              // Action on click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          status.isLogin
              ? ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text('Logout'),
                  onTap: () {
                    // Action on click
                    Status().isLogin = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Berhasil Logout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  // This method will be used to update the status and rebuild the widget
  void updateStatus() {
    setState(() {
      // Update the status here
      status.isLogin = !status.isLogin; // Example: toggling login status
    });
  }
}

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.app_registration),
      title: Text('Register'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
    );
  }
}

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.login),
      title: Text('Login'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }
}
