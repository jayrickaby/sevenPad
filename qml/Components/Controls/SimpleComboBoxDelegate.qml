import QtQuick
import QtQuick.Controls

ItemDelegate {
    id: control

    required property int index
    required property string modelData

    width: parent.width

    highlighted: ListView.isCurrentItem
    text: modelData

    onClicked: {
        if (ListView.view) {
            ListView.view.currentIndex = index
        }
    }
}