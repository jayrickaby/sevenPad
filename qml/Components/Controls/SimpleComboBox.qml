import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: control

    property string title
    property var model
    property string textRole
    property int currentIndex

    Label {
        id: label
        text: control.title
    }

    TextField {
        id: input
        width: parent.width

    }
    ListView {
        id: view

        height: 140
        width: parent.width
        model: control.model
        currentIndex: root.currentIndex

        delegate:  ItemDelegate {
            required property int index
            required property string modelData

            width: view.width - scrollBar.implicitWidth

            highlighted: ListView.isCurrentItem
            text: modelData

            onClicked: view.currentIndex = index
        }

        clip: true

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
        }
    }
}

