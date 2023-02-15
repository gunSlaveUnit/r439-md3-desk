import QtQuick 2.15
import QtQuick.Layouts 2.15

Window {
    id: main_window
    width: 1250
    height: 480
    visible: true
    title: qsTr("MD3Desk")

    GridLayout {
        rows: 2
        columns: 2
        anchors.fill: parent
        anchors.margins: 8
        columnSpacing: 16

        Display {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Keyboard {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}