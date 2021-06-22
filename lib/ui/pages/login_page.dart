part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();

  String emailData;
  String passwordData;

  bool securer = false;
  Icon iconSecure = Icon(LineIcons.eye, color: greyColor);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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

  void checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataLogin();
    }
  }

  void submitDataLogin() async {
    // String urlAPI = 'https://40c17614ccd1.ngrok.io/my-dictionary-server/login.php';
    // final apiResult = await http.post(
    //   urlAPI,
    //   body: {'username': usernameN, 'password': passwordN},
    // );

    // final data = jsonDecode(apiResult.body);

    // int value = data['value'];
    // String msg = data['msg'];

    // print(data);

    // // get data respon
    // String dataUsername = data['username'];
    // String dataEmail = data['email'];
    // String dataAddress = data['address'];
    // String dataGender = data['gender'];
    // String dataFullName = data['full_name'];
    // String dataCreatedAt = data['createdAt'];
    // String dataIdUser = data['id_user'];
    // String dataProfession = data['profession'];

    // // cek value 1 atau 0 atau 2
    // if (value == 1) {
    //   setState(() {
    //     // set status login menjadi login
    //     _loginStatus = statusLogin.signIn;

    //     // simpan data ke share preferends
    //     saveDataPref(value, dataIdUser, dataUsername, dataEmail, dataAddress,
    //         dataGender, dataFullName, dataCreatedAt, dataProfession);
    //   });
    // } else {
    //   Flushbar(
    //     backgroundColor: Colors.pink[300],
    //     padding: EdgeInsets.only(left: 24, top: 16, bottom: 16),
    //     icon: Icon(Icons.warning),
    //     messageText: Text('$msg  $value',
    //         style: GoogleFonts.sourceSansPro(
    //             color: MyColor().color5, fontSize: 16)),
    //     duration: Duration(seconds: 3),
    //   ).show(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        desktop: desktop(),
        mobile: mobile(),
      ),
    );
  }

  Widget desktop() {
    return Form(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        child: ListView(
          children: [
            Text(
              'Welcome \nBack Explorer!',
              style: blackTextFont.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 54,
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
          ],
        ),
      ),
    );
  }

  // TODO : mobile()
  Widget mobile() {
    return Form(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Welcome Back\nSign In Now!",
              style: blackTextFont.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 54,
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
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Forgot password?',
                style: blackTextFont.copyWith(),
              ),
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
                  checkForm();
                });
              },
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have a account yet? ',
                  style: blackTextFont.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/register");
                  },
                  child: Text(
                    'Sign Up',
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
