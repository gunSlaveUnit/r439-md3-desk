import QtQuick 2.15
import QtQuick.Layouts 2.15

ColumnLayout {
    anchors.fill: parent
    anchors.margins: 16

    RowLayout {
        Layout.fillWidth: true

        ButtonMD3 {Layout.fillWidth: true; text: qsTr("(. Приборы - авария")}
        ButtonMD3 {Layout.fillWidth: true; text: qsTr("15-02-2023")}
        ButtonMD3 {Layout.fillWidth: true; text: qsTr("11:36:42")}
    }

    RowLayout {
        Layout.fillWidth: true

        ButtonMD3 {Layout.fillWidth: true; text: qsTr("). Обмен")}
        ButtonMD3 {Layout.fillWidth: true; text: qsTr("<. Запрет ПРД")}
        ButtonMD3 {Layout.fillWidth: true; text: qsTr(">. Тракт ПРМ - не норма")}
    }

    StackLayout {
        id: display_stack

        Main {}
    }
}
