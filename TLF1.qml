import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        RowLayout {
            ColumnLayout {
                Text {text: qsTr("Тип сигнала ПРМ")}
                ComboBox {model: [qsTr("канал не задан"), qsTr("Закреп. непрер.")]}

                Text {text: qsTr("Скорость")}
                ComboBox {model: [4.8, 9.6]}

                Text {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBox {model: [0]}
                    ComboBox {model: [0]}
                    ComboBox {model: [qsTr(""), 1]}
                }
            }

            ColumnLayout {
                Text {text: qsTr("Тип сигнала ПРД")}
                ComboBox {model: [qsTr("канал не задан"), qsTr("Закреп. непрер.")]}

                Text {text: qsTr("Скорость")}
                ComboBox {model: [4.8, 9.6]}

                Text {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBox {model: [0]}
                    ComboBox {model: [qsTr(""), 1]}
                }
            }
        }

        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
    }
}