import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "./custom"

Window {
    id: mainWindow

    property int defaultMargin: 8
    property int doubleDefaultMargin: 2 * defaultMargin

    minimumWidth: mainLayout.implicitWidth + doubleDefaultMargin
    minimumHeight: mainLayout.implicitHeight + doubleDefaultMargin
    width: minimumWidth
    height: minimumHeight
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: false
    title: qsTr("Р439-МД3")

    ColumnLayout {
        id: mainLayout

        anchors.centerIn: parent

        GridLayout {
            id: startButtonsLayout

            rows: 2
            columns: 2

            Button {
                Layout.fillWidth: true
                text: qsTr("Информация")
                onClicked: information.show()
            }

            Text {text: qsTr("Назначение, ТТХ, состав")}

            Button {
                Layout.fillWidth: true
                text: qsTr("Эмулятор")
                onClicked: emulator.show()
            }

            Text {text: qsTr("Тренажер и среда для сдачи нормативов")}

            Button {
                Layout.fillWidth: true
                text: qsTr("Настройки")
                onClicked: settings.show()
            }

            Text {text: qsTr("Изменить опции приложения")}

            Button {
                Layout.fillWidth: true
                text: qsTr("Справка")
                onClicked: reference.show()
            }

            Text {text: qsTr("О приложении")}
        }

        Separator {}

        RowLayout {
            Image {
                Layout.preferredWidth: parent.implicitHeight
                Layout.preferredHeight: parent.implicitHeight
                fillMode: Image.PreserveAspectFit
                mipmap: true
                source: "../../resources/VUCLogo.png"
            }

            Text {text: qsTr("ВУЦ ИГЭУ")}

            Item {Layout.fillWidth: true}

            Button {text: qsTr("Выйти"); onClicked: mainWindow.close()}
        }
    }

    Information {id: information}

    Emulator {id: emulator}

    Settings {id: settings}

    Reference {id: reference}
}