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

    GridLayout {
        anchors.fill: parent
        columns: 3

        columnSpacing: 16
        rowSpacing: 16

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

        SimpleComboBox {
            id: pointSelector

            // Prevent layout stretching
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredWidth: 63
            Layout.preferredHeight: 151

            model: DocumentStyling.getAvailableSizes();

            title: qsTr("&Size:")
        }

        // Spacer Item
        Item {}

        GroupBox {
            id: stylePreview

            Layout.columnSpan: 2
            Layout.fillWidth: true

            title: qsTr("Sample")

            Label {
                anchors.fill: parent

                font.family: DocumentStyling.font
                font.styleName: DocumentStyling.fontStyle
                font.pointSize: DocumentStyling.fontSize
                text: "AaBbYyZz"
            }
        }
    }

    Component.onCompleted: {
        // Replicates window behaviour
        fontSelector.textField.forceActiveFocus();
    }
}