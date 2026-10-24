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

        // TODO: I don't believe this is in Windows 7. Make it toggleable.
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

        title: qsTr("Open")

        nameFilters: ["Text Documents (*.txt)", "All Files (*.*)"]

        onAccepted: {
            FileManager.currentFilePath = openDialog.selectedFile;
        }
    }

    FileDialog {
        id: saveAsDialog

        title: qsTr("Save As")

        fileMode: FileDialog.SaveFile

        defaultSuffix: "*.txt"
        nameFilters: ["Text Documents (*.txt)", "All Files (*.*)"]

        onAccepted: {
            FileManager.saveAs(saveAsDialog.selectedFile, document.text)
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
        // TODO: Reset upon opening
        fontWindow.show();
    }
}
