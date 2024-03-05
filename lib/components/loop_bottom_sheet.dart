import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:useless_app/components/color_picker/color_picker_dialog.dart';
import 'package:useless_app/cubit/loop/loop_state.dart';
import 'package:useless_app/utils/loop_color_types_enum.dart';
import 'package:useless_app/utils/loop_typedefs.dart';

class LoopBottomSheet extends StatefulWidget {
  final LoopState state;
  final OnColorSelected onColorSelected;
  final OnLoopSpeedChanged onLoopSpeedChanged;
  final OnLoopAngleChanged onLoopAngleChanged;
  final OnLoopStepChanged onLoopStepChanged;
  final VoidCallback onReset;
  final OnSongChanged onSongChanged;
  final VoidCallback onMute;
  final bool isMute;
  final int selectedSong;
  final Color selectedColor;
  final DraggableScrollableController controller;
  const LoopBottomSheet({
    Key? key,
    required this.state,
    required this.onColorSelected,
    required this.onLoopSpeedChanged,
    required this.onLoopAngleChanged,
    required this.onLoopStepChanged,
    required this.onReset,
    required this.onSongChanged,
    required this.onMute,
    required this.isMute,
    required this.selectedSong,
    required this.selectedColor,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoopBottomSheet> createState() => _LoopBottomSheetState();
}

class _LoopBottomSheetState extends State<LoopBottomSheet> {
  final _sheetKey = GlobalKey();

  final minSheetSize = 0.09;
  final maxSheetSize = 0.6;
  bool isBottomSheetUp = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.size == maxSheetSize) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            isBottomSheetUp = true;
          });
        });
      }
      if (widget.controller.size == minSheetSize) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            isBottomSheetUp = false;
          });
        });
      }
    });
  }

  void _expand() {
    setState(() {
      isBottomSheetUp = true;
    });
    _animateSheet(sheet.maxChildSize);
  }

  void _hide() {
    _animateSheet(sheet.minChildSize);
    setState(() {
      isBottomSheetUp = false;
    });
  }

  void _animateSheet(double size) {
    widget.controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheetKey.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: _sheetKey,
        initialChildSize: minSheetSize,
        maxChildSize: maxSheetSize,
        minChildSize: minSheetSize,
        expand: false,
        snap: true,
        snapSizes: [minSheetSize, maxSheetSize],
        controller: widget.controller,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                  child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(isBottomSheetUp
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                    onPressed: isBottomSheetUp ? _hide : _expand,
                  ),
                  const Divider(
                    indent: 64,
                    endIndent: 64,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Speed'),
                      SizedBox(
                        height: 50,
                        child: Slider(
                          activeColor: widget.selectedColor,
                          value: widget.state.loopSpeed,
                          onChanged: widget.onLoopSpeedChanged,
                          max: 0.5,
                          min: 0.005,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Depth'),
                      SizedBox(
                        height: 50,
                        child: Slider(
                          activeColor: widget.selectedColor,
                          value: widget.state.loopAngle,
                          onChanged: widget.onLoopAngleChanged,
                          max: 900,
                          min: 1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Step'),
                      SizedBox(
                        height: 50,
                        child: Slider(
                          activeColor: widget.selectedColor,
                          value: widget.state.loopStep,
                          onChanged: widget.onLoopStepChanged,
                          max: 100,
                          min: 1,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ColorPickerDialog(
                            onColorSelected: widget.onColorSelected,
                            colorType: LoopColorTypes.background,
                            currentColor: widget.state.backgroundColor),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ColorIndicator(
                            width: 44,
                            height: 44,
                            borderRadius: 22,
                            color: widget.state.backgroundColor,
                          ),
                          const Text(
                            'Background color',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ColorPickerDialog(
                            onColorSelected: widget.onColorSelected,
                            colorType: LoopColorTypes.foreground,
                            currentColor: widget.state.foregroundColor),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ColorIndicator(
                            width: 44,
                            height: 44,
                            borderRadius: 22,
                            color: widget.state.foregroundColor,
                          ),
                          const Text(
                            'Foreground color',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: widget.onMute,
                          icon: Icon(widget.isMute
                              ? Icons.music_off_outlined
                              : Icons.music_note_outlined),
                        ),
                        ...List<int>.generate(3, (index) => index).map(
                          (e) => IconButton(
                            onPressed: () => widget.onSongChanged(e),
                            icon: Text(
                              e.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: widget.selectedSong == e
                                    ? widget.selectedColor
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: widget.onReset,
                      child: Text(
                        'Reset',
                        style: TextStyle(color: widget.selectedColor),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
