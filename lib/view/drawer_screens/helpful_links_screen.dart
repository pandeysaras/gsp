import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view_model/events_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/helpful_link_view_model.dart';
import 'package:gujarati_samaj_paris/view_model/live_class_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/response/status.dart';
import '../../utils/color_constant.dart';

class HelpfulLinks extends StatefulWidget {
  const HelpfulLinks({Key? key}) : super(key: key);

  @override
  State<HelpfulLinks> createState() => _HelpfulLinksState();
}

class _HelpfulLinksState extends State<HelpfulLinks> {

  launchLink(String classLink) {
    try {
      launchUrlString(classLink,
          mode: LaunchMode.externalApplication);
    } catch (e) {
      log(e.toString());
    }
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventsViewModel>().fetchEventsAPi();}); // asking for location permission and setting the state

      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Helpful Links'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Consumer<HelpfulLinkViewModel>(builder: (context, value, _) {
              switch (value.helpfulLinkList.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  return Center(
                    child: Text('Sorry for the inconvenence!'),
                  );
                case Status.completed:
                  return  ListView.builder(
                      itemCount: value.helpfulLinkList.data!.data!.length,
                      itemBuilder: (context, index) {
                        return listItem(() {
                          launchUrlString(value.helpfulLinkList.data!.data![index].link.toString());
                        },
                            value.helpfulLinkList.data!.data![index].title.toString()
                        );
                      });

                default:
                  return Container();
              }
            })
        ),
      ),
    );
  }
}

Widget listItem(VoidCallback onPress, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      title: Text(text, style:  TextStyle(
          color: Colors.white
      ),),
      trailing: IconButton(
          onPressed: onPress,
          icon: Icon(Icons.arrow_forward, color: Colors.white,)),
      tileColor: ColorConstant.tileColor,
    ),
  );
}
