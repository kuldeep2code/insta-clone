import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/instagram.svg",
          colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          height: 32,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.facebookMessenger))
        ],
      ),
      body: const PostCard(),
    );
  }
}
