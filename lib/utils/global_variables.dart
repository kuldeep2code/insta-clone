import "package:flutter/material.dart";
import "package:insta_clone/screens/add_post_screen.dart";
import "package:insta_clone/screens/feed_screen.dart";

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text("Search"),
  AddPost(),
  Text("notification"),
  Text("Profile"),
];
