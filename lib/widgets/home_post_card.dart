import 'package:flutter/material.dart';

class HomePostCard extends StatelessWidget {
  final String profilePicUrl;
  final String userPostUrl;
  final String userName;
  const HomePostCard({
    Key? key,
    required this.profilePicUrl,
    required this.userPostUrl,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 5),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    profilePicUrl,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Dec 19, 2022',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
                image: DecorationImage(
                    image: NetworkImage(userPostUrl), fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            // child: Image.network(
            //   userPostUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
        ],
      ),
    );
  }
}



