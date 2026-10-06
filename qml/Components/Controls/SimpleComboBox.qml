import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./"

Column {
    id: control

    property Component delegate: SimpleComboBoxDelegate {}
    property int currentIndex
    property string textRole
    property string title
    property var model

    function findFirstMatch(rawText) {
        if (!model || rawText === "") {
            return 0;
        }

        let text = rawText.toLowerCase();

        for (let i = 0; i < model.length; i++) {
            var item = model[i].toLowerCase();

            if (item.startsWith(text)) {
                return i;
            }
        }

        return 0;
    }

    Label {
        id: label
        text: control.title
    }

    TextField {
        id: input
        width: parent.width

        onTextChanged: {
            control.currentIndex = findFirstMatch(text)
        }
    }
    ListView {
        id: view

        height: 140
        width: parent.width
        model: control.model
        currentIndex: control.currentIndex

        rightMargin: scrollBar.visible ? scrollBar.width : 0

        clip: true

        delegate: control.delegate

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
        }
    }
}

