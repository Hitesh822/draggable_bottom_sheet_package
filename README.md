This package contains a helper class to create a bottom sheet, which persists on the screen & can be dragged from there to cover the full screen.

![Draggable Bottom Sheet gif](https://github.com/Hitesh822/draggable_bottom_sheet_package/blob/master/assets/ezgif.com-gif-maker.gif)

### Example
```
DraggableBottomSheet(
    minExtent: 150,
    useSafeArea: false,
    previewWidget: _previewWidget(),
    expandedWidget: _expandedWidget(),
    backgroundWidget: _backgroundWidget(),
    maxExtent: MediaQuery.of(context).size.height * 0.8,
    onDragging: (pos) {},
),
```

### Arguments
| Argument           | Value     | Description                                                                                       |
|--------------------|-----------|---------------------------------------------------------------------------------------------------| 
| alignment          | Alignment | Alignment of the sheet                                                                            |
| backgroundWidget   | Widget    | Widget above which draggable sheet will be placed.                                                |
| barrierColor       | Color     | Color of the modal barrier. Default Colors.black54                                                |
| barrierDismissible | bool      | Collapse bottom sheet on tap. If false, sheet will act as persistent sheet. Default true.         |
| expandedWidget     | Widget    | Widget to show on expended sheet                                                                  |
| expansionExtent    | double    | Increment on [minExtent] to change from [previewWidget] to [expandedWidget]                       |
| collapsed          | bool      | Whether the sheet is collapsed initially. Default true.                                           |
| maxExtent          | double    | Maximum extent for sheet expansion                                                                |
| minExtent          | double    | Minimum extent for the sheet                                                                      |
| onDragging         | Function  | Callback function when sheet is being dragged                                                     |
| previewWidget      | Widget    | Widget to show on collapsed sheet                                                                 |
| useSafeArea        | bool      | Should dialog only display in 'safe' areas of the screen. Default true                            |

### Contributors
| [![](https://avatars.githubusercontent.com/u/29130291?v=4&size=50)](https://github.com/themisir) | [![](https://avatars.githubusercontent.com/u/495355?v=4&size=50)](https://github.com/jr00n) |
| -------------- | ------------- |
| Misir Jafarov  | Jeroen Wolff  |