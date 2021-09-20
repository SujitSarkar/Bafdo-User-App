import 'package:bafdo/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class RecentlyViewesTile extends StatefulWidget {
  const RecentlyViewesTile({Key? key}) : super(key: key);

  @override
  _RecentlyViewesTileState createState() => _RecentlyViewesTileState();
}

class _RecentlyViewesTileState extends State<RecentlyViewesTile> {
  List subListIndex = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '10-07-2021',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.dividerColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),
            ),
          ),
          Card(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return recentDateListTile(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget recentDateListTile(int index) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: size.width * .95,
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.width * .2,
                        width: size.width * .2,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/app_icon/body_icon/joy_stick.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Gaming Controller for PC',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w600,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        ),
                        Image.asset(
                            'assets/app_icon/body_icon/faster_icon.png'),
                        Row(
                          children: [
                            Image.asset('assets/app_icon/body_icon/tk.png'),
                            Text(
                              '15.99',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.bold,
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 5,
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              subListIndex.remove(index);
                            });

                            print(subListIndex);
                          },
                          child: subListIndex.contains(index)
                              ? Image.asset(
                                  'assets/app_icon/body_icon/squire_pink_box.png')
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      subListIndex.add(index);
                                    });

                                    print(subListIndex);
                                  },
                                  child: Image.asset(
                                      'assets/app_icon/body_icon/squire_grey_box.png'))),
                      GradientButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => OTPPage()));
                        },
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.bold,
                              color: ColorsVariables.splashSkip,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                        borderRadius: 15,
                        height: size.width * .075,
                        width: size.width * .25,
                        gradientColors: [
                          Colors.pink.shade600,
                          Colors.pink.shade400
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
        Container(
          height: 1,
          width: size.width,
          color: Colors.grey,
        ),
      ],
    );
  }
}
