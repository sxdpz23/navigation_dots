part of '../navigation_dots.dart';

class Dock extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;
  final NavigatorBar barStyle;
  final NavigatorDot dotStyle;
  final int dotCount;
  final int currentPage;
  final Duration duration;
  final Function onTapAction;
  final bool showBar;

  const Dock(
      {Key? key,
      required this.padding,
      required this.color,
      required this.barStyle,
      required this.dotStyle,
      required this.dotCount,
      required this.currentPage,
      required this.duration,
      required this.onTapAction,
      required this.showBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          showBar
              ? Positioned(
                  child: Container(
                    color: barStyle.color,
                    height: barStyle.size,
                    width: 30.0 * dotCount,
                  ),
                )
              : const SizedBox(),
          Positioned(
            child: Center(
              child: SizedBox(
                width: 30.0 * dotCount,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(
                    dotCount,
                    (index) => GestureDetector(
                      onTap: () => onTapAction(index),
                      child: AnimatedContainer(
                        duration: duration,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: dotStyle.color,
                          boxShadow: [
                            BoxShadow(
                              color: dotStyle.shade,
                              spreadRadius: currentPage == index ? 5.0 : 0.0,
                              blurRadius: 25.0,
                            )
                          ],
                        ),
                        height: currentPage == index
                            ? dotStyle.onTapSize
                            : dotStyle.size,
                        width: currentPage == index
                            ? dotStyle.onTapSize
                            : dotStyle.size,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
