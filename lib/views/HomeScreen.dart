import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googlead/models/GoogleAd.dart';
import 'package:googlead/src/onboarding/onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  Color drawercolor = const Color.fromARGB(255, 103, 33, 243);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Opacity(
        opacity: 0.7,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: drawercolor),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3), // Black with 30% opacity
            blurRadius: 50.0,
            spreadRadius: 4.0,
            offset: Offset(-5.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Positioned(
                  top: 0.0,
                  left: 50.0,
                  right: 0.0,
                  child: Text(
                    "Menu",
                    style: GoogleFonts.spicyRice(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Giftee',
                      style: GoogleFonts.dancingScript(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.greenAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent.shade100,
          title: const Text('Home Screen'),
          leading: IconButton(
            color: drawercolor,
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: buildUI(),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  Widget buildUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Recipies',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingScreen()),
              );
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
