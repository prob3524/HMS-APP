import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/globals.dart';
import '../../widgets/text.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({super.key});

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {

  var h , w;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
    child: Scaffold(

      backgroundColor: kHomeBG,
      appBar: PreferredSize(
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: w,
                height: h * 0.1,
                decoration: BoxDecoration(color: kDarkBlue3, boxShadow: [
                  BoxShadow(color: kBlack, blurRadius: 20, spreadRadius: -17)
                ]),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20),
                      child: InkWell(onTap: () {
                        Navigator.pop(context);
                      },child: FaIcon(FontAwesomeIcons.arrowLeft,color: kWhite,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: textWidget(
                          msg: "Privacy & Policies",
                          txtColor: kWhite,
                          txtFontWeight: FontWeight.w600,
                          txtFontSize: h * 0.025),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size(w, h * 0.065),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: h * 0.02,),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                Flexible(
                  child:
                  Text('''APL Payment, Returns and Refund Policy

This Payment, Returns and Refund Policy sets out the terms and conditions on the basis of which we, Apollo Pharmacies Limited (collectively, `APL`, `Apollo`, `Company`, `we,` `us,` or `our`), will process payments and refunds for transactions carried on through your use of the mobile application or the website(collectively referred to as the `APL Platform`) while availing services (detailed in the Terms and Conditions available at) made available to you the APL Platform (the `Services`).

1.  Payment

You may use any payment service: UPI, internet banking or debit or credit cards for making payments for availing any of the Services over the APL Platform for purchase of any products listed for sale on the APL Platform ("Fees"). You shall be directed to our payment aggregation partners (“Payment Aggregator”) once you proceed to make payment of the Fees. Once re-directed to the Payment Aggregator, you agree to be bound by the terms and conditions and privacy policy prescribed by the Payment Aggregator, basis which, the transaction shall take place. We will share your details with the Payment Aggregator as mentioned in our privacy policy and the same shall be processed in accordance with Payment Aggregator’s privacy policy.

AHEL shall not be liable in any manner whatsoever, if incorrect or inaccurate details (including those concerning credit or debit card(s)) are provided by you for making the payment of the Fees or if you use a credit or debit card which is not lawfully owned by you or if you permit a third party to use your password or other means to access your bank account or credit card or debit card. Please note that neither you nor our Payment Aggregator will be monitoring your use of any payment channel and you are required to use the payment modes at your sole option and risk.

Our Payment Aggregator may block any card number, account numbers, group of cards or transactions from any specific blocked or blacklisted customer cards, accounts, group of IP addresses, devices, geographic locations as deemed fit.

Our Payment Aggregator and banks reserve the right to reject payments with respect for any order including for suspicious and unlawful transactions, potential or actual fraud, suspicious activities, card authentication and authorization issues, over payment made due to mathematical errors or any other issue.

AHEL shall keep the financial information as referred to in the APL Privacy Policy (Privacy Policy) confidential at all times and shall not utilize and share the same with any of the third parties unless it is a third party website consented to by you and / or required by law, regulation or court order.

AHEL shall not be liable for the rejection of any authorization request placed by you for payment of the Fees, by any bank, payment gateway or payment aggregator or other relevant third party, for any reason including but not limited to risk management, suspicion of fraudulent, illegal or doubtful transactions, use of blacklisted/banned cards or pursuant to applicable laws, rules or regulations or any instructions from (or contained in) any guidelines or instructions by the Reserve Bank of India or any internal policies, etc., of such bank, payment gateway or other relevant third party.

2.  Specific Payment Mode

Please note that whenever you choose to utilize any mode of payment, you must fulfil the terms and conditions, as applicable to that mode of payment.

Specifically for QR code payment, you note that:

QR Code is provided by our Payment Aggregator.

You can make payments through UPI or a valid card by scanning the QR Code correctly through any of the payment apps available with you and entering the correct amount.

Your data will be processed in accordance with the relevant payment aggregation partner’s relevant privacy policy and terms, which you should comply with, as applicable.

Return of Products and Cancellation of orders

We strive to deliver correct medicines/items in the right/undamaged condition every time the customer places an order. We strongly recommend that you check the condition of the delivered products at the time of delivery and get back to us if there are any discrepancy.

If your order is eligible for a return, you can raise a return request within 48 hours from the time of delivery. All returns are reviewed for eligibility and refund is subject to review and verification by APL team. No return of damaged products is possible once part or whole of the product has been used.

To raise the return request and return an item, you can call our help desk at 18605000101 (24*7 customer support), email us at customercare@apollopharmacy.org, or contact our customer support executives through online live chat.

Items are eligible for a return exclusively under the following circumstances.

Products are delayed beyond 48 hours of the estimated date of delivery communicated to the customer at the time of placement of the order.

Product(s) delivered do not match the order: This would include items that are different from what the customer ordered.

Product(s) were delivered in damaged/non-working condition.

Product(s) have missing parts or accessories or different from their description on the product page.

Product(s) are returned in original packaging i.e. with labels, barcode, price tags, original serial no. etc.

Batch number of the product(s) being returned matches with the one(s) mentioned in the invoice.

Product(s)/medicines(s)/bottle(s) are unused. Opened medicine strip(s)/bottle(s) are not eligible for returns.

The damages/defects are covered under the manufacturer’s warranty.

Note:Replacement of product(s)/order is not supported as of now. For such cases, you will need to return the items and refund will be issued post verification. No return is possible for damaged goods beyond 48 hours of delivery.

Certain categories of products are not eligible for return

3.  Categories

Type of products

Temperature controlled medicines

Vials, Injections, Pen-fills, Vaccines or other products or specialty medicines cold storage

Baby Care

Breast Pumps, Diapers, Ear Syringes, Wipe Warmers, Bottle Nipples

Food and Nutrition

Health supplements and drink

Healthcare device

Glucometer Lancet, Healthcare Devices, Surgical,Health Monitors

Sexual Wellness

Condoms, Fertility Kit, Lubricants, Pregnancy Kit

4.  Personal Care

Oral Care (Toothbrushes, toothpastes, mouthwashes etc); Feminine Hygiene (Sanitary Pads, Panty Liners, Menstrual Cups etc.); Shaving and Hair Removal (Men’s Shaving – Razors, Blades, Shaving Foams, Brushes etc.; Men’s Beard Care – Beard Oil, Beard Serum etc.; Women’s Hair Removal – Wax Strips, Creams, Razors etc

Family Nutrition

Infant Baby Food, Toddlers’ and Kids’ Health Drink

Vitamin and Mineral Supplements

Core Letter Vitamins, Multi-Vitamin

Health Care Product

Ayurveda Products, Pain Relief Products, Herbal Supplements, Medical Supplies, Adult Diapers, COVID masks (N95, surgical masks and others if unpacked)

5.  Others

Any wearable (COPD vest, bandages, bandage, knee caps) and any item (solid, gel, aerosol) which may have been partially used

In case these items are received as damaged, you are requested to contact the customer care and a refund would be issued post verification. We might ask for pictures/video for verification purpose.

You may cancel an order for products placed by you prior to shipping for delivery or request returns for products ordered by you in accordance with the process described above. In each case, you may issue a refund request through the APL platform in as provided in the ‘Refunds’ section below.

6.  Cancellations by APL

There may be certain orders that we are unable to accept and must cancel. We reserve the right, at our sole discretion, to refuse or cancel any order for any reason.

Some situations that may result in your order being cancelled include

limitations on quantities available for purchase

inaccuracies or errors in product or pricing information

problems identified by our credit and fraud avoidance department

We may also require additional verifications or information before accepting any order. We will contact you if all or any portion of your order is cancelled or if additional information is required to accept your order. If your order is cancelled after your account has been charged, the said amount will be reversed back in your account as provided in the ‘Refunds’ section below.

Cancellations by the customer

In case we receive a cancellation notice and the order has not been shipped by us, we shall cancel the order and refund the entire amount as provided in the ‘Refunds’ section below.

The orders that have already been shipped out by us will not be cancelled in accordance with this policy. The customer agrees not to dispute the decision made by APL and accept APL’s decision regarding the cancellation.

7.  Refunds

Refunds for all eligible returns or cancellations are issued through the payment method used at the time of purchase, except for cash payments made under the Pay on Delivery mode of payment.

You will not receive cash refunds in connection with a card sale.

Refunds cannot be processed to third-party accounts. The name on your APL account should match with the name of the bank account holder.

Refunds will only be made against genuine and trackable cancellation or return requests generated by you by clicking on the cancellation button provided in the App’s user dashboard in your APL account. Refund request against delays, nature of advice obtained, efficacy of treatment, health outcomes of consultation will not be entertained.

No refund request in relation to cancelled or returned orders will be processed if raised by the customer beyond a period of 6 months from the date of cancellation or date of return, except in specific situations to be determined at the sole discretion of APL.

Refunds may be processed within 15 working days from the receipt of a request from you. All communications with regards to refund should be sent to onlinehelpdesk@apollopharmacy.org.

AHEL reserves the right to modify / implement a new pricing structure at any time prior to billing you for your initial payment of the Fees or for future payments of the Fees.

8.  Refund Timelines

The time frame for different payment modes is typically 5-7 business days post the return has been received and verified by APL.

Refund timelines depend on bank turnaround times and RBI guidelines. This may change from time to time. Business days shall mean the working days on which APL corporate office operates. Considering limited manpower at banks due to COVID-19, refund timelines might vary.

For orders placed using Pay on Delivery as the payment method, refunds can be processed to your bank account via National Electronic Funds Transfer (NEFT), or you may receive an equivalent amount of `health credits` which enable you to purchase further goods and services from APL. There will be no cash refund.

To receive refunds in NEFT form, you will need to update the following information to enable us to process a refund to your account

The Bank Account Number

IFSC Code

Account Holder's Name

APL will not be liable for any delay caused in refunds due to delay by third party affiliates (including banks), in providing information by the customer, technical issues and other reasons beyond its control''',
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: kDarkBlue3,
                            fontWeight: FontWeight.w500,
                            fontSize: h * 0.018
                        )
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.03,
                ),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
