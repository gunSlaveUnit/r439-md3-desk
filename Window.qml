import QtQuick 2.15
import QtQuick.Layouts 2.15

Window {
    width: 1200
    height: 600
    visible: true
    title: qsTr("MD3Desk")

    GridLayout {
        rows: 2
        columns: 2
        anchors.fill: parent

        Display {Layout.row: 1; Layout.column: 0}

        Keyboard {Layout.row: 1; Layout.column: 1}
    }
}