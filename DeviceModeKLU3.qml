import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        GridLayout {
            rows: 8
            columns: 2

            Text {text: qsTr("Тестпроверка:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Режим теста:")}
            ComboBox {model: [qsTr("ПР")]}

            Text {text: qsTr("ПРД 70:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Сброс счетчика ошибок:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Служебный 1:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Служебный 2:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Тип сигнала ПРД:")}
            ComboBox {model: [qsTr(""), qsTr("УП (ППРЧ)")]}

            Text {text: qsTr("Ft ПСП ШПС ПРД:")}
            ComboBox {model: [qsTr(Ft2)]}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = 2}}
    }
}