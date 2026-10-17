import QtQuick
import QtQuick.Controls

ItemDelegate {
    id: control

    required property int index
    required property string modelData

    property int scrollBarMargin: ListView.view.ScrollBar.vertical.visible ? ListView.view.ScrollBar.vertical.width : 0

    width: parent ? parent.width - scrollBarMargin : 0

    highlighted: ListView.isCurrentItem
    text: modelData

    onClicked: {
        if (!ListView.view) {
            return
        }

        ListView.view.currentIndex = index;
    }
}