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
    property int emulatorPageIndex: 2

    ColumnLayout {
      Button {
        text: qsTr("Free mode")
        onClicked: {
          configuration.selected_norm = free_mode
          emulatorMenuStack.currentIndex = emulatorMenuStack.emulatorPageIndex
        }
      }

      Button {
        text: qsTr("Small loop in the direct relay mode")
        onClicked: {
          configuration.selected_norm = small_plume_norm
          emulatorMenuStack.currentIndex = emulatorMenuStack.choiceTrainingOrExamPageIndex
        }
      }
    }

    ColumnLayout {
      Button {
        text: qsTr("Training")
        onClicked: {
          configuration.is_training = true
          emulatorMenuStack.currentIndex = emulatorMenuStack.emulatorPageIndex
        }
      }

      Button {
        text: qsTr("Exam")
        onClicked: configuration.is_training = false
      }

      Button {
        text: qsTr("Back")
        onClicked: emulatorMenuStack.currentIndex = emulatorMenuStack.choiceNormPageIndex
      }
    }

    GridLayout {
      // TODO: let's go to write an emulator
      Text {text: "Yes"}
    }
  }
}