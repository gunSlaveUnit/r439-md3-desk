import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

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
            ComboBox {model: [qsTr(0)]}

            Text {text: qsTr("Номер подключа ПРД:")}
            ComboBox {model: [qsTr(1)]}

            Text {text: qsTr("Ft ПСП ПРД:")}
            ComboBox {model: [qsTr("Ft2")]}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = 2}}
    }
}