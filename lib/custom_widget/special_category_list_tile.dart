import 'package:bafdo/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget specialCategoryListTile(BuildContext context,
    String giftCategories, String iconList) {
  Size size = MediaQuery.of(context).size;

  return Container(
    color: Colors.white,
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: size.width * .13,
          width: size.width * .13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(width: 1, color: Colors.pink),
            color: ColorsVariables.backgrowndColor,
          ),
          child: CachedNetworkImage(
            imageUrl: '$iconList',
            placeholder: (context, url) => CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: size.width * .01,
        ),
        Flexible(
          child: Container(
              width: size.width * .3,
              child: Text(
                '$giftCategories',
                style: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .027),
                textAlign: TextAlign.center,
              )),
        )
      ],
    ),
  );
}
