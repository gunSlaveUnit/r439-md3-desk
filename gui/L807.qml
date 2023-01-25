import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: l807
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 2
            columns: 2

            TextMD3 {text: qsTr("Стык Л807:")}
            ComboBoxMD3 {
                model: l807.joint_modes
                onCurrentIndexChanged: {l807.joint = currentIndex}
            }
            TextMD3 {text: qsTr("Источник сигнала: ")}
            ComboBoxMD3 {
                model: l807.signal_source_modes
                onCurrentIndexChanged: {l807.signal_source = currentIndex}
            }
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
    }
}