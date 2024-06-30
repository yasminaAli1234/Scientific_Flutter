import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
class ContactUss extends StatelessWidget {
  const ContactUss({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Computer Science',
        textColor: Colors.white,
        backgroundColor: Colors.teal.shade300,
        email: 'ya5290535@gmail.com',
        // textFont: 'Sail',
      ),
      backgroundColor: Colors.teal,
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.teal.shade900,
        logo: const AssetImage('assets/image/hacker.png'),
        email: 'ya5290535@gmail.com',
        companyName: 'Computer Science',
        companyColor: Colors.teal.shade100,
        dividerThickness: 2,
        phoneNumber: '+20 01210995689',
        website: 'https://abhishekdoshi.godaddysites.com',
        githubUserName: 'yasminaAli1234',
        linkedinURL: 'https://www.linkedin.com/in/yasmine-ali-1b4247311?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app ',
        tagLine: 'Hacker Rank',
        taglineColor: Colors.teal.shade100,
        twitterHandle: 'AbhishekDoshi26',
        instagram: '_abhishek_doshi',
        facebookHandle: 'YaSmine Ali',
      ),
    );

  }
}

