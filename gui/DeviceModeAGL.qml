import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 4
            columns: 2

            TextMD3 {text: qsTr("Режим работы ЗС")}
            ComboBoxMD3 {model: [qsTr("ППРЧ непрерывный"), qsTr("ПР")]}

            TextMD3 {text: qsTr("Скор ГС ПРМ кбит/c")}
            ComboBoxMD3 {model: [qsTr("нет ГС"), 6]}

            TextMD3 {text: qsTr("Скор ГС ПРД кбит/c")}
            ComboBoxMD3 {model: [qsTr("нет ГС"), 6]}

            TextMD3 {text: qsTr("Режим РАТС")}
            ComboBoxMD3 {model: [qsTr("отсутствует")]}
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}