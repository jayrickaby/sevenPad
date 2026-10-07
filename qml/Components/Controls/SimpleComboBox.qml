import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./"

ColumnLayout {
    id: control

    property alias textField: input
    property Component delegate: SimpleComboBoxDelegate {}
    property int currentIndex
    property string title
    property var model

    spacing: 0

    function findFirstMatch(rawText) {
        if (!model || !rawText) {
            return 0;
        }

        let text = rawText.toString().toLowerCase();

        if (text === "") {
            return 0;
        }

        for (let i = 0; i < model.length; i++) {
            var item = model[i].toString().toLowerCase();

            if (item.startsWith(text)) {
                return i;
            }
        }

        return 0;
    }

    MnemonicLabel {
        id: label

        Layout.fillWidth: true

        action: function() {
            input.forceActiveFocus();
        }
        rawText: control.title
    }

    TextField {
        id: input

        property bool isUserTyping: false

        Layout.fillWidth: true

        onTextEdited: {
            // So text isn't autofilled while the user is typing
            isUserTyping = true;
            view.currentIndex = findFirstMatch(text)
            isUserTyping = false;
        }

        onActiveFocusChanged: {
            if (activeFocus) {
                selectAll();
            }
        }
    }

    Frame {
        Layout.fillWidth: true
        Layout.fillHeight: true

        padding: 0

        ListView {
            id: view
            anchors.fill: parent

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
}

