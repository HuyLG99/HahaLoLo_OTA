import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black26),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Travel Dreams dsadadadsdsadsadsad',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  'Travel Dreamsdsdsadsadsdsadsadsadadsadsa',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   width: 60,
          // ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.more_vert,
              color: Colors.grey,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
