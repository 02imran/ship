import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/screen/utils/page_model.dart';

import 'cache_image_network.dart';
import 'circular_clipper.dart';
import 'over_board_animator.dart';

enum SwipeDirection { LEFT_TO_RIGHT, RIGHT_TO_LEFT, SKIP_TO_LAST }

class OverBoard extends StatefulWidget {
  final List<PageModel>? pages;
  final Offset? center;
  final bool? showBullets;
  final VoidCallback? finishCallback;
  final VoidCallback? skipCallback;
  final OverBoardAnimator? animator;
  final String? skipText, nextText, finishText;

  const OverBoard(
      {Key? key,
      @required this.pages,
      this.center,
      this.showBullets,
      this.skipText,
      this.nextText,
      this.finishText,
      @required this.finishCallback,
      this.animator,
      this.skipCallback})
      : super(key: key);

  @override
  _OverBoardState createState() => _OverBoardState();
}

class _OverBoardState extends State<OverBoard> with TickerProviderStateMixin {
  OverBoardAnimator? _animator;

  final ScrollController _scrollController = ScrollController();
  double _bulletPadding = 5.0, _bulletSize = 10.0, _bulletContainerWidth = 0;

  int _counter = 0, _last = 0;
  int _total = 0;
  double initial = 0, distance = 0;
  Random random = Random();
  SwipeDirection _swipeDirection = SwipeDirection.RIGHT_TO_LEFT;

  @override
  void initState() {
    super.initState();

    _animator = OverBoardAnimator(this);
    _total = widget.pages!.length;
    _animate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getStack(),
    );
  }

  _getStack() {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        initial = details.globalPosition.dx;
      },
      onPanUpdate: (DragUpdateDetails details) {
        distance = details.globalPosition.dx - initial;
      },
      onPanEnd: (DragEndDetails details) {
        initial = 0.0;
        setState(() {
          _last = _counter;
        });
        if (distance > 1 && _counter > 0) {
          setState(() {
            _counter--;
            _swipeDirection = SwipeDirection.LEFT_TO_RIGHT;
          });
          _animate();
        } else if (distance < 0 && _counter < _total - 1) {
          setState(() {
            _counter++;
            _swipeDirection = SwipeDirection.RIGHT_TO_LEFT;
          });
          _animate();
        }
      },
      child: Stack(
        children: <Widget>[
          _getPage(_last),
          AnimatedBuilder(
            animation: _animator!.getAnimator(),
            builder: (context, child) {
              return ClipOval(
                  clipper: CircularClipper(
                      _animator!.getAnimator().value, widget.center),
                  child: _getPage(_counter));
            },
            child: Container(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Opacity(
                  opacity: (_counter < _total - 1) ? 1.0 : 0.0,
                  child: InkWell(
                    onTap: (widget.skipCallback ?? _skip),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF0F3F6),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFD0E7F5),
                                offset: Offset(0, 2),
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        widget.skipText ?? "SKIP",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(child: LayoutBuilder(
                    builder: (context, constraints) {
                      _bulletContainerWidth = constraints.maxWidth - 40.0;
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        child: ((widget.showBullets ?? true)
                            ? SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0; i < _total; i++)
                                      Padding(
                                        padding: EdgeInsets.all(_bulletPadding),
                                        child: Container(
                                            height: _bulletSize,
                                            width: (i == _counter)
                                                ? _bulletSize
                                                : _bulletSize,
                                            decoration: (i == _counter)
                                                ? BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    shape: BoxShape.circle,
                                                  )
                                            // color: Colors.grey[300]),
                                            ),
                                      )
                                  ],
                                ),
                              )
                            : Container()),
                      );
                    },
                  )),
                ),
                (_counter < _total - 1
                    ? InkWell(
                        onTap: _next,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF0F3F6),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFD0E7F5),
                                    offset: Offset(0, 2),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            widget.nextText ?? "NEXT",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: widget.finishCallback,
                        child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF0F3F6),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xFFD0E7F5),
                                      offset: Offset(0, 2),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              widget.finishText ?? "FINISH",
                              style: const TextStyle(color: Colors.grey),
                            )),
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getPage(index) {
    PageModel page = widget.pages![index];
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: page.color,
      child: page.child != null
          ? Center(
              child: page.doAnimateChild!
                  ? AnimatedBoard(
                      animator: _animator!,
                      child: page.child!,
                    )
                  : page.child,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                page.doAnimateImage!
                    ? AnimatedBoard(
                        animator: _animator!,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: (page.imageAssetPath != null)
                              ? Image.asset(page.imageAssetPath!,
                                  width: Get.width, height: Get.height * 0.5)
                              : buildCacheNetworkImage(
                                  width: Get.width,
                                  height: 300,
                                  url: page.imageFromUrl,
                                  plColor: Colors.transparent),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: (page.imageAssetPath != null)
                            ? Image.asset(page.imageAssetPath!,
                                width: Get.width, height: Get.height * 0.5)
                            : buildCacheNetworkImage(
                                width: Get.width,
                                height: 300,
                                url: page.imageFromUrl,
                                plColor: Colors.transparent),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 30.0, right: 30.0),
                  child: Text(
                    page.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 30.0, right: 30.0),
                  child: Text(
                    page.body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  _next() {
    setState(() {
      _swipeDirection = SwipeDirection.RIGHT_TO_LEFT;
      _last = _counter;
      _counter++;
    });
    _animate();
  }

  _skip() {
    setState(() {
      _swipeDirection = SwipeDirection.SKIP_TO_LAST;
      _last = _counter;
      _counter = _total - 1;
    });
    _animate();
  }

  _animate() {
    _animator!.getController().forward(from: 0.0);

    double bulletDimension = (_bulletPadding * 2) + (_bulletSize);
    double scroll = bulletDimension * _counter;
    double maxScroll = bulletDimension * _total - 1;
    if (scroll > _bulletContainerWidth &&
        _swipeDirection == SwipeDirection.RIGHT_TO_LEFT) {
      double scrollDistance =
          (((scroll - _bulletContainerWidth) ~/ bulletDimension) + 1) *
              bulletDimension;
      _scrollController.animateTo(scrollDistance,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    } else if (scroll < (maxScroll - _bulletContainerWidth) &&
        _swipeDirection == SwipeDirection.LEFT_TO_RIGHT) {
      _scrollController.animateTo(scroll,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    } else if (_swipeDirection == SwipeDirection.SKIP_TO_LAST) {
      _scrollController.animateTo(maxScroll,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    }
  }
}

class AnimatedBoard extends StatelessWidget {
  final Widget? child;
  final OverBoardAnimator? animator;

  const AnimatedBoard({Key? key, this.animator, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, 50.0 * (1.0 - animator!.getAnimator().value), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: child,
      ),
    );
  }
}
