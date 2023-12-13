import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
	hoverEnabled: false

	property string backgroundColor: "#aeada8"
	property var textVerticalAlignment: Text.AlignVCenter

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:textVerticalAlignment
        text: parent.text
        color: "#000"
    }

    background: Rectangle {
        id: back
        anchors.fill: parent
        implicitWidth: 64
        implicitHeight: implicitWidth
        radius: 8
        border.color: "black"
        border.width: 4
        color: backgroundColor

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = Qt.darker(backgroundColor, 1.5)
            onExited: parent.color = backgroundColor
	    }
    }
}