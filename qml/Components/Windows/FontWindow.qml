import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import jayrickaby.sevenPad

import "../Controls"

Window {
    id: control

    property string currentFamily: DocumentStyling.font
    property string currentStyle: DocumentStyling.fontStyle
    property int currentSize: DocumentStyling.fontSize

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

            currentIndex: findFirstMatch(currentFamily)

            delegate: SimpleComboBoxDelegate {
                font.family: modelData;
            }

            model: DocumentStyling.getAvailableFonts()

            title: qsTr("&Font:")

            onCurrentIndexChanged: {
                currentFamily = fontSelector.model[fontSelector.currentIndex];
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

            currentIndex: findFirstMatch(currentStyle)

            delegate: SimpleComboBoxDelegate {
                font.family: DocumentStyling.font
                font.styleName: modelData;
            }

            model: DocumentStyling.getFontStyles(DocumentStyling.font);

            title: qsTr("Font St&yle:")

            onCurrentIndexChanged: {
                currentStyle = styleSelector.model[styleSelector.currentIndex];
            }
        }

        SimpleComboBox {
            id: pointSelector

            // Prevent layout stretching
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredWidth: 63
            Layout.preferredHeight: 151

            currentIndex: findFirstMatch(currentSize)

            model: DocumentStyling.getAvailableSizes();

            title: qsTr("&Size:")

            onCurrentIndexChanged: {
                currentSize = pointSelector.model[pointSelector.currentIndex];
            }
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

                font.family: currentFamily
                font.styleName: currentStyle
                font.pointSize: currentSize
                text: "AaBbYyZz"
            }
        }
    }

    Component.onCompleted: {
        // Replicates window behaviour
        fontSelector.textField.forceActiveFocus();
    }
}