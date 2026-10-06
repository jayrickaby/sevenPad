import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./"

Column {
    id: control

    property Component delegate: SimpleComboBoxDelegate {}
    property int currentIndex
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

        property bool isUserTyping: false

        width: parent.width

        onTextEdited: {
            // So text isn't autofilled while the user is typing
            isUserTyping = true;
            view.currentIndex = findFirstMatch(text)
            isUserTyping = false;
        }
    }
    ListView {
        id: view

        height: 140
        width: parent.width

        rightMargin: scrollBar.visible ? scrollBar.width : 0

        clip: true
        currentIndex: control.currentIndex
        delegate: control.delegate
        model: control.model

        highlightMoveDuration : 500

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
        }

        onCurrentIndexChanged: {
            control.currentIndex = currentIndex;

            // So text isn't autofilled while the user is typing
            if (!input.isUserTyping) {
                input.text = model[currentIndex];
            }
        }
    }
}

