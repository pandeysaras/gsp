import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view_model/live_class_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/response/status.dart';
import '../../utils/color_constant.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({Key? key}) : super(key: key);

  @override
  State<LiveClassScreen> createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  launchLink(String classLink) {
    try {
      launchUrlString(classLink, mode: LaunchMode.externalApplication);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    context.read<LiveClassViewModel>().fetchLiveClassAPi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Live Class'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<LiveClassViewModel>(builder: (context, value, _) {
              switch (value.classLinkList.status) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.error:
                  return Center(
                    child: Text(value.classLinkList.message.toString()),
                  );
                case Status.completed:
                  return ListView.builder(
                      itemCount: value.classLinkList.data!.data!.length,
                      itemBuilder: (context, index) {
                        return listItem(() {
                          launchUrlString(value
                              .classLinkList.data!.data![index].link
                              .toString());
                        },
                            value.classLinkList.data!.data![index].title
                                .toString());
                      });

                default:
                  return Container();
              }
            })),
      ),
    );
  }
}

Widget listItem(VoidCallback onPress, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
      tileColor: ColorConstant.tileColor,
    ),
  );
}
