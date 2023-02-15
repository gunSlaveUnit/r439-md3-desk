import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
    Layout.preferredWidth: 240
    Layout.preferredHeight: 30
    
    contentItem: Text {
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: parent.text
        color: "#ffaf00"
    }

    background: Rectangle {
        color: "transparent"
        border.width: 2
        border.color: "#ffaf00"
    }
}