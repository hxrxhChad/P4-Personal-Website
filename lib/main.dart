// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unused_local_variable, avoid_print, unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_cast

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/model/basic_data.dart';
import 'package:website/model/experience.dart';
import 'package:website/model/message.dart';
import 'package:website/model/project.dart';
import 'package:website/model/skill.dart';
import 'package:website/model/social_handle.dart';
import 'package:website/widget.dart';

const primaryColor = Color(0xff7169e2);
const darkC = Color(0xff191919);

// white-colors

late Size pad;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCubk2_uE3kWCcFBlQ_as1JfMh1tTk3KZs",
            authDomain: "portfolio-173c9.firebaseapp.com",
            projectId: "portfolio-173c9",
            storageBucket: "portfolio-173c9.appspot.com",
            messagingSenderId: "714174728784",
            appId: "1:714174728784:web:51b3f88e0d584066271f55",
            measurementId: "G-T8ZQEFB68Z"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            ),
      ),
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final projectKey = GlobalKey();
  final basicKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillKey = GlobalKey();
  final socialKey = GlobalKey();
  final _projectKey = GlobalKey();
  final _basicKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _skillKey = GlobalKey();
  final _socialKey = GlobalKey();
  //
  Future scrollToProject() async {
    final context = projectKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToExperience() async {
    final context = experienceKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToSkill() async {
    final context = skillKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToSocial() async {
    final context = socialKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToProjectMobile() async {
    final context = _projectKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToExperienceMobile() async {
    final context = _experienceKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToSkillMobile() async {
    final context = _skillKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  Future scrollToSocialMobile() async {
    final context = _socialKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  //
  bool _isMobile = false;
  int _project = 0;
  int _experience = 0;
  bool _message = false;
  final CollectionReference _basicDataReference =
      FirebaseFirestore.instance.collection('basic-data');
  final CollectionReference _projectReference =
      FirebaseFirestore.instance.collection('project');
  final CollectionReference _skillReference =
      FirebaseFirestore.instance.collection('skill');
  final CollectionReference _socialReference =
      FirebaseFirestore.instance.collection('social-handle');
  final CollectionReference _experienceReference =
      FirebaseFirestore.instance.collection('experience');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final CollectionReference _messageReference =
      FirebaseFirestore.instance.collection('message');
  @override
  Widget build(BuildContext context) {
    pad = MediaQuery.of(context).size;
    _isMobile = pad.width > 800 ? false : true;
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.subtitle2!,
          child: _isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // basic-data-section
                    StreamBuilder<QuerySnapshot>(
                        key: _basicKey,
                        stream: _basicDataReference.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.hasData) {
                            QuerySnapshot querySnapshot = snapshot.data!;
                            List<QueryDocumentSnapshot> documents =
                                querySnapshot.docs;
                            List<Basic> basic = documents
                                .map((e) => Basic(
                                    image: e['image'],
                                    name: e['name'],
                                    age: e['age'],
                                    city: e['city'],
                                    state: e['state'],
                                    slogan: e['slogan'],
                                    bio: e['bio']))
                                .toList();
                            return Stack(
                              key: basicKey,
                              children: [
                                Container(
                                    height: pad.height,
                                    width: pad.width,
                                    decoration: BoxDecoration(color: darkC),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: pad.width * 0.2,
                                                vertical: pad.width * 0.09),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    scrollToProjectMobile();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      pad.width *
                                                                          0.03)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    pad.width *
                                                                        0.01,
                                                                horizontal:
                                                                    pad.width *
                                                                        0.02),
                                                        child: Text('works'),
                                                      )),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    scrollToExperienceMobile();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      pad.width *
                                                                          0.03)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    pad.width *
                                                                        0.01,
                                                                horizontal:
                                                                    pad.width *
                                                                        0.02),
                                                        child:
                                                            Text('experience'),
                                                      )),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    scrollToSocialMobile();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          // border: Border.all(
                                                          //     color: Colors.white),
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      pad.width *
                                                                          0.03)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    pad.width *
                                                                        0.01,
                                                                horizontal:
                                                                    pad.width *
                                                                        0.02),
                                                        child: Text('Contact'),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          )),
                                          Material(
                                            shadowColor: Colors.white10,
                                            elevation: 5,
                                            shape: CircleBorder(),
                                            child: Container(
                                              height: pad.width * 0.3,
                                              width: pad.width * 0.3,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          basic[0].image),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          SizedBox(height: pad.width * 0.03),
                                          Text(basic[0].name,
                                              style: TextStyle(
                                                  fontSize: pad.width * 0.04,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Age'${basic[0].age} , ${basic[0].city}, ${basic[0].state}",
                                              style: TextStyle(
                                                  color: Colors.white30)),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: pad.width * 0.1,
                                                vertical: pad.width * 0.03),
                                            child: Text(basic[0].bio,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: pad.width * 0.03,
                                                    color: primaryColor
                                                        .withOpacity(0.8))),
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: pad.width * 0.2,
                                                vertical: pad.width * 0.09),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Explore my projects',
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    scrollToProjectMobile();
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white24,
                                                    radius: pad.width * 0.03,
                                                    child: Icon(
                                                      AntIcons.downOutlined,
                                                      color: Colors.white,
                                                      size: pad.width * 0.03,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                        ])),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation(270 / 360),
                                    child: Text(
                                      basic[0].slogan,
                                      style: TextStyle(
                                          fontSize: pad.width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.white.withOpacity(0.04)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation(90 / 360),
                                    child: Text(
                                      basic[0].slogan,
                                      style: TextStyle(
                                          fontSize: pad.width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.white.withOpacity(0.04)),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: -pad.width * 0.3,
                                    left: -pad.width * 0.4,
                                    child: CircleAvatar(
                                      radius: pad.width * 0.3,
                                      backgroundColor:
                                          primaryColor.withOpacity(0.3),
                                    )),
                                Positioned(
                                    bottom: -pad.width * 0.7,
                                    child: CircleAvatar(
                                      radius: pad.width * 0.5,
                                      backgroundColor:
                                          primaryColor.withOpacity(0.006),
                                    )),
                              ],
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                    // project-section
                    Container(
                      key: _projectKey,
                      height: pad.height,
                      width: pad.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: pad.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: pad.width * 0.1),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('PROJECT SECTION',
                                          style:
                                              TextStyle(color: primaryColor)),
                                      Text('Works &\nProjects',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: pad.width * 0.05,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Check out my projects',
                                          style: TextStyle(
                                              color: darkC.withOpacity(0.5))),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: pad.width * 0.02),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor)),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                pad.width * 0.02),
                                            child: Center(
                                              child: Text(
                                                'GitHub',
                                                style: TextStyle(
                                                    color: primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                                key: projectKey,
                                stream: _projectReference.snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Something went wrong');
                                  }
                                  if (snapshot.hasData) {
                                    QuerySnapshot querySnapshot =
                                        snapshot.data!;
                                    List<QueryDocumentSnapshot> documents =
                                        querySnapshot.docs;
                                    List<Project> project = documents
                                        .map((e) => Project(
                                            id: e['id'],
                                            projectName: e['projectName'],
                                            projectDesc: e['projectDesc'],
                                            projectImage: e['projectImage']))
                                        .toList();
                                    return _getProjectMobile(project);
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: pad.width * 0.1),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Container(
                            //         height: pad.width * 0.5,
                            //         width: pad.width * 0.8,
                            //         decoration:
                            //             BoxDecoration(color: primaryColor),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: pad.width * 0.03),
                            //         child: Text('yorPortfolio',
                            //             style: TextStyle(
                            //                 color: darkC,
                            //                 fontWeight: FontWeight.bold)),
                            //       ),
                            //       Text(
                            //         'yoyyoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
                            //         style: TextStyle(
                            //             color: darkC.withOpacity(0.5),
                            //             fontSize: pad.width * 0.025),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: pad.width * 0.1),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Explore my experiece',
                                    style: TextStyle(color: darkC),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      scrollToExperienceMobile();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: pad.width * 0.03,
                                      child: Icon(
                                        AntIcons.downOutlined,
                                        color: Colors.white,
                                        size: pad.width * 0.03,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // experience-section
                    Container(
                        key: _experienceKey,
                        height: pad.height,
                        width: pad.width,
                        decoration: BoxDecoration(color: darkC),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: pad.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('EXPERIENCE SECTION',
                                        style: TextStyle(color: primaryColor)),
                                    Text('Experiences',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: pad.width * 0.05,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: _experienceReference.snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }
                                    if (snapshot.hasData) {
                                      QuerySnapshot querySnapshot =
                                          snapshot.data!;
                                      List<QueryDocumentSnapshot> documents =
                                          querySnapshot.docs;
                                      List<Experience> experience = documents
                                          .map((e) => Experience(
                                              id: e['id'],
                                              experienceName:
                                                  e['experienceName'],
                                              experienceDetail:
                                                  e['experienceDetail'],
                                              experienceTime:
                                                  e['experienceTime'],
                                              experienceImage:
                                                  e['experienceImage']))
                                          .toList();
                                      return _getExperienceMobile(experience);
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: pad.width * 0.1),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Row(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           CircleAvatar(
                              //             radius: pad.width * 0.1,
                              //             backgroundColor: Colors.white,
                              //           ),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.end,
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.start,
                              //             children: [
                              //               Text(
                              //                 'Google',
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: pad.width * 0.1),
                              //               ),
                              //               Text(
                              //                 '2018-2020',
                              //                 style: TextStyle(
                              //                     color: Colors.white24),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //       Padding(
                              //         padding: EdgeInsets.symmetric(
                              //             vertical: pad.width * 0.05),
                              //         child: Text(
                              //           'jfEH<bgcd,wub2x3rxzlfg4fg9gf34mf849fg8y8wyhiakckan,zxzxkadwietfilncxnckasnfiweyfann',
                              //           style: TextStyle(color: Colors.white54),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Explore my skills',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        scrollToSkillMobile();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white24,
                                        radius: pad.width * 0.03,
                                        child: Icon(
                                          AntIcons.downOutlined,
                                          color: Colors.white,
                                          size: pad.width * 0.03,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    // skill-section
                    Container(
                        key: _skillKey,
                        height: pad.height,
                        width: pad.width,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: pad.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('SKILL SECTION',
                                        style: TextStyle(color: primaryColor)),
                                    Text('Skill & Knowledge',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: pad.width * 0.05,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1,
                                    vertical: pad.width * 0.01),
                                child: Image.asset(
                                  'assets/image.jpg',
                                  height: pad.width * 0.5,
                                  width: pad.width * 0.8,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1),
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: _skillReference.snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Text('Something went wrong');
                                      }
                                      if (snapshot.hasData) {
                                        QuerySnapshot querySnapshot =
                                            snapshot.data!;
                                        List<QueryDocumentSnapshot> documents =
                                            querySnapshot.docs;
                                        List<Skill> skill = documents
                                            .map((e) => Skill(
                                                id: e['id'], skill: e['skill']))
                                            .toList();
                                        return _getSkillMobile(skill);
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: pad.width * 0.1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Contact me',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        scrollToSocialMobile();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: primaryColor,
                                        radius: pad.width * 0.03,
                                        child: Icon(
                                          AntIcons.downOutlined,
                                          color: Colors.white,
                                          size: pad.width * 0.03,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    // social-section
                    Stack(
                      key: _socialKey,
                      children: [
                        Container(
                          height: pad.height,
                          width: pad.width,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: pad.width * 0.1,
                                vertical: pad.width * 0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Collaboration',
                                  style: TextStyle(color: primaryColor),
                                ),
                                Text("Let's talk to\nCollaboration",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: pad.width * 0.1,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: pad.width * 0.02,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                      bottom: _message ? pad.width * 0.02 : 0,
                                    ),
                                    child: _message
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: pad.width * 0.2,
                                                child: TextFormField(
                                                  controller: _nameController,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(color: darkC),
                                                  cursorColor: darkC,
                                                  decoration: InputDecoration(
                                                    labelText: 'Name',
                                                    labelStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                              color: darkC,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: pad.width * 0.03),
                                              SizedBox(
                                                width: pad.width * 0.2,
                                                child: TextFormField(
                                                  controller: _emailController,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(color: darkC),
                                                  cursorColor: darkC,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email-id',
                                                    labelStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                              color: darkC,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: pad.width * 0.03),
                                              SizedBox(
                                                width: pad.width * 0.2,
                                                child: TextFormField(
                                                  controller:
                                                      _messageController,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(color: darkC),
                                                  cursorColor: darkC,
                                                  decoration: InputDecoration(
                                                    labelText: 'Message',
                                                    labelStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                              color: darkC,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: darkC
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : null),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _message
                                      ? [
                                          GestureDetector(
                                            onTap: () {
                                              Message message = Message(
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  message:
                                                      _messageController.text);
                                              final messageRef =
                                                  FirebaseFirestore.instance
                                                      .collection('message')
                                                      .doc();
                                              message.id = messageRef.id;
                                              final data = message.toMap();
                                              messageRef.set(data).whenComplete(
                                                  () => print(
                                                      'Donee----------------'));

                                              //
                                              setState(() {
                                                _message = false;
                                              });
                                            },
                                            child: Container(
                                              height: pad.width * 0.1,
                                              width: pad.width * 0.2,
                                              decoration: BoxDecoration(
                                                  color: primaryColor),
                                              child: Center(
                                                  child: Text(
                                                'Send',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ]
                                      : [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _message = true;
                                              });
                                            },
                                            child: Container(
                                              height: pad.width * 0.1,
                                              width: pad.width * 0.2,
                                              decoration: BoxDecoration(
                                                  color: primaryColor),
                                              child: Center(
                                                  child: Text(
                                                'Get in Touch',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: pad.width * 0.02,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _message = true;
                                              });
                                            },
                                            child: Container(
                                              height: pad.width * 0.1,
                                              width: pad.width * 0.2,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black54)),
                                              child: Center(
                                                  child: Text(
                                                'Hire me',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ],
                                ),
                                SizedBox(
                                  height: pad.width * 0.04,
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: _socialReference.snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Text('Something went wrong');
                                      }
                                      if (snapshot.hasData) {
                                        QuerySnapshot querySnapshot =
                                            snapshot.data!;
                                        List<QueryDocumentSnapshot> documents =
                                            querySnapshot.docs;
                                        List<Social> social = documents
                                            .map((e) => Social(
                                                githubLink: e['githubLink'],
                                                gmailLink: e['gmailLink'],
                                                instagramLink:
                                                    e['instagramLink'],
                                                linkdinLink: e['linkdinLink']))
                                            .toList();
                                        return _getSocial(social);
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: -100,
                          top: -100,
                          child: CircleAvatar(
                            radius: pad.width * 0.2,
                            backgroundColor: primaryColor.withOpacity(0.5),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          bottom: 60,
                          child: CircleAvatar(
                            radius: pad.width * 0.06,
                            backgroundColor: primaryColor,
                          ),
                        ),
                        Positioned(
                          left: -10,
                          bottom: 80,
                          child: CircleAvatar(
                            radius: pad.width * 0.1,
                            backgroundColor: primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              //-------- Web-version-----------
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: _basicDataReference.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.hasData) {
                            QuerySnapshot querySnapshot = snapshot.data!;
                            List<QueryDocumentSnapshot> documents =
                                querySnapshot.docs;
                            List<Basic> basic = documents
                                .map((e) => Basic(
                                    image: e['image'],
                                    name: e['name'],
                                    age: e['age'],
                                    city: e['city'],
                                    state: e['state'],
                                    slogan: e['slogan'],
                                    bio: e['bio']))
                                .toList();
                            return Stack(
                              children: [
                                Container(
                                  height: pad.width * 0.5,
                                  width: pad.width,
                                  decoration: BoxDecoration(color: darkC),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: pad.width * 0.1,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text.rich(
                                                    TextSpan(children: [
                                                  TextSpan(
                                                      text: basic[0].name,
                                                      style: TextStyle(
                                                          fontSize: 30)),
                                                ])),
                                              ),
                                              Expanded(
                                                  child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () =>
                                                          scrollToProject(),
                                                      child: Text('works')),
                                                  SizedBox(
                                                      width: pad.width * 0.02),
                                                  GestureDetector(
                                                      onTap: () =>
                                                          scrollToExperience(),
                                                      child:
                                                          Text('experience')),
                                                  SizedBox(
                                                      width: pad.width * 0.02),
                                                  GestureDetector(
                                                      onTap: () =>
                                                          scrollToSkill(),
                                                      child: Text('skills')),
                                                  SizedBox(
                                                      width: pad.width * 0.03),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        scrollToSocial(),
                                                    child: Container(
                                                      height: pad.width * 0.05,
                                                      width: pad.width * 0.11,
                                                      decoration: BoxDecoration(
                                                        color: primaryColor,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Contact me',
                                                          style: TextStyle(
                                                              color: darkC,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: pad.width * 0.2,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Hi, you're welcome to ${basic[0].name}'s portfolio",
                                                      style: TextStyle(
                                                          color: primaryColor),
                                                    ),
                                                    Text(
                                                      basic[0].slogan,
                                                      style: TextStyle(
                                                          fontSize: 50),
                                                      maxLines: 3,
                                                    ),
                                                    Text(
                                                      basic[0].bio,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                    SizedBox(
                                                      height: pad.width * 0.01,
                                                    ),
                                                    Text(
                                                      "AGE' ${basic[0].age} | ${basic[0].city}, ${basic[0].state}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: pad.width * 0.4,
                                              // ),
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              pad.width * 0.3,
                                                          width:
                                                              pad.width * 0.2,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        Positioned(
                                                          right: 0,
                                                          top: 0,
                                                          bottom: 0,
                                                          child: Container(
                                                            height:
                                                                pad.width * 0.3,
                                                            width: pad.width *
                                                                0.11,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryColor,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        basic[0]
                                                                            .image),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            bottom: 60,
                                                            left: 40,
                                                            child: CircleAvatar(
                                                              radius: 60,
                                                              backgroundColor:
                                                                  primaryColor,
                                                              child: Center(
                                                                  child: Text(
                                                                'Thank You!',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )),
                                                            ))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: -100,
                                    left: -100,
                                    child: CircleAvatar(
                                      radius: 140,
                                      backgroundColor:
                                          primaryColor.withOpacity(0.2),
                                    )),
                                Positioned(
                                    bottom: 40,
                                    right: 200,
                                    child: Text("scroll for more ---")),
                                Positioned(
                                    bottom: -300,
                                    left: 300,
                                    child: CircleAvatar(
                                      radius: 240,
                                      backgroundColor:
                                          primaryColor.withOpacity(0.1),
                                    )),
                              ],
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                    Container(
                      width: pad.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: pad.width * 0.1,
                            vertical: pad.width * 0.04),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2022-2023',
                                  style: TextStyle(color: primaryColor),
                                ),
                                Text(
                                  'Works & \nProjects',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Check out my all works & \nprojects on GitHub Repositories',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  SizedBox(
                                    height: pad.width * 0.01,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      scrollToSocial();
                                    },
                                    child: Container(
                                      height: pad.width * 0.03,
                                      width: pad.width * 0.1,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Go to Github',
                                            style:
                                                TextStyle(color: primaryColor),
                                          ),
                                          Icon(
                                            AntIcons.rightOutlined,
                                            color: primaryColor,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    // project-section
                    StreamBuilder<QuerySnapshot>(
                        key: projectKey,
                        stream: _projectReference.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.hasData) {
                            QuerySnapshot querySnapshot = snapshot.data!;
                            List<QueryDocumentSnapshot> documents =
                                querySnapshot.docs;
                            List<Project> project = documents
                                .map((e) => Project(
                                    id: e['id'],
                                    projectName: e['projectName'],
                                    projectDesc: e['projectDesc'],
                                    projectImage: e['projectImage']))
                                .toList();
                            return _getProject(project);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),

                    // experience-section
                    Padding(
                      key: experienceKey,
                      padding: const EdgeInsets.all(0),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: _experienceReference.snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }
                            if (snapshot.hasData) {
                              QuerySnapshot querySnapshot = snapshot.data!;
                              List<QueryDocumentSnapshot> documents =
                                  querySnapshot.docs;
                              List<Experience> experience = documents
                                  .map((e) => Experience(
                                      id: e['id'],
                                      experienceName: e['experienceName'],
                                      experienceDetail: e['experienceDetail'],
                                      experienceTime: e['experienceTime'],
                                      experienceImage: e['experienceImage']))
                                  .toList();
                              return _getExperience(experience);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                      //
                    ),
                    // skill-section
                    Padding(
                      key: skillKey,
                      padding: EdgeInsets.symmetric(
                          horizontal: pad.width * 0.1,
                          vertical: pad.width * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: pad.width * 0.3,
                                child: Image.asset('assets/image.jpg'),
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skills',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  Text("Here are my skills.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 37,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: pad.width * 0.02,
                                  ),
                                  //----
                                  StreamBuilder<QuerySnapshot>(
                                      stream: _skillReference.snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Text('Something went wrong');
                                        }
                                        if (snapshot.hasData) {
                                          QuerySnapshot querySnapshot =
                                              snapshot.data!;
                                          List<QueryDocumentSnapshot>
                                              documents = querySnapshot.docs;
                                          List<Skill> skill = documents
                                              .map((e) => Skill(
                                                  id: e['id'],
                                                  skill: e['skill']))
                                              .toList();
                                          return _getSkill(skill);
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      }),

                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.blue,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Java',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.green,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Flutter',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.red,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'C++',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.purple,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Firebase',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.pink,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Rest APIs',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.yellowAccent,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Python',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.black,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Dart',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.teal,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'GitHub',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.orange,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Web Dev',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Padding(
                                  //           padding:
                                  //               EdgeInsets.all(pad.width * 0.005),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.blueGrey,
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(30)),
                                  //             child: Padding(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: pad.width * 0.01,
                                  //                   vertical: pad.width * 0.005),
                                  //               child: Text(
                                  //                 'Android Dev',
                                  //                 style:
                                  //                     TextStyle(color: Colors.white),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              )),
                        ],
                      ),
                    ),
                    // contact-section
                    Padding(
                      key: socialKey,
                      padding: EdgeInsets.only(
                          left: pad.width * 0.1,
                          right: pad.width * 0.1,
                          top: pad.width * 0.02),
                      child: Divider(
                        color: Colors.black12,
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: pad.width * 0.1,
                              vertical: pad.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Collaboration',
                                style: TextStyle(color: primaryColor),
                              ),
                              Text("Let's talk to\nCollaboration",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: pad.width * 0.02,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    bottom: _message ? pad.width * 0.02 : 0,
                                  ),
                                  child: _message
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: pad.width * 0.1,
                                              child: TextFormField(
                                                controller: _nameController,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(color: darkC),
                                                cursorColor: darkC,
                                                decoration: InputDecoration(
                                                  labelText: 'Name',
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                        color: darkC,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: pad.width * 0.03),
                                            SizedBox(
                                              width: pad.width * 0.1,
                                              child: TextFormField(
                                                controller: _emailController,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(color: darkC),
                                                cursorColor: darkC,
                                                decoration: InputDecoration(
                                                  labelText: 'Email-id',
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                        color: darkC,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: pad.width * 0.03),
                                            SizedBox(
                                              width: pad.width * 0.1,
                                              child: TextFormField(
                                                controller: _messageController,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(color: darkC),
                                                cursorColor: darkC,
                                                decoration: InputDecoration(
                                                  labelText: 'Message',
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                        color: darkC,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: darkC
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : null),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _message
                                    ? [
                                        GestureDetector(
                                          onTap: () {
                                            Message message = Message(
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                message:
                                                    _messageController.text);
                                            final messageRef = FirebaseFirestore
                                                .instance
                                                .collection('message')
                                                .doc();
                                            message.id = messageRef.id;
                                            final data = message.toMap();
                                            messageRef.set(data).whenComplete(
                                                () => print(
                                                    'Donee----------------'));

                                            //
                                            setState(() {
                                              _message = false;
                                            });
                                          },
                                          child: Container(
                                            height: pad.width * 0.03,
                                            width: pad.width * 0.08,
                                            decoration: BoxDecoration(
                                                color: primaryColor),
                                            child: Center(
                                                child: Text(
                                              'Send',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ]
                                    : [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _message = true;
                                            });
                                          },
                                          child: Container(
                                            height: pad.width * 0.03,
                                            width: pad.width * 0.08,
                                            decoration: BoxDecoration(
                                                color: primaryColor),
                                            child: Center(
                                                child: Text(
                                              'Get in Touch',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: pad.width * 0.02,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _message = true;
                                            });
                                          },
                                          child: Container(
                                            height: pad.width * 0.03,
                                            width: pad.width * 0.08,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black54)),
                                            child: Center(
                                                child: Text(
                                              'Hire me',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                              ),
                              SizedBox(
                                height: pad.width * 0.02,
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: _socialReference.snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }
                                    if (snapshot.hasData) {
                                      QuerySnapshot querySnapshot =
                                          snapshot.data!;
                                      List<QueryDocumentSnapshot> documents =
                                          querySnapshot.docs;
                                      List<Social> social = documents
                                          .map((e) => Social(
                                              githubLink: e['githubLink'],
                                              gmailLink: e['gmailLink'],
                                              instagramLink: e['instagramLink'],
                                              linkdinLink: e['linkdinLink']))
                                          .toList();
                                      return _getSocial(social);
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -300,
                          top: -300,
                          child: CircleAvatar(
                            radius: pad.width * 0.2,
                            backgroundColor: primaryColor.withOpacity(0.5),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 30,
                          child: CircleAvatar(
                            radius: pad.width * 0.06,
                            backgroundColor: primaryColor,
                          ),
                        ),
                        Positioned(
                          left: -100,
                          bottom: 80,
                          child: CircleAvatar(
                            radius: pad.width * 0.1,
                            backgroundColor: primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                          color: darkC.withOpacity(0.4),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      child: Stack(
                        children: [
                          Container(
                            width: pad.width,
                            height: pad.width * 0.044,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.7)),
                          ),
                          Positioned(
                              left: -40,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('DEVELOPER - '),
                                  Text('FLUTTER DEVELOPER - '),
                                  Text('ANDROID DEVELOPER - '),
                                  Text('WEB DEVELOPER - '),
                                  Text('KOTLIN DEVELOPER - '),
                                  Text('JAVA DEVELOPER - '),
                                  Text('DATA SCIENTIST - '),
                                  Text('REACT DEVELOPER - '),
                                  Text('MACHINE LEARNING - '),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _getSkill(skill) {
    return skill.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 11 / 4,
                crossAxisSpacing: pad.width * 0.01),
            itemCount: skill.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: pad.width * 0.01),
                  child: Material(
                    elevation: 3,
                    shadowColor: primaryColor,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: EdgeInsets.all(pad.width * 0.01),
                        child: Center(
                          child: Text(
                            // skill[index].skill,
                            (skill[index].skill),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
  }

  Widget _getExperience(experience) {
    return experience.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                experience.length,
                (index) => Stack(
                  children: [
                    Container(
                      height: pad.width * 0.35,
                      width: pad.width,
                      // width: double.infinity,
                      decoration: BoxDecoration(color: darkC),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: pad.width * 0.1,
                            vertical: pad.width * 0.02),
                        child: Row(children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: pad.width * 0.1,
                                  vertical: pad.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'EXPERIENCE',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 20),
                                  ),
                                  Text(
                                    experience[index].experienceName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60),
                                  ),
                                  Text(
                                    experience[index].experienceTime,
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(
                                    height: pad.width * 0.02,
                                  ),
                                  Text(
                                    experience[index].experienceDetail,
                                    style: TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: pad.width * 0.04),
                              child: Stack(
                                children: [
                                  RotationTransition(
                                    turns: AlwaysStoppedAnimation(30 / 360),
                                    child: Container(
                                      height: pad.width * 0.15,
                                      width: pad.width * 0.15,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: Container(
                                      height: pad.width * 0.15,
                                      width: pad.width * 0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  experience[index]
                                                      .experienceImage))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      right: pad.width * 0.07,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        AntIcons.rightOutlined,
                        color: Colors.white24,
                        size: pad.width * 0.05,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget _getProject(project) {
    return project.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              project.length,
              (index) => Stack(
                children: [
                  Container(
                    height: pad.width * 0.45,
                    width: pad.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: pad.width * 0.1,
                              vertical: pad.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: pad.width * 0.01),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: pad.width * 0.2,
                                    width: pad.width * 0.36,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        image: DecorationImage(
                                            image:
                                                AssetImage('assets/_proj.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: pad.width * 0.01),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: pad.width * 0.2,
                                    width: pad.width * 0.36,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                project[index].projectImage))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: pad.width * 0.1,
                              vertical: pad.width * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // '${project[index]}',
                                        '1',
                                        style: TextStyle(
                                            fontSize: 90, color: Colors.black),
                                      ),
                                      Text(
                                        project[index].projectName,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Details',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black),
                                      ),
                                      Text(
                                        project[index].projectDesc,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: pad.width * 0.03,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      AntIcons.rightOutlined,
                      color: Colors.black54,
                      size: pad.width * 0.02,
                    ),
                  )
                ],
              ),
            )),
          );
  }

  Widget _getSocial(social) {
    return social.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: pad.width * 0.01),
                child: GestureDetector(
                  onTap: () {
                    launch(social[0].githubLink);
                  },
                  child: Icon(
                    AntIcons.githubFilled,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: pad.width * 0.01),
                child: GestureDetector(
                  onTap: () {
                    launch(social[0].linkdinLink);
                  },
                  child: Icon(
                    AntIcons.linkedinFilled,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: pad.width * 0.01),
                child: GestureDetector(
                  onTap: () {
                    launch(social[0].instagramLink);
                  },
                  child: Icon(
                    AntIcons.instagramFilled,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: pad.width * 0.01),
                child: GestureDetector(
                  onTap: () {
                    showSnackBar(context, darkC, social[0].gmailLink);
                  },
                  child: Icon(
                    AntIcons.mailFilled,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          );
  }

  Widget _getProjectMobile(project) {
    return project.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    project.length,
                    (index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: pad.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: pad.width * 0.5,
                                width: pad.width * 0.8,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            project[index].projectImage),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: pad.width * 0.03),
                                child: Text(project[index].projectName,
                                    style: TextStyle(
                                        color: darkC,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: pad.width * 0.03),
                                child: Text(
                                  project[index].projectDesc,
                                  style: TextStyle(
                                      color: darkC.withOpacity(0.5),
                                      fontSize: pad.width * 0.025),
                                ),
                              ),
                            ],
                          ),
                        ))));
  }

  Widget _getExperienceMobile(experience) {
    return experience.isEmpty
        ? Center(
            child: Text('No data availiable!',
                style: TextStyle(color: Colors.white)))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              experience.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: pad.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: pad.width * 0.2,
                          width: pad.width * 0.2,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      experience[index].experienceImage),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: pad.width * 0.2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              experience[index].experienceName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: pad.width * 0.1),
                            ),
                            Text(
                              experience[index].experienceTime,
                              style: TextStyle(color: Colors.white24),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: pad.width * 0.05),
                      child: Text(
                        experience[index].experienceDetail,
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _getSkillMobile(skill) {
    return skill.isEmpty
        ? Center(
            child: Text('No data availiable!', style: TextStyle(color: darkC)))
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 11 / 4,
                crossAxisSpacing: pad.width * 0.03),
            itemCount: skill.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: pad.width * 0.01),
                  child: Material(
                    elevation: 3,
                    shadowColor: primaryColor,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: EdgeInsets.all(pad.width * 0.01),
                        child: Center(
                          child: Text(
                            // skill[index].skill,
                            (skill[index].skill),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
  }
}
