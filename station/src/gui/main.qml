import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
  width: 400
  height: 300
  visible: true
  title: qsTr("R439-MD3 Desktop")

  ColumnLayout {
    Button {
      text: qsTr("Information")
      onClicked: information.visible = true
    }

    Button {
      text: qsTr("Emulator")
      onClicked: emulator.visible = true
    }
  }

  Information {id: information}

  Emulator {id: emulator}
}