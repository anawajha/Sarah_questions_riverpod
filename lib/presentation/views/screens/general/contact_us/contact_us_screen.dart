import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/screens/general/contact_us/widgets/contact_us_header.dart';
import 'package:sarahah_questions/presentation/views/screens/general/contact_us/widgets/formal_contact_list.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(TransManager.contactUs.tr)),
        body: ListView(
              padding: 24.padding,
              children: const [
                ContactUsHeader(),
                FormalContacts(),
              ]));
  }
}
