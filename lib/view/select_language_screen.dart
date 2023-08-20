import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';
import 'package:gujarati_samaj_paris/utils/ui_constant.dart';
import 'package:gujarati_samaj_paris/view_model/locale_provider.dart';
import 'package:gujarati_samaj_paris/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/routes/routes_name.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  bool isWidget1Selected = true;

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defaultColor,
        automaticallyImplyLeading: false,
        foregroundColor: ColorConstant.whiteColor,
        title: Text('Choose your language'),
      ),
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isWidget1Selected = true;
                          localeProvider.setLocale(Locale("en"));
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: isWidget1Selected ? Colors.blue : Colors.grey),
                            color: isWidget1Selected ? Colors.lightBlue.shade50 : Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('English', style: TextStyle(fontSize: 18)),
                                Text('Anglais',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black26)),
                              ],
                            ),
                            ImageIcon(
                              AssetImage('assets/tajmahal.png'),
                              size: 50,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWidget1Selected = false;
                        localeProvider.setLocale(Locale("fr"));
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isWidget1Selected ? Colors.grey : Colors.blue),
                          color: isWidget1Selected ? Colors.white : Colors.lightBlue.shade50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Français',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'French',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black26),
                              ),
                            ],
                          ),
                          ImageIcon(
                            AssetImage('assets/eiffel_tower.png'),
                            size: 50,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                },
                child:
                    Text(AppLocalizations.of(context)!.continueInEnglish, style: UiConstant.smallHeading),
                width: MediaQuery.of(context).size.width * 0.9,
              )
              // FilledButton(
              //     onPressed: () async{
              //       localeProvider.setLocale(Locale('en'));
              //       Navigator.pushNamed(context, RoutesName.loginScreen);
              //     },
              //     child: Text('English'),
              //     style: ButtonStyle(
              //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5))),
              //         minimumSize: MaterialStateProperty.all(Size(
              //             MediaQuery.of(context).size.width * 0.95,
              //             MediaQuery.of(context).size.height * 0.065)))),
              // SizedBox(
              //   height: 20,
              // ),
              // FilledButton(
              //     onPressed: ()  {
              //         localeProvider.setLocale(Locale('fr'));
              //       Navigator.pushNamed(context, RoutesName.loginScreen);
              //     },
              //     child: Text('Français'),
              //     style: ButtonStyle(
              //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5))),
              //         minimumSize: MaterialStateProperty.all(Size(
              //             MediaQuery.of(context).size.width * 0.95,
              //             MediaQuery.of(context).size.height * 0.065)))),
            ],
          ),
        ),
      )),
    );
  }
}
