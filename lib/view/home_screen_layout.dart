import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view/conversation_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/event_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/my_id_card.dart';
import 'package:gujarati_samaj_paris/view/feed_screen.dart';
import 'package:gujarati_samaj_paris/view/home_screen.dart';
import 'package:gujarati_samaj_paris/widgets/app_bar_widget.dart';
import 'package:gujarati_samaj_paris/widgets/home_post_card.dart';
import '../widgets/navigation_bar_widget.dart';
import 'drawer_screens/my_events_screen.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {

  int _selectedIndex = 0;
  /// Tab navigation
  Widget _showCurrentNavBar() {
    List<Widget> options = <Widget>[
      HomeScreen(),
      // MatchesTab(),
      FeedScreen(),
      ConversationScreen(),
      MyIdCard()
    ];

    return options.elementAt(_selectedIndex);
  }

  /// Update selected tab
  void _onTappedNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: ColorConstant.defaultColor,
        // automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width*0.16,),
            AppBarWidget(text: 'IGCA-Paris',),
            SizedBox(width: MediaQuery.of(context).size.width*0.22,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signupScreen);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
                radius: 18,
              ),
            )
          ],
        ),

      ),
      drawer: NavigationBarWidget(),
      body: SafeArea(
          child: Stack(
        children: [

          _showCurrentNavBar(),

      Positioned(left: 0, right: 0, bottom: 0, child: bottomNavBar(
          (){
            _onTappedNavBar(0);
          }, () {
        _onTappedNavBar(1);

      }, (){
        _onTappedNavBar(2);
      }, () {
            _onTappedNavBar(3);
      }
      ))
        ],
      )),
      // bottomNavigationBar: bottomNavBar(),
    );
  }
}

Widget bottomNavBar(VoidCallback tap1, VoidCallback tap2, VoidCallback tap3, VoidCallback tap4) {
  return Container(
    height: 65,
    width: double.infinity,
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xff82CEFA).withOpacity(0.95),
        borderRadius: BorderRadius.circular(50),
        // gradient: LinearGradient(
        //     colors: [Color(0xff7BC1FA), Color(0xff7BC1FA),],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight)),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 1,),
          bootomNavIcon(Icons.home_outlined, tap1, 'Home'),
         bootomNavIcon(Icons.filter, tap2, 'Feed'),
          bootomNavIcon(CupertinoIcons.chat_bubble_2, tap3, 'Chat'),
          bootomNavIcon(Icons.perm_identity, tap4, 'Id Card'),
          SizedBox(width: 1,),
        ],
      ),
    ),
  );
}

Widget bootomNavIcon(IconData iconData, VoidCallback onPress, String title) {
  return Column(
    children: [
      GestureDetector(
        onTap: onPress,
        child: Icon(
            iconData, color: Colors.white, size: 30,

          // style: IconButton.styleFrom(
          //     padding: const EdgeInsets.all(12),
          //     backgroundColor: Colors.blue.shade700,
          //     foregroundColor: Colors.white),
        ),
      ),
      Text(title, style: TextStyle(fontSize: 10, color: Colors.white
      ),)
    ],
  );
}
