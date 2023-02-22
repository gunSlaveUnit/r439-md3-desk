import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 5
            columns: 2

            Text {text: qsTr("Вид сигнала ПРД:")}
            ComboBox {model: [qsTr("Спец. ГС")]}

            Text {text: qsTr("Код Баркера ПРД:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Номер ключа ПРД:")}
            ComboBox {model: [0]}

            Text {text: qsTr("Номер подключа ПРД:")}
            ComboBox {model: [1]}

            Text {text: qsTr("Ft ПСП ПРД:")}
            ComboBox {model: [qsTr("Ft2")]}
        }

        RowLayout {
            Button {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_1_PAGE}}
            Button {text: qsTr(">"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_3_PAGE}}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}