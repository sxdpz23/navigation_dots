part of '../navigation_dots.dart';

class NavigationDots extends StatefulWidget {
  /// The first page to show on widget create.
  /// By default, the value assigned is `0`.
  final int initialPage;

  /// The list of widgets which will become the pages or screens that are used
  /// to display information. It also can be said as the required list of pages
  /// that are needed to be displayed. This is a `required` field.
  final List<Widget> children;

  /// The axis on which the pages should scroll or animate or to be swiped.
  /// By default, this will be set to horizontal axis.
  final Axis scrollDirection;

  /// The boolean value To keep the pages switching on swipe gesture.
  /// `True` to keep pages scrollable on swipe or `False` for not keeping the
  /// pages scrollable on swipe.
  /// By default, this will be set to false.
  final bool keepScrollable;

  /// The content padding of the Dock (a.k.a. Navigator) which will contain the
  /// widget elements which will be used to (or for triggering) navigate
  /// between the pages.
  /// By default, this is set to `10.0 pixels` from all sides.
  final EdgeInsets padding;

  /// The color of the Dock (a.k.a. Navigator) which will enclose the
  /// navigation dots.
  /// By default, this will be set to transparent or the root widget color.
  final Color dotsBackgroundColor;

  /// The customizable bar for the Dock which will be shown behind the
  /// navigation elements
  final NavigatorBar customBarStyle;

  /// The customizable dot for the Dock which will be used for navigation
  /// between the pages.
  final NavigatorDot customDotStyle;

  /// The duration of animations used. By default, the value set is `500`
  /// `milliseconds`.
  final Duration duration;

  /// The boolean value that determines whether to show the bar behind the dots
  /// or whether to hide them. `True` to show and `False` to hide the navigator
  /// bar. By default, this value is set to true.
  final bool showNavigatorBar;

  const NavigationDots(
      {Key? key,
      this.initialPage = 0,
      required this.children,
      this.scrollDirection = Axis.horizontal,
      this.keepScrollable = false,
      this.padding = const EdgeInsets.all(10.0),
      this.dotsBackgroundColor = Colors.transparent,
      this.customBarStyle = const NavigatorBar(
        color: Colors.black38,
        size: 3.0,
      ),
      this.customDotStyle = const NavigatorDot(
        color: Colors.black,
        shade: Colors.black54,
        size: 10.0,
        onTapSize: 20.0,
      ),
      this.duration = const Duration(milliseconds: 500),
      this.showNavigatorBar = true})
      : super(key: key);

  @override
  State<NavigationDots> createState() => _NavigationDotsState();
}

class _NavigationDotsState extends State<NavigationDots>
    with SingleTickerProviderStateMixin {
  /// The page controller assigned to the PageView used.
  PageController? pageController;

  /// The animation controller assigned to the PageView used in order to
  /// navigate between the pages.
  AnimationController? animationController;

  /// The integer variable to set the current page value on page switch
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: true,
      viewportFraction: 1,
    );
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    pageController!.addListener(() => setState(() => currentPage =
        pageController!.page == null ? 0 : pageController!.page!.toInt()));
    super.initState();
  }

  navigationFunction(page) {
    animationController?.reverse();
    pageController?.animateToPage(page,
        duration: widget.duration, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: PageView(
            physics: widget.keepScrollable
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            scrollDirection: widget.scrollDirection,
            controller: pageController!,
            children: widget.children,
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 20.0,
          right: 20.0,
          child: Dock(
            padding: widget.padding,
            color: widget.dotsBackgroundColor,
            barStyle: widget.customBarStyle,
            dotStyle: widget.customDotStyle,
            currentPage: currentPage,
            dotCount: widget.children.length,
            duration: widget.duration,
            onTapAction: (page) => navigationFunction(page),
            showBar: widget.showNavigatorBar,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    pageController?.dispose();
    animationController?.dispose();
    super.dispose();
  }
}
