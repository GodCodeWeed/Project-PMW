
import 'package:flutter/material.dart';
import 'package:jop_swipper/Model/model_profile.dart';
import 'package:jop_swipper/UI/Widgets/Swipper/swipper_action_button_widget.dart';
import 'package:jop_swipper/Utility/DependencyInjection/dependencyInjection.dart';

import 'swipper_drag_widget.dart';

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {
  List<Information> draggableItems = [
    const Information(
        name: 'Software Engineer 3',
        description: 'Bachelor’s degree, or equivalent practical experience. 5 years of experience with software development in one or more programming languages (e.g., Python, C, C++, Java, JavaScript).3 years of experience in a technical leadership role; overseeing strategic projects, with 2 years of experience in a people management, supervision/team leadership role.',
        distance: 'Salary Range: \$150,000 - \$170,000',
        imageAsset: 'assets/Images/avatar_1.png'),
    const Information(
        name: 'Java Developer',
           description: '2+ years of experience with developing applications using Java. 2+ years of experience with developing and deploying applications in a container. 1+ years of experience developing with SQL and/or NoSQL databases',
        distance: 'Salary Range: \$130,000 - \$167,000',
        imageAsset: 'assets/Images/avatar_2.png'),
    const Information(
        name: 'Firmware Developer',
           description: 'M.S. degree in Computer Engineering, Computer Science, or Electrical Engineering. Strong programming skills using C, C++, and modern scripting languages',
       distance: 'Salary Range: \$140,000 - \$155,000',
        imageAsset: 'assets/Images/avatar_3.png'),
    const Information(
        name: 'VR Expirience Engineer',
           description: '5+ years experience as an engineer shipping user-facing features on games or other 3D interactive products. Prototyping new interactions and features with an eye toward intuitive usability and feel',
            distance: 'Salary Range: \$157,000 - \$167,000',
        imageAsset: 'assets/Images/avatar_4.png'),
    const Information(
        name: 'Trading Algorithm Software Developer',
           description: 'Exceptional programming skills (including several of the following languages: Python. Degree in computer science, mathematics, applied statistics, various engineering disciplines',
        distance: 'Salary Range: \$123,000 - \$150,000',
        imageAsset: 'assets/Images/avatar_5.png'),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(draggableItems.length, (index) {
                if (index == draggableItems.length - 1) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, 580, 340),
                          const Size(580, 340)),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                              swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -300
                                      : 300
                                  : 0,
                              0,
                              580,
                              340),
                          const Size(580, 340)),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: RotationTransition(
                      turns: Tween<double>(
                              begin: 0,
                              end: swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -0.1 * 0.3
                                      : 0.1 * 0.3
                                  : 0.0)
                          .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve:
                              const Interval(0, 0.4, curve: Curves.easeInOut),
                        ),
                      ),
                      child: DragWidget(
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                        isLastCard: true,
                      ),
                    ),
                  );
                } else {
                  return DragWidget(
                    profile: draggableItems[index],
                    index: index,
                    swipeNotifier: swipeNotifier,
                  );
                }
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.left;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.right;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
