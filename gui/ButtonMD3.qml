import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: parent.text
        font.pointSize: 12
        color: "#000"
        anchors.margins: 8
    }

    background: Rectangle {
        anchors.fill: parent
        implicitWidth: 72
        implicitHeight: implicitWidth
        radius: 8
        border.color: "#000"
        border.width: 4
        color: "#b4afac"
    }
}