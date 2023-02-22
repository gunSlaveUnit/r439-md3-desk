import QtQuick 2.15
import QtQuick.Layouts 2.15

Window {
    id: main_window
    width: 1146
    height: 472
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    visible: true
    title: qsTr("MD3Desk")

    GridLayout {
        rows: 1
        columns: 2
        anchors.fill: parent

        Column {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.45

            Rectangle {
                anchors.fill: parent
                border.width: 8
                border.color: "#484848"
                color: "#000"

                Display {Layout.fillHeight: true}
            }
        }

        Column {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.55

            Keyboard {Layout.fillHeight: true}
        }
    }
}