import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Timer {
        id: timer
        interval: 1000; running: true; repeat: true
    }

    function getRandomArbitrary(min, max) {
        return Math.floor(Math.random() * (max - min) + min)
    }

    ColumnLayout {
        GridLayout {
            rows: 3
            columns: 2

            GridLayout {
                rows: 3
                columns: 2

                Text {text: qsTr("Прием ШПС:")}
                Text {text: qsTr("Не задан")}

                Text {text: qsTr("Уровень:")}
                Text {
                    id: shps_level
                    text: qsTr("257")

                    Connections {
                        target: timer
                        onTriggered: {
                            shps_level.text = getRandomArbitrary(240, 270).toString()
                        }
                    }
                }

                Button {text: qsTr("1. Тест")}
                Button {text: qsTr("2. Поиск")}
            }

            GridLayout {
                rows: 3
                columns: 2

                Text {text: qsTr("Прием УП:")}
                Text {text: qsTr("Есть")}

                Text {text: qsTr("Уровень:")}
                Text {
                    id: up_level
                    text: qsTr("16325")

                    Connections {
                        target: timer
                        onTriggered: {
                            up_level.text = getRandomArbitrary(15000, 17000).toString()
                        }
                    }
                }

                Button {text: qsTr("3. Поиск"); Layout.row: 2; Layout.column: 1}
            }

            GridLayout {
                rows: 3
                columns: 2

                Text {text: qsTr("Качество ДМД:")}
                Text {text: qsTr("Норма")}

                Text {text: qsTr("ГС 6 кБод:")}
                Text {text: qsTr("Нет СЦС")}

                Text {text: qsTr("ГС доп:")}
                Text {text: qsTr("Не задан")}
            }

            GridLayout {
                rows: 2
                columns: 2

                Layout.row: 2
                Layout.column: 0

                Text {text: qsTr("ППРЧ:")}
                Text {text: qsTr("Не задан")}

                Text {text: qsTr("Мощность:")}
                Text {text: qsTr("Запрет")}
            }

            GridLayout {
                rows: 2
                columns: 2

                Button {text: qsTr("4. Пуск")}
                Button {text: qsTr("5. АГ-Л")}
                Button {text: qsTr("6. Стоп")}
                Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MAIN_PAGE}}
            }
        }
    }
}