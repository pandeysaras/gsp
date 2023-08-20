import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/utils/color_constant.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.7,
          height: MediaQuery.of(context).size.height*0.7 ,
          child: Drawer(
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                     width: MediaQuery.of(context).size.width*0.7,
                    height: 59,
                    color: ColorConstant.defaultColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.clear,
                            size: 27,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.14,),
                         Text('MENU', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        navigationItem('EVENT', 'assets/menu_items/event.png', context, 0.1, () {
                          Navigator.pushNamed(context, RoutesName.eventScreen);
                        }),
                        navigationItem('FESTIVAL', 'assets/menu_items/gallery.png', context, 0.11, () {
                          Navigator.pushNamed(context, RoutesName.eventScreen);
                        }),
                        navigationItem('PHOTOS & VIDEOS', 'assets/menu_items/golden_book.png', context, 0.08, () {
                          Navigator.pushNamed(context, RoutesName.photosVideosScreen);
                        }),
                        navigationItem('FEES & DONATION', 'assets/menu_items/giver.png', context, 0.07, () {
                          Navigator.pushNamed(context, RoutesName.feesDonationScreen);
                        }),
                        navigationItem('LIVE CLASS', 'assets/menu_items/contact_us.png', context, 0.1, () {
                          Navigator.pushNamed(context, RoutesName.liveClassScreen);
                        }),
                        navigationItem('PAID PROGRAMS', 'assets/menu_items/event.png', context, .08, () {
                          Navigator.pushNamed(context, RoutesName.paidProgramsScreen);
                        }),
                        navigationItem('VENDOR AND LISTING', 'assets/menu_items/event.png', context, .04, () {
                          Navigator.pushNamed(context, RoutesName.vendorListingScreen);
                        }),
                        navigationItem('JOB LISTING', 'assets/menu_items/event.png', context, .04, () {
                          Navigator.pushNamed(context, RoutesName.vendorListingScreen);
                        }),

                        navigationItem('BHAJANS & MUSICS', 'assets/menu_items/event.png', context, .06, () {
                          Navigator.pushNamed(context, RoutesName.bhajanMusicScreen);
                        }),
                        navigationItem('HELPFUL LINKS', 'assets/menu_items/event.png', context, .06, () {
                          Navigator.pushNamed(context, RoutesName.helpfulLinkScreen);
                        }),
                        navigationItem('MY ID CARD', 'assets/menu_items/event.png', context, .1, () {
                          Navigator.pushNamed(context, RoutesName.myIdCard);
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget navigationItem (String text, String iconUrl, BuildContext context, double width, VoidCallback onPress) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: 55,
        // color: Colors.black,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorConstant.blackColor
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            ImageIcon( AssetImage(iconUrl), color: ColorConstant.sideBarIcon ,),
            Spacer(),
            // SizedBox(width: MediaQuery.of(context).size.width*width,),
            Text(text,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
            Spacer()
          ],
        ),
      ),
    ),
  );
}
