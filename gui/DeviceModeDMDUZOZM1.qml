import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 7
            columns: 2

            Text {text: qsTr("Тип радиосигнала ПРМ:")}
            ComboBox {model: [qsTr("УП")]}

            Text {text: qsTr("Декодер:")}
            ComboBox {model: [qsTr("K=5; R=1/2"), qsTr("Откл.")]}

            Text {text: qsTr("Скорость ДМД, кбит/с:")}
            ComboBox {model: [qsTr(""), qsTr("6")]}

            Text {text: qsTr("Режим ДМД:")}
            ComboBox {model: [qsTr("Работа")]}

            Text {text: qsTr("Скорость ПРД УЗОЗМ, кбит/с:")}
            ComboBox {model: [qsTr("1,5 ОФТ")]}

            Text {text: qsTr("Режим УЗОЗМ:")}
            ComboBox {model: [qsTr("Работа")]}

            Text {text: qsTr("Служебный канал в ФТ4:")}
            ComboBox {model: [qsTr("1,2 кБод")]}

        }

        RowLayout {
            Button {text: qsTr(">"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_2_PAGE}}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}