import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/view_model/bhajan_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/response/status.dart';
import '../../utils/color_constant.dart';

class BhajanMusicScreen extends StatefulWidget {
  const BhajanMusicScreen({Key? key}) : super(key: key);

  @override
  State<BhajanMusicScreen> createState() => _BhajanMusicScreenState();
}

class _BhajanMusicScreenState extends State<BhajanMusicScreen> {

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
      context.read<BhajanViewModel>().fetchBhajanAPi();}); // asking for location permission and setting the state

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bhajan & Music'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(

        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Consumer<BhajanViewModel>(builder: (context, value, _) {
              switch (value.bhajanList.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  return Center(
                    child: Text('Sorry for the inconvenence!'),
                  );
                case Status.completed:
                  return
                    value.bhajanList.message == "Data not found" ?
                    Text('Nothing for now!')
                        :
                    ListView.builder(
                        itemCount: value.bhajanList.data!.data!.length,
                        itemBuilder: (context, index) {
                          return listItem(() {
                            launchUrlString(value.bhajanList.data!.data![index].link.toString());
                          },
                              value.bhajanList.data!.data![index].title.toString()
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
