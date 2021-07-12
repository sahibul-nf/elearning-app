part of 'pages.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return MaxWidthContainer(
      maxWidth: sizeScreen.width * 0.8,
      child: Container(
        // color: secondColor,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              height: sizeScreen.height * 0.35,
              width: sizeScreen.width,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Marchine Learning",
                style: whiteTextFont.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    // color: mainColor,
                    margin: EdgeInsets.only(right: 20),
                    height: 150,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: sizeScreen.height,
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
