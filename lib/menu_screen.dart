import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'circular_image.dart';

final String imageUrl =
    "https://avatars1.githubusercontent.com/u/30185369?s=460&v=4";

var divwidth = 0.0;
var divheight = 0.0;

final menuScreenKey = new GlobalKey(debugLabel: 'MenuScreen');

class MenuScreen extends StatefulWidget {
  final Menu menu;
  final String selectedItemId;
  final Function(String) onMenuItemSelected;

  MenuScreen({
    this.menu,
    this.selectedItemId,
    this.onMenuItemSelected,
  }) : super(key: menuScreenKey);

  @override
  _MenuScreenState createState() => new _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  AnimationController titleAnimationController;
  double selectorYTop;
  double selectorYBottom;

  setSelectedRenderBox(RenderBox newRenderBox) async {
    final newYTop = newRenderBox.localToGlobal(const Offset(0.0, 0.0)).dy;
    final newYBottom = newYTop + newRenderBox.size.height;
    if (newYTop != selectorYTop) {
      setState(() {
        selectorYTop = newYTop;
        selectorYBottom = newYBottom;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    titleAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    titleAnimationController.dispose();
    super.dispose();
  }

  createMenuTitle(MenuController menuController) {
    switch (menuController.state) {
      case MenuState.open:
      case MenuState.opening:
        titleAnimationController.forward();
        break;
      case MenuState.closed:
      case MenuState.closing:
        titleAnimationController.reverse();
        break;
    }

//    Padding(
//    padding: const EdgeInsets.only(left: 50.0),
//    child: CircularImage(
//    NetworkImage(imageUrl),
//    ),
//    ),
//    Text(
//    'Rohit',
//    style: TextStyle(
//    color: Colors.white,
//    fontSize: 20,
//    ),
//    )

//    Container(
//    padding: EdgeInsets.only(
//    top: 52,
//    left: 84,
//    bottom: 8,
//    right: widget.menu.avatar[0] / 2.9),
//    child: Row(
//    children: <Widget>[
//    Padding(
//    padding: const EdgeInsets.only(left: 50.0),
//    child: CircularImage(
//    NetworkImage(imageUrl),
//    ),
//    ),
//    Text(
//    'Rohit',
//    style: TextStyle(
//    color: Colors.white,
//    fontSize: 20,
//    ),
//    )
//    ],
//    ),
//    ),

    return new AnimatedBuilder(
        animation: titleAnimationController,
        child: new OverflowBox(
          maxWidth: double.infinity,
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.only(
                top: 82,
                left: 89,
                bottom: 8,
                right: widget.menu.avatar[0] / 2.9),
            child: new Padding(
              padding:
                  const EdgeInsets.only(left: 72.0, top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  CircularImage(
                    NetworkImage(imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: Text(
                      'ROHIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: 'bebas-neue',
                        letterSpacing: 2.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return new Transform(
            transform: new Matrix4.translationValues(
              250.0 * (1.0 - titleAnimationController.value) - 100.0,
              0.0,
              0.0,
            ),
            child: child,
          );
        });
  }

  createMenuItems(MenuController menuController) {
    final List<Widget> listItems = [];
    final animationIntervalDuration = 0.5;
    final perListItemDelay =
        menuController.state != MenuState.closing ? 0.15 : 0.0;

    for (var i = 0; i < widget.menu.items.length; ++i) {
      final animationIntervalStart = i * perListItemDelay;
      final animationIntervalEnd =
          animationIntervalStart + animationIntervalDuration;
      final isSelected = widget.menu.items[i].id == widget.selectedItemId;

      listItems.add(new AnimatedMenuListItem(
        menuState: menuController.state,
        isSelected: isSelected,
        duration: const Duration(milliseconds: 600),
        curve: new Interval(animationIntervalStart, animationIntervalEnd,
            curve: Curves.easeOut),
        menuListItem: new _MenuListItem(
          title: widget.menu.items[i].title,
          icon: widget.menu.items[i].icon,
          isSelected: isSelected,
          onTap: () {
            widget.onMenuItemSelected(widget.menu.items[i].id);
            menuController.close();
          },
        ),
      ));
    }

    return new Transform(
      transform: new Matrix4.translationValues(
        0.0,
        225.0,
        0.0,
      ),
      child: Column(
        children: listItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffoldMenuController(
        builder: (BuildContext context, MenuController menuController) {
      var shouldRenderSelector = true;
      var actualSelectorYTop = selectorYTop;
      var actualSelectorYBottom = selectorYBottom;
      var selectorOpacity = 1.0;

      if (menuController.state == MenuState.closed ||
          menuController.state == MenuState.closing ||
          selectorYTop == null) {
        final RenderBox menuScreenRenderBox =
            context.findRenderObject() as RenderBox;

        if (menuScreenRenderBox != null) {
          final menuScreenHeight = menuScreenRenderBox.size.height;
          actualSelectorYTop = menuScreenHeight - 50.0;
          actualSelectorYBottom = menuScreenHeight;
          selectorOpacity = 0.0;
        } else {
          shouldRenderSelector = false;
        }
      }

      return new Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2D5DA3), Color(0xFF254F88)],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: new Stack(
            children: [
              createMenuTitle(menuController),
              createMenuItems(menuController),
              shouldRenderSelector
                  ? new ItemSelector(
                      topY: actualSelectorYTop,
                      bottomY: actualSelectorYBottom,
                      opacity: selectorOpacity,
                    )
                  : new Container(),
            ],
          ),
        ),
      );
    });
  }
}

class ItemSelector extends ImplicitlyAnimatedWidget {
  final double topY;
  final double bottomY;
  final double opacity;

  ItemSelector({
    this.topY,
    this.bottomY,
    this.opacity,
  }) : super(duration: const Duration(milliseconds: 250));

  @override
  _ItemSelectorState createState() => new _ItemSelectorState();
}

class _ItemSelectorState extends AnimatedWidgetBaseState<ItemSelector> {
  Tween<double> _topY;
  Tween<double> _bottomY;
  Tween<double> _opacity;

  @override
  void forEachTween(TweenVisitor visitor) {
    _topY = visitor(
      _topY,
      widget.topY,
      (dynamic value) => new Tween<double>(begin: value),
    );
    _bottomY = visitor(
      _bottomY,
      widget.bottomY,
      (dynamic value) => new Tween<double>(begin: value),
    );
    _opacity = visitor(
      _opacity,
      widget.opacity,
      (dynamic value) => new Tween<double>(begin: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return new Positioned(
      top: _topY.evaluate(animation),
      child: new Opacity(
        opacity: _opacity.evaluate(animation),
        child: new Container(
          width: 5.0,
          height: _bottomY.evaluate(animation) - _topY.evaluate(animation),
          color: Colors.red,
        ),
      ),
    );
  }
}

class AnimatedMenuListItem extends ImplicitlyAnimatedWidget {
  final _MenuListItem menuListItem;
  final MenuState menuState;
  final bool isSelected;
  final Duration duration;

  AnimatedMenuListItem({
    this.menuListItem,
    this.menuState,
    this.isSelected,
    this.duration,
    curve,
  }) : super(duration: duration, curve: curve);

  @override
  _AnimatedMenuListItemState createState() => new _AnimatedMenuListItemState();
}

class _AnimatedMenuListItemState
    extends AnimatedWidgetBaseState<AnimatedMenuListItem> {
  final double closedSlidePosition = 200.0;
  final double openSlidePosition = 0.0;

  Tween<double> _translation;
  Tween<double> _opacity;

  updateSelectedRenderBox() {
    final renderBox = context.findRenderObject() as RenderBox;
    if (renderBox != null && widget.isSelected) {
      (menuScreenKey.currentState as _MenuScreenState)
          .setSelectedRenderBox(renderBox);
    }
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    var slide, opacity;

    switch (widget.menuState) {
      case MenuState.closed:
      case MenuState.closing:
        slide = closedSlidePosition;
        opacity = 0.0;
        break;
      case MenuState.open:
      case MenuState.opening:
        slide = openSlidePosition;
        opacity = 1.0;
        break;
    }

    _translation = visitor(
      _translation,
      slide,
      (dynamic value) => new Tween<double>(begin: value),
    );

    _opacity = visitor(
      _opacity,
      opacity,
      (dynamic value) => new Tween<double>(begin: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    updateSelectedRenderBox();

    return new Opacity(
      opacity: _opacity.evaluate(animation),
      child: new Transform(
        transform: new Matrix4.translationValues(
          0.0,
          _translation.evaluate(animation),
          0.0,
        ),
        child: widget.menuListItem,
      ),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  _MenuListItem({
    this.title,
    this.isSelected,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      splashColor: const Color(0x44000000),
      onTap: isSelected ? null : onTap,
      child: Container(
        width: double.infinity,
        child: new Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
              size: 31.0,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.white,
                fontSize: 25.0,
                fontFamily: 'bebas-neue',
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//new Text(
//title,
//style: new TextStyle(
//color: isSelected ? Colors.red : Colors.white,
//fontSize: 25.0,
//fontFamily: 'bebas-neue',
//letterSpacing: 2.0,
//),
//),

class Menu {
  final List avatar;
  final List<MenuItem> items;

  Menu({
    this.items,
    this.avatar,
  });
}

class MenuItem {
  final String id;
  final String title;
  IconData icon;

  MenuItem({
    this.id,
    this.title,
    this.icon,
  });
}
