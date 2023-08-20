import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view/conversation_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/bhajan_music_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/fees_donation_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/helpful_links_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/live_class_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/my_events_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/paid_programs_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/photos_videos_screen.dart';
import 'package:gujarati_samaj_paris/view/drawer_screens/vendor_listing_screen.dart';
import 'package:gujarati_samaj_paris/view/feed_screen.dart';
import 'package:gujarati_samaj_paris/view/home_screen.dart';
import 'package:gujarati_samaj_paris/view/home_screen_layout.dart';
import 'package:gujarati_samaj_paris/view/select_language_screen.dart';
import 'package:gujarati_samaj_paris/widgets/create_event.dart';
import 'package:gujarati_samaj_paris/widgets/preview_article.dart';
import '../../view/drawer_screens/event_screen.dart';
import '../../view/drawer_screens/my_id_card.dart';
import '../../view/login_screen.dart';
import '../../view/signup_screen.dart';
import '../../view/splash_screen.dart';

class Routes {
  static CupertinoPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RoutesName.selectLanguageScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const SelectLanguageScreen(),
        );
      case RoutesName.loginScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.signupScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const SignupScreen(),
        );
      case RoutesName.homeScreenLayout:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const HomeScreenLayout(),
        );
      case RoutesName.myIdCard:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const MyIdCard(),
        );

      case RoutesName.eventScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const EventScreen(),
        );

      case RoutesName.myEventScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const MyEventsScreen(),
        );

      case RoutesName.createEventScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const CreateEventScreen(),
        );

      case RoutesName.previewArticle:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const PreviewArticle(),
        );

      case RoutesName.homeScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.feedScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const FeedScreen(),
        );

      case RoutesName.photosVideosScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const PhotosVideosScreen(),
        );

      case RoutesName.feesDonationScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const FeesDonationScreen(),
        );

      case RoutesName.liveClassScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const LiveClassScreen(),
        );

      case RoutesName.paidProgramsScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const PaidProgramsScreen(),
        );

      case RoutesName.vendorListingScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const VendorListScreen(),
        );

      case RoutesName.bhajanMusicScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const BhajanMusicScreen(),
        );

      case RoutesName.helpfulLinkScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const HelpfulLinks(),
        );

      case RoutesName.conversationScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const ConversationScreen(),
        );



      default:
        return CupertinoPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
