import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "./custom"

Window {
  property int defaultMargin: 8

  width: 1000
  height: 500
  x: Screen.width / 2 - width / 2
  y: Screen.height / 2 - height / 2
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
      id: choiceTrainingOrExamPage

      function checkUserAuthorization() {
        
      }

      Button {
        text: qsTr("Training")
        onClicked: {
          configuration.is_training = true
          emulatorMenuStack.currentIndex = emulatorMenuStack.emulatorPageIndex
        }
      }

      Button {
        text: qsTr("Exam")
        onClicked: {
          configuration.is_training = false
          choiceTrainingOrExamPage.checkUserAuthorization()
        }
      }

      Button {
        text: qsTr("Back")
        onClicked: emulatorMenuStack.currentIndex = emulatorMenuStack.choiceNormPageIndex
      }
    }

    GridLayout {
			anchors.fill: parent
	    anchors.margins: defaultMargin

	    rows: 2
	    columns: 2

	    Rectangle {
	      width: 400
	      height: 300
	      color: "black"
	      border.width: defaultMargin
	      border.color: "#49494B"

	      Rectangle {
	        anchors.fill: parent
	        anchors.margins: defaultMargin
	        color: "transparent"
	        border.width: defaultMargin / 2
	        border.color: "#d4a009"
	      }
	    }
    }
  }
}