import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: tlf1
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent
            columns: 2

            Column {
                TextMD3 {text: qsTr("Тип сигнала ПРМ")}
                ComboBoxMD3 {
                    model: tlf1.signal_prm_types
                    onCurrentIndexChanged: {tlf1.signal_prm_type = currentIndex}
                }

                TextMD3 {text: qsTr("Скорость")}
                ComboBoxMD3 {
                    model: tlf1.prm_speeds
                    onCurrentIndexChanged: {tlf1.prm_speed = currentIndex}
                }

                TextMD3 {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBoxMD3 {
                        model: tlf1.prm_addresses_one
                        onCurrentIndexChanged: {tlf1.prm_address_one = currentIndex}
                    }

                    ComboBoxMD3 {
                        model: tlf1.prm_addresses_two
                        onCurrentIndexChanged: {tlf1.prm_address_two = currentIndex}
                    }

                    ComboBoxMD3 {
                        model: tlf1.prm_addresses_three
                        onCurrentIndexChanged: {tlf1.prm_address_three = currentIndex}
                    }
                }
            }

            Column {
                TextMD3 {text: qsTr("Тип сигнала ПРД")}
                ComboBoxMD3 {
                    model: tlf1.signal_prd_types
                    onCurrentIndexChanged: {tlf1.signal_prd_type = currentIndex}
                }

                TextMD3 {text: qsTr("Скорость")}
                ComboBoxMD3 {
                    model: tlf1.prd_speeds
                    onCurrentIndexChanged: {tlf1.prd_speed = currentIndex}
                }

                TextMD3 {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBoxMD3 {
                        model: tlf1.prd_addresses_one
                        onCurrentIndexChanged: {tlf1.prd_address_one = currentIndex}
                    }

                    ComboBoxMD3 {
                        model: tlf1.prd_addresses_two
                        onCurrentIndexChanged: {tlf1.prd_address_two = currentIndex}
                    }
                }
            }
        }


        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
    }
}