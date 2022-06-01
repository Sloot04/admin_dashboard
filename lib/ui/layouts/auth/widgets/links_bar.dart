import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.05,
        color: Colors.black,
        child: Wrap(
          children: const [
            LinkText(text: 'About'),
            LinkText(text: 'Help Center'),
            LinkText(text: 'Terms of Service'),
            LinkText(text: 'Privacy Policy'),
            LinkText(text: 'Cookie Policy'),
            LinkText(text: 'Ads info'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Status'),
            LinkText(text: 'Careers'),
            LinkText(text: 'Brand Resources'),
            LinkText(text: 'Adverting'),
            LinkText(text: 'Marketing'),
          ],
        ));
  }
}
