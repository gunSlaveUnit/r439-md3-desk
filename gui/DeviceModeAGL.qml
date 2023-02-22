import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: agl
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 4
            columns: 2

            TextMD3 {text: qsTr("Режим работы ЗС")}
            ComboBoxMD3 {
                model: agl.zs_operating_mode_variants
                onCurrentIndexChanged: {agl.zs_operating_mode = currentIndex}
            }

            TextMD3 {text: qsTr("Скор ГС ПРМ кбит/c")}
            ComboBoxMD3 {
                model: agl.speed_gs_prm_variants
                onCurrentIndexChanged: {agl.speed_gs_prm = currentIndex}
            }

            TextMD3 {text: qsTr("Скор ГС ПРД кбит/c")}
            ComboBoxMD3 {
                model: agl.speed_gs_prd_variants
                onCurrentIndexChanged: {agl.speed_gs_prd = currentIndex}
            }

            TextMD3 {text: qsTr("Режим РАТС")}
            ComboBoxMD3 {
                model: agl.rats_mode_variants
                onCurrentIndexChanged: {agl.rats_mode = currentIndex}
            }
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}