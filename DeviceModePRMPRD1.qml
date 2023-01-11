import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 5
            columns: 2

            Text {text: qsTr("Автоконтроль CAN:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Поддиппазон приема:")}
            ComboBox {model: [qsTr("1")]}

            Text {text: qsTr("Генератор сдвига:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Ствольный фильтр:")}
            ComboBox {model: [qsTr("1")]}

            Text {text: qsTr("Усилитель мощности:")}
            ComboBox {model: [qsTr("Откл.")]}
        }

        RowLayout {
            Button {text: qsTr(">"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_2_PAGE}}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}