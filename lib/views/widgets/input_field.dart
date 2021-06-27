part of 'widgets.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? userInputController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool secure;
  final String? Function(String?)? validator;
  final void Function(String?)? savedValue;

  const InputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.userInputController,
    this.prefixIcon,
    this.suffixIcon,
    this.secure = false,
    this.validator,
    this.savedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: userInputController,
        validator: validator,
        onSaved: savedValue,
        cursorColor: greyColor,
        obscureText: secure,
        style: mainTextFont.copyWith(),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: greyTextFont,
          labelText: labelText,
          labelStyle: greyTextFont.copyWith(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: greyColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: mainColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
