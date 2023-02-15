import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: parent.text
        font.pointSize: 14
        color: "#000"
        anchors.margins: 8
    }

    background: Rectangle {
        id: back
        anchors.fill: parent
        implicitWidth: 72
        implicitHeight: implicitWidth
        radius: 8
        border.color: "#000"
        border.width: 4
        color: "#b4afac"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: parent.background.color = Qt.darker("#b4afac", 1.2)
        onExited: parent.background.color = "#b4afac"
    }
}