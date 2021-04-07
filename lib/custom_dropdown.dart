import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<IconData> iconList;
  final ValueChanged<String> onChange;
  final double titleSize;
  final Color titleColor;
  final Color backgroundColor;
  final Gradient backgroundGradient;
  final Color listBackgroundColor;
  final bool dropdownIcon;
  final bool withIcon;
  final double width;
  final double height;
  final double borderRadius;
  final Color itemColor;
  final double itemSize;
  final double iconSize;
  final Color iconColor;
  final double shadow;

  const CustomDropdown(
      {Key key,
        @required this.items,
        this.onChange,
        this.title,
        this.itemColor,
        this.itemSize,
        this.iconColor,
        this.iconSize,
        this.backgroundGradient,
        this.titleSize,
        this.withIcon,
        this.iconList,
        this.listBackgroundColor,
        this.titleColor,
        this.backgroundColor,
        this.height,
        this.borderRadius,
        this.width,
        this.dropdownIcon, this.shadow})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<Material> itemList = [];
  Icon titleIcon;
  GlobalKey actionKey;
  double _widgetHeight, widgetWidth, xPosition, yPosition;
  bool isDropdownOpened = false;
  bool clicked = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.title);
    widget.withIcon ? generateIconItems() : generateItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: clicked ?
      widget.height * (widget.items.length > 4 ? 4 : widget.items.length+1) : widget.height,
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          clicked
              ? Positioned(
            width: widget.width,
            left: 0,
            top: widget.height / 2,
            child: Container(
              height: clicked ?
              widget.height * (widget.items.length > 4 ? 4 : widget.items.length+1) : widget.height,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: widget.shadow == null ? 0 : widget.shadow,
                    )
                  ],
                  color: widget.listBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Container(
                margin: EdgeInsets.only(top: widget.height/2 + 5,bottom: 5,left: widget.width/10,right: widget.width/10),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: itemList),
                ),
              ),
            ),
          )
              : Container(),
          InkWell(
            key: actionKey,
            onTap: () {
              setState(() {
                // findDropdownData();

                if (clicked) {
                  clicked = false;
                } else {
                  clicked = true;
                }
                print(_widgetHeight);
                print(widgetWidth);
                print(xPosition);
                print(yPosition);
              });
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  gradient: widget.backgroundGradient,
                  borderRadius: BorderRadius.circular(widget.borderRadius)),
              child: widget.withIcon
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  titleIcon == null ? Container() : titleIcon,
                  Container(
                    margin: titleIcon == null ? EdgeInsets.only(left: 0) : EdgeInsets.only(left: 5),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: widget.titleColor,
                          fontSize: widget.titleSize),
                    ),
                  )
                ],
              )
                  : Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.titleSize),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void generateItems() {
    for (int i = 0; i < widget.items.length; i++) {
      itemList.add(Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print(widget.items[i]);
            setState(() {
              widget.onChange(widget.items[i].toString());
              clicked = false;
            });
          },
          child: Container(
            margin: i == widget.items.length - 1
                ? EdgeInsets.only(left: 5, bottom: 10)
                : EdgeInsets.only(left: 5),
            width: widget.width,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.items[i],
                    style: TextStyle(
                        color: widget.itemColor, fontSize: widget.itemSize),
                  ),
                )),
          ),
        ),
      ));
    }
    print(itemList[0].child);
  }
  void generateIconItems() {
    for (int i = 0; i < widget.items.length; i++) {
      itemList.add(Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              print(widget.items[i]);
              setState(() {
                widget.onChange(widget.items[i].toString());
                titleIcon = Icon(
                  widget.iconList[i],
                  color: Colors.white,
                  size: widget.iconSize,
                );
                clicked = false;
              });
            },
            child: Row(
              children: [
                Container(
                  margin: i == widget.items.length - 1
                      ? EdgeInsets.only(left: 5, bottom: 10)
                      : EdgeInsets.only(left: 5),
                  child: Icon(
                    widget.iconList[i],
                    color: widget.iconColor,
                    size: widget.iconSize,
                  ),
                ),
                Container(
                  margin: i == widget.items.length - 1
                      ? EdgeInsets.only(left: 5, bottom: 10, right: 10)
                      : EdgeInsets.only(left: 5, right: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.items[i],
                          style: TextStyle(
                              color: widget.itemColor, fontSize: widget.itemSize),
                        ),
                      )),
                ),
              ],
            )),
      ));
    }
  }
}
