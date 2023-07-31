import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
	hoverEnabled: false

	property bool hoverable: true

  contentItem: Text {
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: parent.text
    font.pointSize: 14
    color: "#d4a009"
    font.bold: true
  }

  background: Rectangle {
    color: "transparent"
    border.width: 1
    border.color: "#d4a009"

    Rectangle {
      id: dottedSelectionBorder
      visible: false
      anchors.fill: parent
      anchors.margins: 3
      color: "transparent"
	    border.width: 1
	    border.color: "#d4a009"
    }

    MouseArea {
	    anchors.fill: parent
	    hoverEnabled: hoverable
	    onEntered: dottedSelectionBorder.visible = true
	    onExited: dottedSelectionBorder.visible = false
	  }
  }
}