part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final _keyForm = GlobalKey<FormState>();

  String firstnameData;
  String lastnameData;
  String emailData;
  String passwordData;
  String confirmPasswordData;

  bool securer = false;
  Icon iconSecure = Icon(LineIcons.eye, color: greyColor);

  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void onTappedSuffixIcon() {
    if (securer == true) {
      setState(() {
        securer = false;
        iconSecure = Icon(
          LineIcons.eyeSlash,
          color: greyColor,
        );
      });
    } else {
      setState(() {
        securer = true;
        iconSecure = Icon(
          LineIcons.eye,
          color: greyColor,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Let's Begin!",
                style: blackTextFont.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              inputField(
                hintText: 'Your firstname',
                labelText: 'Firstname',
                prefixIcon: Icon(LineIcons.user, color: mainColor),
                userInputController: firstnameController,
                savedValue: (value) => firstnameData = value,
                validator: (value) =>
                    (value.isEmpty) ? 'Please input your firstname' : null,
              ),
              inputField(
                hintText: 'Your lastname',
                labelText: 'Lastname',
                prefixIcon: Icon(LineIcons.user, color: mainColor),
                userInputController: lastnameController,
                savedValue: (value) => lastnameData = value,
                validator: (value) =>
                    (value.isEmpty) ? 'Please input your lastname' : null,
              ),
              inputField(
                hintText: 'Your email',
                labelText: 'Email',
                prefixIcon: Icon(LineIcons.mailBulk, color: mainColor),
                userInputController: emailController,
                savedValue: (value) => emailData = value,
                validator: (value) =>
                    (value.isEmpty) ? 'Please input your email' : null,
              ),
              inputField(
                hintText: 'Your password',
                labelText: 'Password',
                prefixIcon: Icon(LineIcons.lock, color: mainColor),
                suffixIcon: GestureDetector(
                  child: iconSecure,
                  onTap: () => onTappedSuffixIcon(),
                ),
                secure: securer,
                userInputController: passwordController,
                savedValue: (value) => passwordData = value,
                validator: (value) => (value.isEmpty)
                    ? 'Please input your password'
                    : (value.length < 6)
                        ? 'Password length min 6 character'
                        : null,
                // onTapped: () => onTappedIcon(),
              ),
              inputField(
                hintText: 'Confirm your password',
                labelText: 'Confirm password',
                prefixIcon: Icon(LineIcons.lock, color: mainColor),
                suffixIcon: GestureDetector(
                  child: iconSecure,
                  onTap: () => onTappedSuffixIcon(),
                ),
                secure: securer,
                userInputController: passwordController,
                savedValue: (value) => passwordData = value,
                validator: (value) => (value.isEmpty)
                    ? 'Please input confirm your password'
                    : (value.length < 6)
                        ? 'Password length min 6 character'
                        : null,
              ),
              SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                elevation: 0,
                backgroundColor: secondColor,
                splashColor: greyColor,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    // checkForm();
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have acoount? ",
                    style: blackTextFont.copyWith(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/login");
                    },
                    child: Text(
                      "Sign In",
                      style: mainTextFont.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputField({
    String hintText = "",
    String labelText = "",
    TextEditingController userInputController,
    Widget prefixIcon,
    Widget suffixIcon,
    bool secure = false,
    String Function(String) validator,
    void Function(String) savedValue,
  }) {
    return Container(
      height: 60,
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
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: greyColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: mainColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
