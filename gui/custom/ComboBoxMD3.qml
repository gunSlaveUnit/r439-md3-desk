import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

ComboBox {
  font.pointSize: 10

  delegate: ItemDelegate {
    text: modelData
    width: parent.width
    font.pointSize: 10

    contentItem: Text {
      text: modelData
      color: "#d4a009"
      font: control.font
      elide: Text.ElideRight
      verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
      anchors.fill: parent
      color: hovered ? "#d4a009" : "black"
    }
  }

  contentItem: Text {
    text: control.displayText
    color: "#d4a009"
  }

  background: Rectangle {
    anchors.fill: parent
    color: "transparent"
    border.width: 1
    implicitWidth: 50
    border.color: "#d4a009"

    Image {
      anchors.margins: 4
      anchors.right: parent.right
      width: height * 0.9
      height: parent.height - 8
      anchors.verticalCenter: parent.verticalCenter
      mipmap: true
      source: "../../resources/dropdown.png"
    }
  }
}