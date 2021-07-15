import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

import com.uit.notepad 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Notepad {
        id: notepad
        onPathChanged: console.log("path changed: ", path)
        onDataChanged: console.log("data: ", path)
    }

    FileDialog{
        id: openfile
        title: "Chon file"
        folder: shortcuts.home
        selectMultiple: false
        selectExisting: true

        onAccepted: {
            notepad.path = openfile.fileUrl
            editArea.text = notepad.data
        }
    }
    FileDialog{
        id: savefile
        title: "Chon file"
        folder: shortcuts.home
        selectMultiple: false
        selectExisting: false

        onAccepted: {
            notepad.path = savefile.fileUrl
            notepad.data = editArea.text
        }
    }

    Action {
        id: actNew
        text: qsTr("New")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oNew.png"
        onTriggered: editArea.clear()
    }
    Action {
        id: actOpen
        text: qsTr("Open")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oOpen.png"
        onTriggered: openfile.open()
    }
    Action {
        id: actSave
        text: qsTr("Open")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oSave.png"
        onTriggered: savefile.open()
    }
    Action {
        id: actCopy
        text: qsTr("Copy")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oCopy.png"
        onTriggered: editArea.cut()
    }
    Action {
        id: actCut
        text: qsTr("Cut")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oCut.png"
        onTriggered: editArea.copy()
    }
    Action {
        id: actPaste
        text: qsTr("Paste")
        icon.color: "transparent"
        icon.source: "qrc:/icon/oPaste.png"
        onTriggered: editArea.paste()
    }

    menuBar: MenuBar {
        Menu {
            id: menuFile
            title: qsTr("File")
            MenuItem {
                action: actNew
            }
            MenuItem {
                action: actOpen
            }
            MenuItem {
                action: actSave
            }
        }
        Menu {
            id: menuEdit
            title: qsTr("Edit")
            MenuItem {
                action: actCopy
            }
            MenuItem {
                action: actCut
            }
            MenuItem {
                action: actPaste
            }
        }
    }

    header: ToolBar {
        Row {
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actNew
            }
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actOpen
            }
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actSave
            }
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actCopy
            }
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actCut
            }
            ToolButton{
                display: AbstractButton.IconOnly;
                action: actPaste
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        TextArea {
            id: editArea
            focus: true
            selectByMouse: true
            text: "Hello world"
            persistentSelection: true
        }
    }
}
