part of 'widgets.dart';

class CardClass extends StatelessWidget {
  String? title;
  String? username;
  final colorTheme;

  CardClass({
    Key? key,
    this.title,
    this.username,
    this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Card(
      borderOnForeground: true,
      elevation: 3,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1,
          color: greyColor,
        ),
      ),
      child: Container(
        height: 300,
        width: 308,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.classs);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: sizeScreen.width,
                  decoration: BoxDecoration(
                    color: colorTheme,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title.toString(),
                            style: whiteTextFont.copyWith(
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            LineIcons.verticalEllipsis,
                            color: bgColor,
                            size: 30,
                          ),
                        ],
                      ),
                      Text(username.toString()),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  // color: secondColor,
                  border: Border.all(
                    color: greyColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
