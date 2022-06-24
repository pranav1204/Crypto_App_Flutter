import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:toast/toast.dart';

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {

  late Razorpay razorpay;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_qQqeXuqmlzB5tg",
      "amount" : num.parse(textEditingController.text)*100,
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);

    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }

  void handlerPaymentSuccess(){
    Toast.show("Payment success", textStyle: context);
  }

  void handlerErrorFailure(){
    Toast.show("Payment error", textStyle: context);
  }

  void handlerExternalWallet(){
    Toast.show("External Wallet", textStyle: context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: themeData.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: themeData.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 15.w,
        title: Image.asset(
          themeData.brightness == Brightness.light
              ? 'assets/sobGOGdark.png'
              : 'assets/sobGOGlight.png',
          height: 3.5.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  hintText: "Add   Amount"
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    openCheckout();
                  },
                  splashColor:
                  themeData.secondaryHeaderColor.withOpacity(0.5),
                  highlightColor:
                  themeData.secondaryHeaderColor.withOpacity(0.8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.primaryColor.withOpacity(0.05),
                      border: Border.all(
                        color: themeData.secondaryHeaderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 33.w,
                    height: 7.h,
                    child: Center(
                      child: Text(
                        'Withdraw',
                        style: GoogleFonts.lato(
                          color: themeData.primaryColor.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    openCheckout();
                  },
                  splashColor:
                  themeData.secondaryHeaderColor.withOpacity(0.5),
                  highlightColor:
                  themeData.secondaryHeaderColor.withOpacity(0.8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.primaryColor.withOpacity(0.05),
                      border: Border.all(
                        color: themeData.secondaryHeaderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 33.w,
                    height: 7.h,
                    child: Center(
                      child: Text(
                        'Deposit',
                        style: GoogleFonts.lato(
                          color: themeData.primaryColor.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          letterSpacing: 1,
                        ),
                      ),
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