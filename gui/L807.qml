import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 2
            columns: 2

            TextMD3 {text: qsTr("Стык Л807:")}
            ComboBoxMD3 {model: [qsTr("Выключен")]}
            TextMD3 {text: qsTr("Источник сигнала: ")}
            ComboBoxMD3 {model: [qsTr("АГ-Л")]}
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
    }
}