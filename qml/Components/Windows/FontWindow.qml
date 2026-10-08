import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import jayrickaby.sevenPad

import "../Controls"

Window {
    id: control

    property string currentFamily: DocumentStyling.fontFamily
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
        anchors.margins: 16

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

            model: DocumentStyling.getFontFamilies()

            title: qsTr("&Font:")

            onCurrentIndexChanged: {
                currentFamily = fontSelector.model[fontSelector.currentIndex];
                styleSelector.currentIndex = styleSelector.findFirstMatch(DocumentStyling.getDefaultStyle());
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

            currentIndex: currentStyle ? findFirstMatch(currentStyle) : findFirstMatch(DocumentStyling.getDefaultStyle)

            delegate: SimpleComboBoxDelegate {
                font.family: currentFamily
                font.styleName: modelData;
            }

            model: DocumentStyling.getFontStyles(currentFamily);

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

            topPadding: 16
            bottomPadding: 0

            clip: true

            Layout.alignment: Qt.AlignTop
            Layout.columnSpan: 2
            Layout.fillWidth: true

            // Prevent layout stretching
            Layout.fillHeight: false
            Layout.preferredHeight: 81

            title: qsTr("Sample")

            Label {
                anchors.fill: parent

                clip: true

                font.family: currentFamily
                font.styleName: currentStyle
                font.pointSize: currentSize

                text: "AaBbYyZz"
                horizontalAlignment: contentWidth >= parent.width ? Text.AlignLeft : Text.AlignHCenter
                // TODO: The bottom of a standard glyph, e.g. 'a', should be aligned with the bottom
                // horizontalAlignment: contentHeight >= parent.height ? Text.AlignBottom : Text.AlignVCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Component.onCompleted: {
        // Replicates window behaviour
        fontSelector.textField.forceActiveFocus();
    }
}