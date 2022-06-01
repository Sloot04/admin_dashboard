import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: (size.width > 1000) ? size.height * 0.075 : null,
        color: Colors.black,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            // ignore: avoid_print
            LinkText(text: 'About', onPressed: () => print('About')),
            const LinkText(text: 'Help Center'),
            const LinkText(text: 'Terms of Service'),
            const LinkText(text: 'Privacy Policy'),
            const LinkText(text: 'Cookie Policy'),
            const LinkText(text: 'Ads info'),
            const LinkText(text: 'Blog'),
            const LinkText(text: 'Status'),
            const LinkText(text: 'Careers'),
            const LinkText(text: 'Brand Resources'),
            const LinkText(text: 'Adverting'),
            const LinkText(text: 'Marketing'),
          ],
        ));
  }
}
