import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:home_test/firebase_options.dart';
import 'package:pinput/pinput.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VerifyPhoneNumberScreen(phoneNumber: "+17408038357"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FirebasePhoneAuthHandler(
    phoneNumber: "+17408038357",
    // If true, the user is signed out before the onLoginSuccess callback is fired when the OTP is verified successfully.
    signOutOnSuccessfulVerification: false,
    
    linkWithExistingUser: false,
    builder: (context, controller) {
      return SizedBox.shrink();
    },
    onLoginSuccess: (userCredential, autoVerified) {
      debugPrint("autoVerified: $autoVerified");
      debugPrint("Login success UID: ${userCredential.user?.uid}");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
    },
    onLoginFailed: (authException, stackTrace) {
      debugPrint("An error occurred: ${authException.message}");
    },
    onError: (error, stackTrace) {},
),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:  Column(children: [
            SizedBox(height: 50),
            Text('Logged in UID: ${FirebaseAuth.instance.currentUser?.uid}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var acs = ActionCodeSettings(
    
            url: 'https://exampleherlp.page.link?cartId=1234',
            // This must be true
            handleCodeInApp: true,
            iOSBundleId: 'com.example.ios',
            androidPackageName: 'com.example.home_test',
            // installIfNotAvailable
            androidInstallApp: true,
            // minimumVersion
            androidMinimumVersion: '12'
            );
    var a;

    // First send the email verification link
    try{
             await FirebaseAuth.instance.sendSignInLinkToEmail(email: 'oreofesolarin@gmail.com', actionCodeSettings: acs)
             .catchError((onError) => print('Error sending email verification $onError'))
    .then((value) => print('Successfully sent email verification'));
    }catch(e){
     if (e is FirebaseAuthMultiFactorException ) {
  print('Failed with error code: ${e.code}');
  print('Failed with error message: ${e.message}');
}
    }

    // Then sign in with the email link

String emailLink = "https://exampleherlp.page.link/?link=https://testerprojecthome.firebaseapp.com/__/auth/action?apiKey%3DAIzaSyDCCFa8czcN6unDfRh9CAMI-HT48m5c7qg%26mode%3DsignIn%26oobCode%3DGcZemZ6q4viwTioJqkCZg0cmlr3ivoBmqROZ_gH4zCUAAAGPq1oFjw%26continueUrl%3Dhttps://exampleherlp.page.link?cartId%253D1234%26lang%3Den&apn=com.example.home_test&amv=12";
//  "https://exampleherlp.page.link/?link=https://testerprojecthome.firebaseapp.com/__/auth/action?apiKey%3DAIzaSyDCCFa8czcN6unDfRh9CAMI-HT48m5c7qg%26mode%3DsignIn%26oobCode%3D_LIVyUoq7CUUFMBzBzRo_USaineB2hrS8Fxf5c7oKqcAAAGPq1CUQg%26continueUrl%3Dhttps://exampleherlp.page.link?cartId%253D1234%26lang%3Den&apn=com.example.home_test&amv=12";
// "https://testerprojecthome.firebaseapp.com/__/auth/action?apiKey%3DAIzaSyDCCFa8czcN6unDfRh9CAMI-HT48m5c7qg%26mode%3DsignIn%26oobCode%3DsmRBrL8kSkCc2VrmUM-5DKbt2ACEvlgfqtW7vENrCcsAAAGPq0gFkQ%26continueUrl%3Dhttps://exampleherlp.page.link?cartId%253D1234%26lang%3Den&apn=com.example.home_test&amv=12";
if (FirebaseAuth.instance.isSignInWithEmailLink(emailLink)) {
  try {
    // The client SDK will parse the code from the link for you.
   final authCredential = EmailAuthProvider
    .credentialWithLink(email: "oreofesolarin@gmail.com", emailLink: emailLink.toString());

    try {
    await FirebaseAuth.instance.currentUser
        ?.linkWithCredential(authCredential);
} catch (error) {
    print("Error linking emailLink credential.");
}

    // You can access the new user via userCredential.user.
    final emailAddress = FirebaseAuth.instance.currentUser?.email;
    final number = FirebaseAuth.instance.currentUser?.phoneNumber;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully signed in with email link! $emailAddress $number '),
      ),
    );

    print('Successfully signed in with email link!');
  } catch (error) {
    print('Error signing in with email link. $error');
  }
}

              },
              child: const Text('Relogin'),
            ),
          ],),
        )
        ,
    );
  }
}

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        sendOtpOnInitialize: true,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          // log(VerifyPhoneNumberScreen.id, msg: 'OTP sent!');
          print('OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   msg: autoVerified
          //       ? 'OTP was fetched automatically!'
          //       : 'OTP was verified manually!',
          // );
          print(autoVerified
              ? 'OTP was fetched automatically!'
              : 'OTP was verified manually!');

          // showSnackBar('Phone number verified successfully!');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Phone number verified successfully!'),
            ),
          );

          // log(
          //   VerifyPhoneNumberScreen.id,
          //   msg: 'Login Success UID: ${userCredential.user?.uid}',
          // );
          print('Login Success UID: ${userCredential.user?.uid}');

          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   HomeScreen.id,
          //   (route) => false,
          // );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        // ignore: void_checks
        onLoginFailed: (authException, stackTrace) {
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   msg: authException.message,
          //   error: authException,
          //   stackTrace: stackTrace,
          // );
          print(authException.message);

          switch (authException.code) {
            case 'invalid-phone-number':
              // invalid phone number
              // return showSnackBar('Invalid phone number!');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invalid phone number!'),
                ),
              );
            case 'invalid-verification-code':
              // invalid otp entered
              // return showSnackBar('The entered OTP is invalid!');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The entered OTP is invalid!'),
                ),
              );
            // handle other error codes
            default:
              // showSnackBar('Something went wrong!');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong!'),
                ),
              );
            // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   error: error,
          //   stackTrace: stackTrace,
          // );
          print(error);

          // showSnackBar('An error occurred!');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An error occurred!'),
            ),
          );
        },
        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              title: const Text('Verify Phone Number'),
              actions: [
                if (controller.codeSent)
                  TextButton(
                    onPressed: controller.isOtpExpired
                        ? () async {
                            // log(VerifyPhoneNumberScreen.id, msg: 'Resend OTP');
                            print('Resend OTP');
                            await controller.sendOTP();
                          }
                        : null,
                    child: Text(
                      controller.isOtpExpired
                          ? 'Resend'
                          : '${controller.otpExpirationTimeLeft.inSeconds}s',
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                const SizedBox(width: 5),
              ],
            ),
            body: controller.isSendingCode
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      // CustomLoader(),
                     CircularProgressIndicator(),  
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Sending OTP',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.all(20),
                    controller: scrollController,
                    children: [
                      Text(
                        "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      if (controller.isListeningForOtpAutoRetrieve)
                       const Column(
                          children:  [
                            CircularProgressIndicator(),
                            SizedBox(height: 50),
                            Text(
                              'Listening for OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 15),
                            Divider(),
                            Text('OR', textAlign: TextAlign.center),
                            Divider(),
                          ],
                        ),
                      const SizedBox(height: 15),
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      PinInputField(
                        length: 6,
                        onFocusChange: (hasFocus) async {
                          if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                        },
                        onSubmit: (enteredOtp) async {
                          final verified =
                              await controller.verifyOtp(enteredOtp);
                          if (verified) {
                            // number verify success
                            // will call onLoginSuccess handler
                          } else {
                            // phone verification failed
                            // will call onLoginFailed or onError callbacks with the error
                          }
                        },
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}


class PinInputField extends StatefulWidget {
  final int length;
  final void Function(bool)? onFocusChange;
  final void Function(String) onSubmit;

  const PinInputField({
    Key? key,
    this.length = 6,
    this.onFocusChange,
    required this.onSubmit,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late final TextEditingController _pinPutController;
  late final FocusNode _pinPutFocusNode;
  late final int _length;

  Size _findContainerSize(BuildContext context) {
    // full screen width
    double width = MediaQuery.of(context).size.width * 0.85;

    // using left-over space to get width of each container
    width /= _length;

    return Size.square(width);
  }

  @override
  void initState() {
    _pinPutController = TextEditingController();
    _pinPutFocusNode = FocusNode();

    if (widget.onFocusChange != null) {
      _pinPutFocusNode.addListener(() {
        widget.onFocusChange!(_pinPutFocusNode.hasFocus);
      });
    }

    _length = widget.length;
    super.initState();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  PinTheme _getPinTheme(
    BuildContext context, {
    required Size size,
  }) {
    return PinTheme(
      height: size.height,
      width: size.width,
      textStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(7.5),
      ),
    );
  }

  static const _focusScaleFactor = 1.15;

  @override
  Widget build(BuildContext context) {
    final size = _findContainerSize(context);
    final defaultPinTheme = _getPinTheme(context, size: size);

    return SizedBox(
      height: size.height * _focusScaleFactor,
      child: Pinput(
        length: _length,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: size.height * _focusScaleFactor,
          width: size.width * _focusScaleFactor,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        onCompleted: widget.onSubmit,
        pinAnimationType: PinAnimationType.scale,
        // submittedFieldDecoration: _pinPutDecoration,
        // selectedFieldDecoration: _pinPutDecoration,
        // followingFieldDecoration: _pinPutDecoration,
        // textStyle: const TextStyle(
        //   color: Colors.black,
        //   fontSize: 20.0,
        //   fontWeight: FontWeight.w600,
        // ),
      ),
    );
  }
}