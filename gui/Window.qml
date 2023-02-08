import QtQuick 2.15
import QtQuick.Layouts 2.15

Window {
    id: main_window
    width: 1200
    height: 600
    visible: true
    title: qsTr("MD3Desk")

    GridLayout {
        rows: 2
        columns: 2
        anchors.margins: 8
        columnSpacing: 16

        Keyboard {}
    }
}