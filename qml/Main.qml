import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import jayrickaby.sevenPad

import "./Components"

ApplicationWindow {
    id: root

    // 3/4 of available screen  on first open
    // TODO: Save and restore on open
    width: 1440
    height: 762

    // TODO: Save and restore on open
    x: 50
    y: 50

    title: mainTitle();
    visible: true

    function mainTitle() {
        let base = FileManager.currentFileName;

        if (FileManager.currentFileModified) {
            base += "*";
        }

        return base;
    }
    menuBar: NotepadMenuBar {
        id: menuBar

        file.open.dialog: openDialog
    }

    NotepadDocument {
        id: document

        anchors.fill: parent
    }

    FileDialog {
        id: openDialog

        onAccepted: {
            FileManager.currentFilePath = openDialog.selectedFile;
        }
    }

    FontWindow {
        id: fontWindow

        width: 441
        height: 477

        modality: Qt.WindowModal

        visible: false
    }

    footer: NotepadStatusBar {
        id: statusBar
    }

    function openFontSelector() {
        fontWindow.show();
    }
}
