import 'package:crypto_app_flutter/login_activity/screen.dart';
import 'package:crypto_app_flutter/widgets/actions/actions_widget.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/balance_panel/balance_panel.dart';
import '../widgets/chart/chart_home_page.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool iconBool = false;
  IconData iconLight = Icons.wb_sunny;
  IconData iconDark = Icons.nights_stay;
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          actions: [
            IconButton(
                onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (builder) => HomePage())),
                icon: Icon(Icons.logout),color: themeData.primaryColor,)
          ],
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: themeData.backgroundColor,
          leading: SizedBox(
            height: 10.w,
            width: 15.w,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView(
            children: [
              balancePanel(balance, profit, profitPercent, themeData),
              actionsWidget(themeData,context),
              chartHomePage(
                true,
                CryptoFontIcons.ETH,
                'Ethereum',
                'ETH',
                'USD',
                const [
                  FlSpot(0, 2550.18),
                  FlSpot(1, 2500.34),
                  FlSpot(2, 2541.34),
                  FlSpot(3, 2540.59),
                  FlSpot(4, 2550.60),
                  FlSpot(5, 2639.80),
                  FlSpot(6, 2523.71),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.BTC,
                'Bitcoin',
                'BTC',
                'USD',
                const [
                  FlSpot(0, 40005.71),
                  FlSpot(1, 40875.23),
                  FlSpot(2, 40800.59),
                  FlSpot(3, 40875.12),
                  FlSpot(4, 41875.72),
                  FlSpot(5, 40375.49),
                  FlSpot(6, 40700.58),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.DOGE,
                'Dogecoin',
                'DOGE',
                'PLN',
                const [
                  FlSpot(0, 0.22),
                  FlSpot(1, 0.24),
                  FlSpot(2, 0.28),
                  FlSpot(3, 0.30),
                  FlSpot(4, 0.35),
                  FlSpot(5, 0.52),
                  FlSpot(6, 0.58),
                ],
                themeData,
              ),
              chartHomePage(
                true,
                CryptoFontIcons.LTC,
                'Litecoin',
                'LTC',
                'USD',
                const [
                  FlSpot(0, 100.40),
                  FlSpot(1, 102.34),
                  FlSpot(2, 98.23),
                  FlSpot(3, 100.23),
                  FlSpot(4, 102.10),
                  FlSpot(5, 103.85),
                  FlSpot(6, 103.20),
                ],
                themeData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}