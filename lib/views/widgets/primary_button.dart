part of 'widgets.dart';

class PrimaryButton extends StatelessWidget {

  void Function()? onPress;
  var text;
  
  PrimaryButton({ Key? key, required this.onPress, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Padding(
            padding:
                const EdgeInsets.only(bottom: 0, right: 10, left: 10, top: 10),
            child: ElevatedButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: sizeScreen.width * 0.3,
                child: Center(
                  child: Text(  
                    "$text",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: secondColor,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onPress,
            ),
          );
  }
}