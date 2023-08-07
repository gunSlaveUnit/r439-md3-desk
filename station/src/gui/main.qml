import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 400
    height: 300
    visible: true
    title: qsTr("R439-MD3 Desktop")

    GridLayout {
        rows: 2
        columns: 2

        Button {
            Layout.fillWidth: true
            text: qsTr("Информация")
            onClicked: information.visible = true
        }

        Text {text: qsTr("Назначение, ТТХ, состав")}

        Button {
            Layout.fillWidth: true
            text: qsTr("Эмулятор")
            onClicked: emulator.visible = true
        }

        Text {text: qsTr("Тренажер и среда для сдачи нормативов")}
    }

    Information {id: information}

    Emulator {id: emulator}
}