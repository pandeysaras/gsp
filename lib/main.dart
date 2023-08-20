import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view_model/auth_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/events_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/helpful_link_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/live_class_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/locale_provider.dart';
import 'package:gujarati_samaj_paris/widgets/add_event_widget.dart';
import 'package:provider/provider.dart';
import 'package:gujarati_samaj_paris/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: Colors.white,
    // statusBarBrightness: Brightness.light
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      // create: (context) => LocaleProvider(),
      // builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => EventsViewModel()),
            ChangeNotifierProvider(create: (_) => LiveClassViewModel()),
            ChangeNotifierProvider(create: (_) => HelpfulLinkViewModel()),

          ],
         child:   Builder(
           builder: (context) {
             final provider = Provider.of<LocaleProvider>(context);
             return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: provider.locale,
                  supportedLocales: L10n.all,
                  localizationsDelegates:  const[
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                      centerTitle: true,
                      backgroundColor: ColorConstant.defaultColor,
                      foregroundColor: ColorConstant.whiteColor
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                ),
                    useMaterial3: true,
                    primarySwatch: Colors.blue,
                    // brightness: Brightness.dark
                  ),
                  initialRoute: RoutesName.splashScreen,
                  onGenerateRoute: Routes.generateRoute,
                  // home: AddEventWidget(imagePath: "https://media.istockphoto.com/id/185897873/photo/goddess-during-durga-puja-celebrations.webp?b=1&s=170667a&w=0&k=20&c=YJVvgmLDCPnDSEgrhUFgZ4GU4Sas2tG1kdIgQKPPbIo=", title: "Dussehra", description: "Dussehra, also known as Vijayadashami, is a major Hindu festival celebrated in various parts of India and Nepal. It marks the culmination of the nine-day festival called Navaratri, which honors the divine feminine energy and various forms of the goddess Durga.")

                );
           }
         ),

        );

  }
}

