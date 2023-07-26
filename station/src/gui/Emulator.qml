import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
  width: 400
  height: 300
  visible: false
  title: qsTr("R439-MD3 Station Emulator")

  StackLayout {
    id: emulatorMenuStack

    property int choiceNormPageIndex: 0
    property int choiceTrainingOrExamPageIndex: 1


  }
}