import 'package:crypto_price/homepage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'coin_data.dart';

class ReusableCard extends StatefulWidget {
  final String specificImage;
  final String coinName;
  final String symbol;
  final String currencyPair;
  String showPriceOfBtc;
  String showPriceOfEth;
  String showPriceOfDot;

  ReusableCard({
    required this.specificImage,
    required this.coinName,
    required this.symbol,
    required this.currencyPair,
    this.showPriceOfBtc = '',
    this.showPriceOfEth = '',
    this.showPriceOfDot = '',
  });

  String getSpecificPrice() {
    if (coinName == 'Bitcoin') {
      return showPriceOfBtc;
    } else if (coinName == 'Ethereum') {
      return showPriceOfEth;
    } else {
      return showPriceOfDot;
    }
  }

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //icons or logo
                  Image.asset(
                    'lib/icons/${widget.specificImage}.png',
                    height: 60,
                    color: Colors.grey.shade300,
                  ),
                  //name of coin
                  Column(
                    children: [
                      Text(
                        widget.coinName,
                        style: kNameTextStyle,
                      ),
                      //Symbol of coin
                      Text(
                        widget.symbol,
                        style: kSymbolTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Price of coin
                  Text(
                    widget.getSpecificPrice(),
                    style: kPriceTextStyle,
                  ),
                  // Currency pair
                  Text(
                    widget.currencyPair.toUpperCase(),
                    style: kSymbolTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
        height: 160,
        width: 300,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            // dark shadow
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            //bright shadow
            BoxShadow(
              color: Colors.grey.shade800,
              offset: Offset(-3, -3),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
