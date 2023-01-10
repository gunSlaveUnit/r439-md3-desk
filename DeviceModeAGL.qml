import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        GridLayout {
            rows: 4
            columns: 2

            Text {text: qsTr("Режим работы ЗС")}
            ComboBox {model: [qsTr("ППРЧ непрерывный"), qsTr("ПР")]}

            Text {text: qsTr("Скор ГС ПРМ кбит/c")}
            ComboBox {model: [qsTr("нет ГС"), qsTr("6")]}

            Text {text: qsTr("Скор ГС ПРД кбит/c")}
            ComboBox {model: [qsTr("нет ГС"), qsTr("6")]}

            Text {text: qsTr("Режим РАТС")}
            ComboBox {model: [qsTr("отсутствует")]}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = 3}}
    }
}