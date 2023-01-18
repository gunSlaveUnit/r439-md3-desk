import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 7
            columns: 2

            Text {text: qsTr("Номер фильтра:")}
            ComboBox {model: [qsTr("1"), qsTr("3")]}

            Text {text: qsTr("АРУ:")}
            ComboBox {model: [qsTr("АРУ.")]}

            Text {text: qsTr("Автопоиск:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("АСЧ:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Диф. декодер:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Полоса ДМД:")}
            ComboBox {model: [qsTr("Широкая")]}

            Text {text: qsTr("Корректор:")}
            ComboBox {model: [qsTr("Откл.")]}
        }

        RowLayout {
            Button {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_1_PAGE}}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}