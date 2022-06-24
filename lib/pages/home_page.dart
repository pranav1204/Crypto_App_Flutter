import 'dart:convert';

import 'package:crypto_app_flutter/model/CryptoModel.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/actions/actions_widget.dart';
import '../widgets/balance_panel/balance_panel.dart';
import '../widgets/chart/chart_home_page.dart';
import 'package:http/http.dart' as http;

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  var last1hour = 0;
  var last1day = 1;
  var last1week = 2;
  var last1month = 3;
  var last1year = 4;

  bool iconBool = false;
  IconData iconLight = Icons.wb_sunny;
  IconData iconDark = Icons.nights_stay;
  double balance = 66032206.10;
  double profit = 35.22;
  double profitPercent = 0.22;
  bool loading = true;
  var cryptoModel = CryptoModel();

  @override
  void initState() {
    // TODO: implement initState
    fetchCryptoList();

    super.initState();
  }
  // get request

  Future<void> fetchCryptoList() async {
    var url = "https://data.messari.io/api/v2/assets?fields=id,slug,symbol,name,metrics/market_data&limit=500";
    var response = await http.get(Uri.parse(url));
    var decodeResponse =jsonDecode(response.body);
    cryptoModel = CryptoModel.fromJson(decodeResponse);
    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                balancePanel(balance, profit, profitPercent, themeData),
                actionsWidget(themeData),
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  child: cryptoListView(themeData),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget cryptoListView(var themeData)
  {
    if (cryptoModel.data != null)
      {
        return loading
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(

                  itemCount: cryptoModel.data?.length,
                  itemBuilder: (context,index){
                    return chartHomePage(
                        true,
                        CryptoFontIcons.ETH,
                        cryptoModel.data![index].name.toString(),
                        cryptoModel.data![index].symbol.toString(),
                        'USD',
                         [
                          FlSpot(0, cryptoModel.data![index].metrics!.marketData!.ohlcvLast1Hour!.open),
                          FlSpot(2, cryptoModel.data![index].metrics!.marketData!.ohlcvLast1Hour!.high),
                          FlSpot(4, cryptoModel.data![index].metrics!.marketData!.ohlcvLast1Hour!.low),
                           FlSpot(5, cryptoModel.data![index].metrics!.marketData!.ohlcvLast1Hour!.close),
                          FlSpot(6, cryptoModel.data![index].metrics!.marketData!.priceUsd),
                        ],
                        themeData
                    );
                  },

                ),
              ),
            )
          ],
        );
      }
    else {
      return SizedBox.shrink();
    }
  }
}