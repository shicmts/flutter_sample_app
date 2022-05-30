import 'package:flutter/material.dart';
import 'drawer_list.dart';

import '../../../theme/app_theme.dart';

class RootDrawer extends StatefulWidget {
  const RootDrawer({
    required this.screenIndex,
    required this.iconAnimationController,
    required this.callbackIndex,
    Key? key
  }) : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callbackIndex;

  @override
  State<StatefulWidget> createState() => _RootDrawerState();
}

class _RootDrawerState extends State<RootDrawer> {
  late final List<DrawerList> drawerList;
  @override
  void initState() {
    super.initState();
    setDrawerListArray();
  }

  void setDrawerListArray(){
    drawerList = <DrawerList>[
      DrawerList(
          index: DrawerIndex.home,
          labelName: "홈",
          icon: const Icon(Icons.home_filled)
      ),
      DrawerList(
          index: DrawerIndex.player,
          labelName: "플레이어",
          icon: const Icon(Icons.people_alt_rounded)
      ),
      DrawerList(
          index: DrawerIndex.feedback,
          labelName: "피드백",
          icon: const Icon(Icons.feedback_rounded)
      ),
      DrawerList(
          index: DrawerIndex.project,
          labelName: "프로젝트",
          icon: const Icon(Icons.backup_rounded)
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.notWhite.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationToScreen(listData.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 6.0,
                    height: 46.0
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  if (listData.isAssetsImage)
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(listData.imageName,
                          color: widget.screenIndex == listData.index
                              ? Colors.blue
                              : AppTheme.nearlyBlack),
                    )
                  else
                    Icon(listData.icon?.icon,
                        color: widget.screenIndex == listData.index
                            ? Colors.blue
                            : AppTheme.nearlyBlack),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.screenIndex == listData.index
                          ? Colors.blue
                          : AppTheme.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            if (widget.screenIndex == listData.index)
               AnimatedBuilder(
                animation: widget.iconAnimationController,
                builder: (BuildContext context, _) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        (MediaQuery.of(context).size.width * 0.75 - 64) *
                            (1.0 - widget.iconAnimationController.value - 1.0),
                        0.0,
                        0.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75 - 64,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(28),
                            bottomRight: Radius.circular(28),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationToScreen(DrawerIndex indexScreen) async {
    widget.callbackIndex(indexScreen);
  }
}