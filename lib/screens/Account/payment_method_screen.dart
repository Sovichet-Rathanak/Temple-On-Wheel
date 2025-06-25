import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/AccountComponents/SettingBaseAppbar.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:temple_on_wheel/constants/theme.dart';


//TODO: FUNCTION TO SAVE CARD INFO AND ADD ADDITIONAL CARD
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      isCvvFocused = data.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 35;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SettingBaseAppBar(title: "Payment", appBar: AppBar()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Payment Methods",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Payment Details",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),

          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            enableFloatingCard: true,
            floatingConfig: FloatingConfig(
              isGlareEnabled: false,
              isShadowEnabled: true,
              shadowConfig: FloatingShadowConfig(),
            ),
            cvvCode: cvvCode,
            bankName: "Virtual Card",
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
            backgroundImage: 'assets/images/card_pattern.jpg',
            frontCardBorder: Border.all(color: Colors.blue, width: 1.0),
            backCardBorder: Border.all(color: Colors.blue, width: 1.0),
            isHolderNameVisible: true,
            chipColor: const Color(0xFFFFCA4B),
          ),

          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Billing Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/visa.png",
                          width: iconSize,
                          height: iconSize,
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          "assets/images/mastercard.png",
                          width: iconSize,
                          height: iconSize,
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          "assets/images/union-pay.png",
                          width: iconSize,
                          height: iconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                CreditCardForm(
                  formKey: formKey,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onModelChange,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cvvValidationMessage: 'Please input a valid CVV',
                  dateValidationMessage: 'Please input a valid date',
                  numberValidationMessage: 'Please input a valid number',
                  isCardHolderNameUpperCase: true,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    cardNumberTextStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    cardHolderTextStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    expiryDateTextStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    cvvCodeTextStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      print("Saved Card Info");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kMainThemeColor,
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kSecondaryThemeColor,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
