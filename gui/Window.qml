import QtQuick 2.15
import QtQuick.Layouts 2.15

Window {
    id: main_window
    width: 1250
    height: 930
    visible: true
    title: qsTr("MD3Desk")

    GridLayout {
        rows: 1
        columns: 2
        anchors.fill: parent
        anchors.margins: 8
        columnSpacing: 16

        Display {
        }

        Keyboard {
        }
    }
}