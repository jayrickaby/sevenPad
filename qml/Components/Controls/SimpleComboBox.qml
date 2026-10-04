import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: control

    property string title

    Label {
        id: label
        text: control.title
    }

    TextField {
        id: input
        width: parent.width

    }
    ScrollView {
        height: 140
        width: parent.width

        ListView {
            model: ListModel {
                ListElement { name: "Lucida Console" }
                ListElement { name: "Lucida Sans Unicode" }
                ListElement { name: "Microsoft Sans Serif" }
                ListElement { name: "Modern" }
            }
            delegate: ItemDelegate {
                required property string name
                width: ListView.view.width
                text: name
            }
        }
    }
}

