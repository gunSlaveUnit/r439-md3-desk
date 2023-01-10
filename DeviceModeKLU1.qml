import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        GridLayout {
            rows: 8
            columns: 2

            Text {text: qsTr("Вид сигнала ПРМ:")}
            ComboBox {model: [qsTr("Спец. ГС")]}

            Text {text: qsTr("Код Баркера ПРМ:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Инверсия кода Баркера:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("ДСЧ:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Номер ключа ПРМ:")}
            ComboBox {model: [qsTr(0)]}

            Text {text: qsTr("Номер подключа ПРМ:")}
            ComboBox {model: [qsTr(1)]}

            Text {text: qsTr("Полоса поиска ПРМ, кГц:")}
            ComboBox {model: [qsTr("+-1")]}

            Text {text: qsTr("Ft ПСП ПРМ:")}
            ComboBox {model: [qsTr("Ft2")]}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = 2}}
    }
}