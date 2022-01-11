part of '../navigation_dots.dart';

class NavigationDots extends StatefulWidget {
  /// The first page to show on widget create
  final int initialPage;
  final List<Widget> children;

  /// On what axis should the pages scroll
  final Axis scrollDirection;

  /// `True` to keep pages scrollable on swipe or `False` for not keeping the pages scrollable on swipe
  final bool keepScrollable;

  final EdgeInsets padding;

  /// Navigator Color
  final Color dotsBackgroundColor;

  final NavigatorBar customBarStyle;

  final NavigatorDot customDotStyle;

  final Duration duration;

  final bool showNavigatorBar;

  NavigationDots(
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
  PageController? pageController;
  AnimationController? animationController;
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
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView(
              physics: widget.keepScrollable
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
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
      ),
    );
  }

  @override
  void dispose() {
    pageController?.dispose();
    animationController?.dispose();
    super.dispose();
  }
}
