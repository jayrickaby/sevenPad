import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import jayrickaby.sevenPad

import "../Controls"

Window {
    id: control

    maximumWidth: width
    maximumHeight: height

    minimumWidth: width
    minimumHeight: height

    title: "Font"

    flags: Qt.Dialog

    RowLayout {
        anchors.fill: parent

        spacing: 16

        SimpleComboBox {
            id: fontSelector

            // Prevent layout stretching
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredWidth: 172
            Layout.preferredHeight: 160

            currentIndex: findFirstMatch(DocumentStyling.font)

            delegate: SimpleComboBoxDelegate {
                font.family: modelData;
            }

            model: DocumentStyling.getAvailableFonts()

            title: qsTr("&Font:")

            onCurrentIndexChanged: {
                DocumentStyling.font = fontSelector.model[fontSelector.currentIndex];
            }
        }

        SimpleComboBox {
            id: styleSelector

            // Prevent layout stretching
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredWidth: 131
            Layout.preferredHeight: 160

            delegate: SimpleComboBoxDelegate {
                font.family: DocumentStyling.font
                font.styleName: modelData;
            }

            model: DocumentStyling.getFontStyles(DocumentStyling.font);

            title: qsTr("Font St&yle:")
        }
    }

    Component.onCompleted: {
        // Replicates window behaviour
        fontSelector.textField.forceActiveFocus();
    }
}