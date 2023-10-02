import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmBloc.dart';
import 'package:efradera_fmradio/features/fm_radios/presentation/bloc/fmradio/remote/remoteFmState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:radio_player/radio_player.dart';

class Drawer3D extends StatefulWidget {
  const Drawer3D({super.key});

  @override
  _Drawer3DState createState() => _Drawer3DState();
}

class _Drawer3DState extends State<Drawer3D>
    with SingleTickerProviderStateMixin {
  var _maxSlide = 0.75;
  var _extraHeight = 0.1;
  late double _startingPos;
  var _drawerVisible = false;
  late AnimationController _animationController;
  Size _screen = const Size(0, 0);
  late CurvedAnimation _animator;
  late CurvedAnimation _objAnimator;
  final RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  late ImageSequenceAnimatorState imageSequenceAnimator;
  bool wasPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
    _objAnimator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeIn,
    );
    initRadioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _radioPlayer.stop();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: 'http://peridot.streamguys.com:7150/Mirchi',
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });
  }

  @override
  void didChangeDependencies() {
    _screen = MediaQuery.of(context).size;
    _maxSlide *= _screen.width;
    _extraHeight *= _screen.height;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          children: <Widget>[
            Container(color: const Color.fromARGB(255, 228, 224, 213)),
            _buildBackground(),
            _build3dObject(),
            _buildDrawer(),
            _buildButton()
          ],
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    _startingPos = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos;
    if (globalDelta > 0) {
      final pos = globalDelta / _screen.width;
      if (_drawerVisible && pos <= 1.0) return;
      _animationController.value = pos;
      imageSequenceAnimator.play();
    } else {
      final pos = 1 - (globalDelta.abs() / _screen.width);
      if (!_drawerVisible && pos >= 0.0) return;
      _animationController.value = pos;
      imageSequenceAnimator.rewind();
      imageSequenceAnimator.
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      } else {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
      return;
    }
    if (_animationController.value > 0.5) {
      {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      }
    } else {
      {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
    }
  }

  void _toggleDrawer() {
    if (_animationController.value < 0.5) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  _buildBody() {
    return BlocBuilder<RemoteFMBloc, RemoteFmState>(builder: (_, state) {
      if (state is RemoteFMLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteFMError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteFMLoaded) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: state.radios!.map((radio) {
            return _buildCard(radio.radioName, radio.countryName, radio.genre,
                radio.radioUrl);
          }).toList(),
        );
      }
      return const SizedBox();
    });
  }

  _buildBackground() => Positioned.fill(
        top: -_extraHeight,
        bottom: -_extraHeight,
        child: AnimatedBuilder(
          animation: _animator,
          builder: (context, widget) => Transform.translate(
            offset: Offset(_maxSlide * _animator.value, 0),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((3.14 / 2 + 0.1) * -_animator.value),
              alignment: Alignment.centerLeft,
              child: widget,
            ),
          ),
          child: Container(
            color: const Color(0xffe8dfce),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _extraHeight + 0.1 * _screen.height,
                  left: 80,
                  child: Transform.rotate(
                    angle: 90 * (3.14 / 180),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animator,
                  builder: (_, __) => Container(
                    color: Colors.black.withAlpha(
                      (150 * _animator.value).floor(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _buildDrawer() => Positioned.fill(
        top: -_extraHeight,
        bottom: -_extraHeight,
        left: 0,
        right: _screen.width - _maxSlide,
        child: AnimatedBuilder(
          animation: _animator,
          builder: (context, widget) {
            return Transform.translate(
              offset: Offset(_maxSlide * (_animator.value - 1), 0),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(3.14 * (1 - _animator.value) / 2),
                alignment: Alignment.centerRight,
                child: widget,
              ),
            );
          },
          child: Container(
            color: const Color.fromARGB(255, 255, 196, 0),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  top: _extraHeight,
                  bottom: _extraHeight,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0), child: _buildBody()),
                ),
              ],
            ),
          ),
        ),
      );

  _build3dObject() => Positioned(
        child: AnimatedBuilder(
          animation: _objAnimator,
          builder: (_, __) => ImageSequenceAnimator(
            "assets/3d", //folderName
            "", //fileName
            1, //suffixStart
            4, //suffixCount
            "png", //fileFormat
            120, //frameCount
            fps: 60,
            isLooping: false,
            isBoomerang: false,
            isAutoPlay: false,
            onReadyToPlay: onReadyToPlay,
            onPlaying: onPlaying,
            waitUntilCacheIsComplete: true,
          ),
        ),
      );
  void onReadyToPlay(ImageSequenceAnimatorState _imageSequenceAnimator) {
    imageSequenceAnimator = _imageSequenceAnimator;
  }

  void onPlaying(ImageSequenceAnimatorState _imageSequenceAnimator) {
    setState(() {});
  }

  _buildHeader() => SafeArea(
        child: AnimatedBuilder(
            animation: _animator,
            builder: (_, __) {
              return Transform.translate(
                offset: Offset((_screen.width - 60) * _animator.value, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: InkWell(
                        onTap: _toggleDrawer,
                        child: Icon(Icons.menu),
                      ),
                    ),
                    Opacity(
                      opacity: 1 - _animator.value,
                      child: Text(
                        "PRODUCT DETAIL",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(width: 50, height: 50),
                  ],
                ),
              );
            }),
      );
  _getGenre(String? tag) {
    if (tag == null || tag.isEmpty) {
      return const Text("Genre: Not specified",
          style: TextStyle(fontFamily: 'Sani', fontSize: 15));
    }
    if (tag.length > 50) {
      return Text("Genre:${tag.substring(0, 50)}",
          style: const TextStyle(fontFamily: 'Sani', fontSize: 15));
    }
    return Text("Genre: $tag",
        style: const TextStyle(fontFamily: 'Sani', fontSize: 15));
  }

  Widget _buildCard(String? name, String? country, String? tag, String? url) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 150,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 232, 228, 217),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                color: const Color.fromARGB(255, 49, 47, 40), width: 2.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.85),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        child: Container(
            margin: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name!,
                    style: const TextStyle(fontFamily: 'Tapem', fontSize: 30)),
                Text("From $country",
                    style: const TextStyle(fontFamily: 'Sani', fontSize: 15)),
                const Spacer(),
                _getGenre(tag)
              ],
            )),
      ),
      onTap: () {
        _playAudio(url);
      },
    );
  }

  _buildButton() {
    if (_drawerVisible) return Container();
    return Padding(
      padding: const EdgeInsets.fromLTRB(105, 715, 0, 0),
      child: TextButton(
          onPressed: _onPressPlay,
          child: const Text(
            "Play",
            style: TextStyle(
                fontFamily: 'Tapem',
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 45),
          )),
    );
  }

  _onPressPlay() {
    if (isPlaying) {
      isPlaying = false;
      _radioPlayer.pause();
    } else {
      isPlaying = true;
      _radioPlayer.play();
    }
  }

  _playAudio(String? url) {
    _radioPlayer.play();
    isPlaying = true;
  }
}
