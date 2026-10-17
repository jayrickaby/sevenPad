import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import jayrickaby.sevenPad

import "../Actions/Window"
import "../Controls"

Window {
    id: control

    property int currentSize: DocumentStyling.fontSize
    property string currentFamily: DocumentStyling.fontFamily
    property string currentScript: DocumentStyling.fontScript
    property string currentStyle: DocumentStyling.fontStyle

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

            model: DocumentStyling.getFontSizes(currentFamily, currentStyle);

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

        // Spacer Item
        Item {}

        ComboBox {
            id: scriptSelector

            Layout.columnSpan: 2
            Layout.fillWidth: true

            // TODO: Enable when a viable way of choosing scripts is figured
            enabled: false

            model: DocumentStyling.getFontScripts(currentFamily)

            onCurrentIndexChanged: {
                currentScript = scriptSelector.model[scriptSelector.currentIndex]
            }
        }

        Label {
            readonly property string rawText: qsTr("Show more fonts")

            Layout.fillWidth: true

            text: `<a href="exec">${rawText}</a>`

            onLinkActivated: FontSettingsExecutable.run();
        }

        // Spacer Item
        Item {
            Layout.columnSpan: 2
        }


        RowLayout {
            Layout.alignment: Qt.AlignRight
            Layout.columnSpan: 3
            Layout.fillWidth: true

            Button {
                text: "OK"

                onPressed: {
                    DocumentStyling.fontFamily = currentFamily;
                    DocumentStyling.fontScript = currentScript;
                    DocumentStyling.fontSize = currentSize;
                    DocumentStyling.fontStyle = currentStyle;
                    actionClose.trigger();
                }
            }

            Button {
                text: "Cancel"

                onPressed: {
                    actionClose.trigger();
                }
            }
        }
    }

    CloseAction {
        id: actionClose

        window: control
    }

    Component.onCompleted: {
        // Replicates window behaviour
        fontSelector.textField.forceActiveFocus();
    }
}