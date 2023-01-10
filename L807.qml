import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 2
            columns: 2

            Text {text: qsTr("Стык Л807:")}
            ComboBox {model: [qsTr("Выключен")]}
            Text {text: qsTr("Источник сигнала: ")}
            ComboBox {model: [qsTr("АГ-Л")]}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
    }
}