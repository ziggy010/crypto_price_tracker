import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './utilities/constants.dart';
import './utilities/reusable_card.dart';
import './utilities/coin_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating variables;

  String selectedCurrencyPair = 'usd';

  CoinData coinData = CoinData();

  String finalPriceOfBtc = '?';
  String finalPriceOfEth = '?';
  String finalPriceOfDot = '?';

  void getFinalPriceOfBtc() async {
    String finalBtcPrice = await coinData.getPriceOfBtc(selectedCurrencyPair);
    String finalEthPrice = await coinData.getPriceOfEth(selectedCurrencyPair);
    String finalDotPrice = await coinData.getPriceOfDot(selectedCurrencyPair);
    setState(() {
      finalPriceOfBtc = finalBtcPrice;
      finalPriceOfEth = finalEthPrice;
      finalPriceOfDot = finalDotPrice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFinalPriceOfBtc();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getCurrencyWidget() {
      List<Widget> currencyTextWidget = [];
      for (String currency in currencyList) {
        currencyTextWidget.add(
          Text(
            currency.toUpperCase(),
            style: kPickerTextStyle,
          ),
        );
      }

      return currencyTextWidget;
    }

    return Scaffold(
      // to make neumorphism effect
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Crypto Prices',
          style: kHeadingTextStyle,
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Creating big container for other cards

          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableCard(
                    specificImage: 'bitcoin',
                    coinName: 'Bitcoin',
                    symbol: 'BTC',
                    showPriceOfBtc: finalPriceOfBtc,
                    currencyPair: selectedCurrencyPair,
                  ),
                  ReusableCard(
                    specificImage: 'ethereum',
                    coinName: 'Ethereum',
                    symbol: 'ETH',
                    showPriceOfEth: finalPriceOfEth,
                    currencyPair: selectedCurrencyPair,
                  ),
                  ReusableCard(
                    specificImage: 'polkadot',
                    coinName: 'Polkadot',
                    symbol: 'DOT',
                    showPriceOfDot: finalPriceOfDot,
                    currencyPair: selectedCurrencyPair,
                  ),
                  Container(
                    color: kBackgroundColor,
                    height: 90,
                    child: CupertinoPicker(
                      itemExtent: 30.0,
                      onSelectedItemChanged: (selectedIndex) {
                        setState(() {
                          selectedCurrencyPair = currencyList[selectedIndex];
                          getFinalPriceOfBtc();
                        });
                      },
                      children: getCurrencyWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
