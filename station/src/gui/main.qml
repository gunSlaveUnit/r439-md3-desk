import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
  width: 400
  height: 300
  visible: true
  title: qsTr("R439-MD3 Desktop Station")

  Button {
    text: qsTr("Emulator")
    onClicked: emulator.visible = true
  }

  Emulator {id: emulator}
}