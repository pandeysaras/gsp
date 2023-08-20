import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/view_model/paid_program_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/response/status.dart';
import '../../utils/color_constant.dart';

class PaidProgramsScreen extends StatefulWidget {
  const PaidProgramsScreen({Key? key}) : super(key: key);

  @override
  State<PaidProgramsScreen> createState() => _PaidProgramsScreenState();
}

class _PaidProgramsScreenState extends State<PaidProgramsScreen> {

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
      context.read<PaidProgramViewModel>().fetchpaidProgramAPi();});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Paid Programs'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(

        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Consumer<PaidProgramViewModel>(builder: (context, value, _) {
              switch (value.paidProgramList.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  return Center(
                    child: Text('Sorry for the inconvenence!'),
                  );
                case Status.completed:
                  return
                    value.paidProgramList.message == "Data not found" ?
                    Text('Nothing for now!')
                        :
                    ListView.builder(
                        itemCount: value.paidProgramList.data!.data!.length,
                        itemBuilder: (context, index) {
                          return listItem(() {
                            launchUrlString(value.paidProgramList.data!.data![index].link.toString(), mode: LaunchMode.externalApplication);
                          },
                              value.paidProgramList.data!.data![index].title.toString()
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
