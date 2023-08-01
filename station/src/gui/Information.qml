import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 400
    height: 300
    visible: false
    title: qsTr("R439-MD3 Station Information")

    StackLayout {
        id: informationMenuStack

        property int choiceDirection: 0

        ColumnLayout {
            Button {
                text: qsTr("Appointment")
            }

            Button {
                text: qsTr("Composition")
            }

            Button {
                text: qsTr("Tactical technical characteristics")
            }
        }

        ColumnLayout {
            Button {
                text: qsTr("Back")
                onClicked: informationMenuStack.currentIndex = informationMenuStack.choiceDirection
            }
        }
    }
}