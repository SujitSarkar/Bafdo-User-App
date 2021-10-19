import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        _field(size, 'assets/app_icon/profile_icon/person_outlined.png', 'Name', 'Saidul Khan'),
        SizedBox(height: size.width*.02,),
        _field(size, 'assets/app_icon/profile_icon/message_outlined.png', 'Email', 'saidulkhan@gmail.com'),
        SizedBox(height: size.width*.02,),
        _field(size, 'assets/app_icon/profile_icon/phone_outlined.png', 'Phone', '+880 123 147 895'),
        SizedBox(height: size.width*.02,),
        _field(size, 'assets/app_icon/profile_icon/location_outlined.png', 'Address', 'Long beach, California'),
        SizedBox(height: size.width*.02,),
      ],
    );
  }

  Widget _field(Size size, String icon, String title, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width*.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff222232),
            child: Image.asset(icon),
          ),
          SizedBox(width: size.width*.04,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                      color: Color(0xffA7A6A8),
                      fontSize: size.width*.05,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: size.width*.025,),
                Text(value,
                  style: TextStyle(
                      color: Color(0xffC4C4C4),
                      fontSize: size.width*.04,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: size.width*.02,),

                Divider(
                  thickness: size.width*.002,
                  color: Color(0xff222232),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width*.04,),
          Column(
            children: [
              SizedBox(height: size.width*.03,),
              Icon(Icons.chevron_right_outlined, color: Color(0xffA7A6A8),),
            ],
          ),
        ],
      ),
    );
  }
}
