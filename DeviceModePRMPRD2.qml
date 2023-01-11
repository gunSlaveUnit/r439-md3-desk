import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 6
            columns: 2

            Text {text: qsTr("Тип радиосигнала:")}
            ComboBox {model: [qsTr("УП")]}

            Text {text: qsTr("Вид сигнала ОФТ:")}
            ComboBox {model: [qsTr("ОФТ")]}

            Text {text: qsTr("Скорость ЗС:")}
            ComboBox {model: [qsTr("6,0")]}

            Text {text: qsTr("Выход У205Д:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Номер волны ПРД:")}
            ComboBox {model: [qsTr("0")]}

            Text {text: qsTr("Номер волны ПРМ:")}
            ComboBox {model: [qsTr("2500")]}
        }

        RowLayout {
            Button {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_1_PAGE}}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}