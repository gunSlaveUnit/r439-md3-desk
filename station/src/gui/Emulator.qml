import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Dialogs

import "./custom"

Window {
    id: emulator

    property int defaultMargin: 8

    minimumWidth: mainLayout.implicitWidth + 2 * defaultMargin
    minimumHeight: mainLayout.implicitHeight + 2 * defaultMargin
    width: minimumWidth
    height: minimumHeight
    visible: false
    title: qsTr("R439-MD3 Station Emulator")

    Connections {
        target: checker

        function toHHMMSS(sec_num) {
            var hours = Math.floor(sec_num / 3600);
            var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
            var seconds = Math.floor(sec_num - (hours * 3600) - (minutes * 60));

            if (hours < 10) {hours = "0" + hours}
            if (minutes < 10) {minutes = "0" + minutes}
            if (seconds < 10) {seconds = "0" + seconds}

            return hours + ':' + minutes + ':' + seconds;
        }

        function onPassed() {
            dialog.text = "Норматив успешно завершен за " + toHHMMSS(timer.elapsed)

            timer.stop()

            dialog.visible = true
        }
    }

    MessageDialog {
        id: dialog
        visible: false
        buttons: MessageDialog.Ok
    }

    StackLayout {
        id: emulatorMenuStack

        property int choiceNormPageIndex: 0
        property int choiceTrainingOrExamPageIndex: 1
        property int emulatorPageIndex: 2

        ColumnLayout {
            Button {
                text: qsTr("Free mode")
                onClicked: {
                    configuration.selected_norm = free_mode
                    emulatorMenuStack.currentIndex = emulatorMenuStack.emulatorPageIndex
                }
            }

            Button {
                text: qsTr("Small loop in the direct relay mode")
                onClicked: {
                    configuration.selected_norm = small_plume_norm
                    emulatorMenuStack.currentIndex = emulatorMenuStack.choiceTrainingOrExamPageIndex
                }
            }
        }

        ColumnLayout {
            id: choiceTrainingOrExamPage

            function checkUserAuthorization() {

            }

            Button {
                text: qsTr("Training")
                onClicked: {
                    configuration.is_training = true
                    emulatorMenuStack.currentIndex = emulatorMenuStack.emulatorPageIndex
                }
            }

            Button {
                text: qsTr("Exam")
                onClicked: {
                    configuration.is_training = false
                    choiceTrainingOrExamPage.checkUserAuthorization()
                    timer.start()
                }
            }

            Button {
                text: qsTr("Back")
                onClicked: emulatorMenuStack.currentIndex = emulatorMenuStack.choiceNormPageIndex
            }
        }

        GridLayout {
            id: mainLayout

            anchors.fill: parent
            anchors.margins: defaultMargin

            rows: 2
	        columns: 2

	        Rectangle {
                width: display.implicitWidth + 4 * defaultMargin
                height: display.implicitHeight + 4 * defaultMargin
                color: "black"
                border.color: "#524E4D"
                border.width: defaultMargin

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: defaultMargin
                    color: "transparent"
                    border.color: "#d4a009"
                    border.width: defaultMargin / 2

                    ColumnLayout {
                        id: display

                        anchors.fill: parent
                        anchors.margins: defaultMargin

                        // TODO: current date and time from config

                        RowLayout {
                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("(. Приборы - авария")}
                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("01-08-2023")}
                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("11:36:42")}
                        }

                        RowLayout {
                            id: stateButtons

                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("). Обмен")}
                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("<. Запрет ПРД")}
                            ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr(">. Тракт ПРМ - не норма")}
                        }

                        StackLayout {
                            id: displayStackLayout

                            property int mainPageIndex: 0
                            property int monitorPageIndex: mainPageIndex + 1
                            property int regulationsPageIndex: monitorPageIndex + 1
                            property int regulationsStatusPageIndex: regulationsPageIndex + 1
                            property int regulationsStatusDMDUZOZMPageIndex: regulationsStatusPageIndex + 1
                            property int regulationsModePageIndex: regulationsStatusDMDUZOZMPageIndex + 1
                            property int regulationsModeKLUPage1Index: regulationsModePageIndex + 1
                            property int regulationsModeKLUPage2Index: regulationsModeKLUPage1Index + 1
                            property int regulationsModeKLUPage3Index: regulationsModeKLUPage2Index + 1
                            property int regulationsModeDMDUZOZMPage1Index: regulationsModeKLUPage3Index + 1
                            property int regulationsModeDMDUZOZMPage2Index: regulationsModeDMDUZOZMPage1Index + 1
                            property int regulationsModeTractsPRMPRDPage1Index: regulationsModeDMDUZOZMPage2Index + 1
                            property int regulationsModeTractsPRMPRDPage2Index: regulationsModeTractsPRMPRDPage1Index + 1
                            property int regulationsModeL807PageIndex: regulationsModeTractsPRMPRDPage2Index + 1
                            property int regulationsModeAGLPageIndex: regulationsModeL807PageIndex + 1
                            property int regulationModeAGLDeviceModePageIndex: regulationsModeAGLPageIndex + 1
                            property int regulationsModeAGLTLF1PageIndex: regulationModeAGLDeviceModePageIndex + 1
                            property int regulationsPlumePageIndex: regulationsModeAGLTLF1PageIndex + 1

                            /*
                            *   Main menu page
                            */
                            ColumnLayout {
                                id: mainMenuPage

                                // TODO: I don't like this for buttons group rectangle width
                                property int screenWidth: 470
                                property int screenWidthHalf: screenWidth / 2

                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("ГЛАВНОЕ")}

                                RowLayout {
                                    Rectangle {
                                        width: mainMenuPage.screenWidthHalf
                                        height: leftMainMenuColumn.implicitHeight + 2 * defaultMargin
                                        color: "transparent"
                                        border.color: "#d4a009"
                                        border.width: 1

                                        ColumnLayout {
                                            id: leftMainMenuColumn

                                            anchors.centerIn: parent

                                            // TODO: It would be possible to redo the calculation of the size of the buttons. I think it can be easier
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("1. СХОС")}
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("2. Монитор"); onClicked: displayStackLayout.currentIndex = displayStackLayout.monitorPageIndex}
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("3. Сл. связь")}
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("4. Архив команд")}
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("5. РАТС")}
                                            ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("6. ПРД")}
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.alignment: Qt.AlignTop

                                        Rectangle {
                                            width: mainMenuPage.screenWidthHalf
                                            height: rightMainMenuColumn.implicitHeight + 2 * defaultMargin
                                            color: "transparent"
                                            border.color: "#d4a009"
                                            border.width: 1

                                            ColumnLayout {
                                                id: rightMainMenuColumn

                                                Layout.fillWidth: true
                                                anchors.centerIn: parent

                                                ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("7. Установка")}
                                                ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("8. Регламент"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
                                                ButtonMD3 {implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("9. Антенна")}
                                            }
                                        }

                                        Rectangle {
                                            width: mainMenuPage.screenWidthHalf
                                            height: endSessionButton.implicitHeight + 2 * defaultMargin
                                            color: "transparent"
                                            border.color: "#d4a009"
                                            border.width: 1

                                            ButtonMD3 {id: endSessionButton; anchors.centerIn: parent; implicitWidth: mainMenuPage.screenWidthHalf - 2 * defaultMargin; text: qsTr("0. Ок. сеанса")}
                                        }
                                    }
                                }
                            }

                            /*
                            *   Monitor page
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("МОНИТОР СТАНЦИИ")}

                                RowLayout {
                                    ColumnLayout {
                                        GridLayout {
                                            rows: 2
                                            columns: 2

                                            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Приём ШПС:")}
                                            DisplayTextMD3 {text: qsTr("Не задан")}
                                            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Уровень:")}
                                            DisplayTextMD3 {text: qsTr("282")}
                                        }

                                        RowLayout {
                                            ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Тест")}
                                            ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. Поиск")}
                                        }
                                    }

                                    ColumnLayout {
                                        GridLayout {
                                            rows: 2
                                            columns: 2

                                            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Приём УП:")}
                                            DisplayTextMD3 {text: qsTr("Есть")}
                                            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Уровень:")}
                                            DisplayTextMD3 {text: qsTr("16526")}
                                        }

                                        RowLayout {
                                            ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. Поиск")}
                                        }
                                    }
                                }

                                GridLayout {
                                    rows: 3
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Качество ДМД:")}
                                    DisplayTextMD3 {text: qsTr("Норма")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ГС 6 КБод:")}
                                    DisplayTextMD3 {text: qsTr("Норма, ошибки: 0")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ГС доп.:")}
                                    DisplayTextMD3 {text: qsTr("Не задан")}
                                }

                                RowLayout {
                                    GridLayout {
                                        rows: 2
                                        columns: 2

                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ППРЧ:")}
                                        DisplayTextMD3 {text: qsTr("Не задан")}
                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Мощность:")}
                                        DisplayTextMD3 {text: qsTr("Запрет")}
                                    }

                                    Item {Layout.fillWidth: true}

                                    GridLayout {
                                        rows: 2
                                        columns: 2

                                        ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. Пуск")}
                                        ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. АГ-Л")}
                                        ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Стоп")}
                                        ButtonMD3 {Layout.fillWidth: true; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.mainPageIndex}
                                    }
                                }
                            }

                            /*
                            *   Regulations page
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("РЕГЛАМЕНТ")}

                                GridLayout {
                                    rows: 3
                                    columns: 2
                                    flow: GridLayout.TopToBottom

                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Состояние"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsStatusPageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. Режим"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. Режим АГ-Л"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. Монитор")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. Шлейф"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPlumePageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Управление")}
                                }

                                Item {Layout.fillHeight: true}

                                ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.mainPageIndex}
                            }

                            /*
                            *   Regulations status page
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("СОСТОЯНИЕ ПРИБОРОВ СТАНЦИИ")}

                                GridLayout {
                                    rows: 4
                                    columns: 2
                                    flow: GridLayout.TopToBottom

                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Общее")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. АГ-Л")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. ПГ-Л")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. КЛ-У")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. ДМД, УЗОЗМ")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Тракты ПРД, ПРМ")}
                                }

                                Item {Layout.fillHeight: true}

                                ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
                            }

                            /*
                            *   Regulations status DMD UZOZM page
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("СОСТОЯНИЕ ДМД")}

                                GridLayout {
                                    rows: 8
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Норма УПЧ:")}
                                    DisplayTextMD3 {text: qsTr("Есть")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Норма ДМД:")}
                                    DisplayTextMD3 {text: qsTr("Есть")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Захват ПЧ:")}
                                    DisplayTextMD3 {text: qsTr("Есть")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Захват ТЧ:")}
                                    DisplayTextMD3 {text: qsTr("Есть")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Поиск:")}
                                    DisplayTextMD3 {text: qsTr("Нет")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Качество сигнала:")}
                                    DisplayTextMD3 {text: qsTr("Норма")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Расстройка, Гц:")}
                                    DisplayTextMD3 {text: qsTr("-100")}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Уровень ПРМ:")}
                                    DisplayTextMD3 {text: qsTr("16513")}
                                }

                                Item {Layout.fillHeight: true}

                                ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsStatusPageIndex}
                            }

                            /*
                            *   Regulations mode page
                            */
                            ColumnLayout {
		                        ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("ВВОД РЕЖИМНЫХ ПАРАМЕТРОВ")}

                                GridLayout {
                                    rows: 6
                                    columns: 3
                                    flow: GridLayout.TopToBottom

                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Общее")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. ПГ-Л")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. КЛ-У"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage1Index}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. ДМД, УЗОЗМ"); Layout.column: 1; onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeDMDUZOZMPage1Index}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. Тракты ПРД, ПРМ"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeTractsPRMPRDPage1Index}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Л807"); Layout.column: 2; onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeL807PageIndex}

                                    ColumnLayout {
                                        Layout.row: 2;
                                        Layout.column: 1
                                        Layout.rowSpan: 4;
                                        Layout.columnSpan: 2

                                        DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Внимание!")}
                                        DisplayTextMD3 {text: qsTr("Вы вошли в технологический режим\nуправления станцией.\nКоррекция режимных параметров\nможет привести к нарушению\nрабочего режима")}
                                    }
                                  }

                                Item {Layout.fillHeight: true}

                                ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
                            }

                            /*
                            *   Regulations mode KLU page 1
                            */
                            ColumnLayout {
                                // TODO: Very long KLU page 1. Can I make the combobox smaller?

                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

                                GridLayout {
                                    rows: 8
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ПРМ:")}
                                    ComboBoxMD3 {
                                        model: ["Спец. ГС", "Спец. ГС и ГС"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Код Баркера ПРМ:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Инверсия кода Баркера:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ДСЧ:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер ключа ПРМ:")}
                                    ComboBoxMD3 {
                                        model: [
                                            "0", "1", "2", "3",
                                            "4", "5", "6", "7",
                                            "8", "9", "10", "11",
                                            "12", "13", "14", "15"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер подключа ПРМ:")}
                                    ComboBoxMD3 {
                                        model: ["1", "2", "3", "4", "5", "6"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Полоса поиска ПРМ, кГц:")}
                                    ComboBoxMD3 {
                                        model: ["+-1", "+-4", "+-8"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ПРМ:")}
                                    ComboBoxMD3 {
                                        model: ["Fт1", "Fт2"]
                                    }
                                }

                                Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {text: qsTr("1. Изм.")}
                                    Item {Layout.fillWidth: true}
                                    ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage2Index}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
                                }
                            }

                            /*
                            *   Regulations mode KLU page 2
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

                                GridLayout {
                                    rows: 5
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ПРД:")}
                                    ComboBoxMD3 {
                                        model: ["Спец. ГС", "Спец. ГС и ГС"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Код Баркера ПРД:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер ключа ПРД:")}
                                    ComboBoxMD3 {
                                        model: [
                                            "0", "1", "2", "3",
                                            "4", "5", "6", "7",
                                            "8", "9", "10", "11",
                                            "12", "13", "14", "15"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер подключа ПРД:")}
                                    ComboBoxMD3 {
                                        model: ["1", "2", "3", "4", "5", "6"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ПРД:")}
                                    ComboBoxMD3 {
                                        model: ["Fт1", "Fт2"]
                                    }
                                }

                                Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {text: qsTr("1. Изм.")}
                                    Item {Layout.fillWidth: true}
                                    ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage1Index}
                                    ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage3Index}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
                                }
                            }

                            /*
                            *   Regulations mode KLU page 3
                            */
                            ColumnLayout {
                                ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

                                GridLayout {
                                    rows: 8
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тестпроверка:")}
                                    ComboBoxMD3 {
                                        id: kluTestCheck
                                        enabled: !changeKLU3Button.visible
                                        currentIndex: klu.test_check
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим теста:")}
                                    ComboBoxMD3 {
                                        model: ["ПР", "ОСБ"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ПРД 70:")}
                                    ComboBoxMD3 {
                                        id: kluPRD70
                                        enabled: !changeKLU3Button.visible
                                        currentIndex: klu.prd70
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Сброс счетчика ошибок:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный 1:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный 2:")}
                                    ComboBoxMD3 {
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРД:")}
                                    ComboBoxMD3 {
                                        id: kluPRDSignalType
                                        enabled: !changeKLU3Button.visible
                                        currentIndex: klu.prd_signal_type
                                        model: [
                                            "УП (ППРЧ)",
                                            "ШПС 1",
                                            "ШПС 2",
                                            "ШПС 3",
                                            "Несущая 1",
                                            "Несущая 2",
                                            "Несущая 3",
                                            "Несущая 4"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ШПС ПРД:")}
                                    ComboBoxMD3 {
                                        model: ["Fт1", "Fт2"]
                                    }
                                }

                                Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeKLU3Button
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeKLU3Button.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            klu.test_check = kluTestCheck.currentIndex
                                            klu.prd70 = kluPRD70.currentIndex
                                            klu.prd_signal_type = kluPRDSignalType.currentIndex

                                            changeKLU3Button.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeKLU3Button.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            kluTestCheck.currentIndex = klu.test_check
                                            kluPRD70.currentIndex = klu.prd70
                                            kluPRDSignalType.currentIndex = klu.prd_signal_type

                                            changeKLU3Button.visible = true
                                        }
                                    }

                                    ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage2Index}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
                                }
                            }

                            property int regulationsModePage1Index

                            /*
                            *   Regulations mode DMD UZOZM page 1
                            */
                            ColumnLayout {
							    ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ДМД, УЗОЗМ")}

							    GridLayout {
                                    rows: 7
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип радиосигнала ПРМ:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMPRMSignalType
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.prm_signal_type
                                        model: ["ШПС", "УП"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Декодер:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMDecoder
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.decoder
                                        model: [
                                            "K=5; R=1/2",
                                            "K=7; R=1/2",
                                            "K=7; R=3/4",
                                            "K=7; R=3/4 инв.",
                                            "Откл."
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ДМД, кбит/с:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMDMDSpeed
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.dmd_speed
                                        model: [
                                            "1.5", "3", "6", "12", "30",
                                            "60", "120", "180", "300", "600",
                                            "1.2", "2.4", "4.8", "9.6", "24",
                                            "48", "96", "144", "240", "480"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим ДМД:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMDMDMode
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.dmd_mode
                                        model: ["Работа", "Проверка"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ПРД УЗОЗМ, кбит/с:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMPRDUZOZMSpeed
                                        enabled: false
                                        currentIndex: dmd_uzozm.prd_uzozm_speed
                                        model: ["1.5 ОФТ"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим УЗОЗМ:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMUZOZMMode
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.uzozm_mode
                                        model: ["Работа", "Проверка"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный канал в ФТ4:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMServiceChannelFT4
                                        enabled: !changeDMDUZOZM1Button.visible
                                        currentIndex: dmd_uzozm.service_channel_ft4
                                        model: ["1.2 кБод", "4.8 кБод"]
                                    }
		                        }

							    Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeDMDUZOZM1Button
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

		                            Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeDMDUZOZM1Button.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            dmd_uzozm.prm_signal_type = dmdUZOZMPRMSignalType.currentIndex
                                            dmd_uzozm.decoder = dmdUZOZMDecoder.currentIndex
                                            dmd_uzozm.dmd_speed = dmdUZOZMDMDSpeed.currentIndex
                                            dmd_uzozm.dmd_mode = dmdUZOZMDMDMode.currentIndex
                                            dmd_uzozm.prd_uzozm_speed = dmdUZOZMPRDUZOZMSpeed.currentIndex
                                            dmd_uzozm.uzozm_mode = dmdUZOZMUZOZMMode.currentIndex
                                            dmd_uzozm.service_channel_ft4 = dmdUZOZMServiceChannelFT4.currentIndex

                                            changeDMDUZOZM1Button.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeDMDUZOZM1Button.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            dmdUZOZMPRMSignalType.currentIndex = dmd_uzozm.prm_signal_type
                                            dmdUZOZMDecoder.currentIndex = dmd_uzozm.decoder
                                            dmdUZOZMDMDSpeed.currentIndex = dmd_uzozm.dmd_speed
                                            dmdUZOZMDMDMode.currentIndex = dmd_uzozm.dmd_mode
                                            dmdUZOZMPRDUZOZMSpeed.currentIndex = dmd_uzozm.prd_uzozm_speed
                                            dmdUZOZMUZOZMMode.currentIndex = dmd_uzozm.uzozm_mode
                                            dmdUZOZMServiceChannelFT4.currentIndex = dmd_uzozm.service_channel_ft4

                                            changeDMDUZOZM1Button.visible = true
                                        }
                                    }

		                            ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeDMDUZOZMPage2Index}
		                            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
		                        }
		                    }

                            /*
                            *   Regulations mode DMD UZOZM page 2
                            */
		                    ColumnLayout {
							    ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ДМД")}

							    GridLayout {
                                    rows: 7
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер фильтра:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMFilterNumber
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.filter_number
                                        model: ["1", "2", "3", "4", "5", "Не задан"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("АРУ:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMARU
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.aru
                                        model: ["АРУ", "РРУ"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Автопоиск:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMAutoSearch
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.auto_search
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("АСЧ:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMASCH
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.asch
                                        model: ["Вкл.", "Откл."]
		                            }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Диф. декодер:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMDifDecoder
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.dif_decoder
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Полоса ДМД:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMDMDBand
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.dmd_band
                                        model: ["Узкая", "Широкая"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Корректор:")}
                                    ComboBoxMD3 {
                                        id: dmdUZOZMCorrector
                                        enabled: !changeDMDUZOZM2Button.visible
                                        currentIndex: dmd_uzozm.corrector
                                        model: ["Вкл.", "Откл."]
                                    }
		                        }

							    Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeDMDUZOZM2Button
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeDMDUZOZM2Button.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            dmd_uzozm.filter_number = dmdUZOZMFilterNumber.currentIndex
                                            dmd_uzozm.aru = dmdUZOZMARU.currentIndex
                                            dmd_uzozm.auto_search = dmdUZOZMAutoSearch.currentIndex
                                            dmd_uzozm.asch = dmdUZOZMASCH.currentIndex
                                            dmd_uzozm.dif_decoder = dmdUZOZMDifDecoder.currentIndex
                                            dmd_uzozm.dmd_band = dmdUZOZMDMDBand.currentIndex
                                            dmd_uzozm.corrector = dmdUZOZMCorrector.currentIndex

                                            changeDMDUZOZM2Button.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeDMDUZOZM2Button.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            dmdUZOZMFilterNumber.currentIndex = dmd_uzozm.filter_number
                                            dmdUZOZMARU.currentIndex = dmd_uzozm.aru
                                            dmdUZOZMAutoSearch.currentIndex = dmd_uzozm.auto_search
                                            dmdUZOZMASCH.currentIndex = dmd_uzozm.asch
                                            dmdUZOZMDifDecoder.currentIndex = dmd_uzozm.dif_decoder
                                            dmdUZOZMDMDBand.currentIndex = dmd_uzozm.dmd_band
                                            dmdUZOZMCorrector.currentIndex = dmd_uzozm.corrector

                                            changeDMDUZOZM2Button.visible = true
                                        }
                                    }

                                    ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeDMDUZOZMPage1Index}
                                    ButtonMD3 {text: qsTr(">")}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
                                }
                            }

                            /*
                            *   Regulations mode tracts PRM PRM page 1
                            */
                            ColumnLayout {
							    ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ПРМ, ПРД")}

							    GridLayout {
                                    rows: 5
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Автоконтроль CAN:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDAutoCheckCAN
                                        enabled: !changeTractsPRMPRDButton1.visible
                                        currentIndex: tracts_prm_prd.auto_check_can
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Поддиппазон приема:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDReceiveSubband
                                        enabled: !changeTractsPRMPRDButton1.visible
                                        currentIndex: tracts_prm_prd.receive_subband
                                        model: [
                                            "1", "2", "3", "4", "5", "6", "7", "8", "9",
                                            "10", "11", "12", "13", "14", "15", "16", "18", "19",
                                            "20", "21", "22", "23", "24", "25", "26", "27", "28",
                                            "29", "30", "31", "32", "33", "34", "35", "36", "37",
                                            "38", "39", "40", "41", "42", "43", "44", "45", "46"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Генератор сдвига:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDShiftGenerator
                                        enabled: !changeTractsPRMPRDButton1.visible
                                        currentIndex: tracts_prm_prd.shift_generator
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ствольный фильтр:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDBarrelFilter
                                        enabled: !changeTractsPRMPRDButton1.visible
                                        currentIndex: tracts_prm_prd.barrel_filter
                                        model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Усилитель мощности:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDAmplifier
                                        enabled: !changeTractsPRMPRDButton1.visible
                                        currentIndex: tracts_prm_prd.amplifier
                                        model: ["Откл.", "Вкл."]
                                    }
		                        }

							    Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeTractsPRMPRDButton1
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeTractsPRMPRDButton1.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            tracts_prm_prd.auto_check_can = tractsPRDPRDAutoCheckCAN.currentIndex
                                            tracts_prm_prd.receive_subband = tractsPRDPRDReceiveSubband.currentIndex
                                            tracts_prm_prd.shift_generator = tractsPRDPRDShiftGenerator.currentIndex
                                            tracts_prm_prd.barrel_filter = tractsPRDPRDBarrelFilter.currentIndex
                                            tracts_prm_prd.amplifier = tractsPRDPRDAmplifier.currentIndex

                                            changeTractsPRMPRDButton1.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeTractsPRMPRDButton1.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            tractsPRDPRDAutoCheckCAN.currentIndex = tracts_prm_prd.auto_check_can
                                            tractsPRDPRDReceiveSubband.currentIndex = tracts_prm_prd.receive_subband
                                            tractsPRDPRDShiftGenerator.currentIndex = tracts_prm_prd.shift_generator
                                            tractsPRDPRDBarrelFilter.currentIndex = tracts_prm_prd.barrel_filter
                                            tractsPRDPRDAmplifier.currentIndex = tracts_prm_prd.amplifier

                                            changeTractsPRMPRDButton1.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeTractsPRMPRDPage2Index}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
		                        }
						    }

						    /*
                            *   Regulations mode tracts PRM PRM page 2
                            */
                            ColumnLayout {
							    ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ПРМ, ПРД")}

							    GridLayout {
                                    rows: 6
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип радиосигнала:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDRadioSignalType
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        currentIndex: tracts_prm_prd.radio_signal
                                        model: [
                                            "УП",
                                            "ППРЧ", // TODO: if this next value is empty
                                            "ШПС"
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ОФТ:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDOFTSignalType
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        currentIndex: tracts_prm_prd.signal_type
                                        model: [
                                            "ОФТ",
                                            "K=5; R=1/2",
                                            "K=7; R=1/2",
                                            "K=7; R=3/4",
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ЗС:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDZSSpeed
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        currentIndex: tracts_prm_prd.zs_speed
                                        model: (tractsPRDPRDOFTSignalType.currentIndex === 0  || tractsPRDPRDOFTSignalType.currentIndex === 1) ? [
                                            "1.5",
                                            "3",
                                            "6",
                                            "12",
                                            "30",
                                            "60",
                                            "1.2",
                                            "2.4",
                                            "4.8",
                                            "9.6",
                                            "48"
                                        ] : tractsPRDPRDOFTSignalType.currentIndex === 2 ? [
                                            "16 MX",
                                            "32 MX",
                                            "48 MX",
                                            "64 MX",
                                            "64 MX",
                                            "64 HDB СНС",
                                            "64 HDB ПНС",
                                            "128 HDB",
                                            "256 HDB",
                                            "144 HDB",
                                            "48 RS232",
                                            "64 RS232",
                                            "128 RS232",
                                            "144 RS232",
                                        ] : tractsPRDPRDOFTSignalType.currentIndex === 2 ? [
                                            "64 HDB СНС",
                                            "64 HDB ПНС",
                                            "128 HDB",
                                            "256 HDB",
                                            "384 HDB",
                                            "512 HDB",
                                            "1024 HDB",
                                            "2048 HDB",
                                            "256 RS422/530",
                                            "384 RS422/530",
                                            "512 RS422/530",
                                        ] : []
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Выход У205Д:")}
                                    ComboBoxMD3 {
                                        id: tractsPRDPRDOutputU205D
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        currentIndex: tracts_prm_prd.output_u205d
                                        model: ["Вкл.", "Откл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРД:")}
                                    TextFieldMD3 {
                                        id: tractsPRDPRDPRDWaveNumber
                                        implicitWidth: tractsPRDPRDOutputU205D.implicitWidth
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        text: tracts_prm_prd.prd_wave_number
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРМ:")}
                                    TextFieldMD3 {
                                        id: tractsPRDPRDPRMWaveNumber
                                        implicitWidth: tractsPRDPRDOutputU205D.implicitWidth
                                        enabled: !changeTractsPRMPRDButton2.visible
                                        text: tracts_prm_prd.prm_wave_number
                                    }
                                }

							        Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeTractsPRMPRDButton2
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeTractsPRMPRDButton2.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            tracts_prm_prd.radio_signal = tractsPRDPRDRadioSignalType.currentIndex
                                            tracts_prm_prd.signal_type = tractsPRDPRDOFTSignalType.currentIndex
                                            tracts_prm_prd.zs_speed = tractsPRDPRDZSSpeed.currentIndex
                                            tracts_prm_prd.output_u205d = tractsPRDPRDOutputU205D.currentIndex
                                            tracts_prm_prd.prd_wave_number = tractsPRDPRDPRDWaveNumber.text
                                            tracts_prm_prd.prm_wave_number = tractsPRDPRDPRMWaveNumber.text

                                            changeTractsPRMPRDButton2.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeTractsPRMPRDButton2.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            tractsPRDPRDRadioSignalType.currentIndex = tracts_prm_prd.radio_signal
                                            tractsPRDPRDOFTSignalType.currentIndex = tracts_prm_prd.signal_type
                                            tractsPRDPRDZSSpeed.currentIndex = tracts_prm_prd.zs_speed
                                            tractsPRDPRDOutputU205D.currentIndex = tracts_prm_prd.output_u205d
                                            tractsPRDPRDPRDWaveNumber.text = tracts_prm_prd.prd_wave_number
                                            tractsPRDPRDPRMWaveNumber.text = tracts_prm_prd.prm_wave_number

                                            changeTractsPRMPRDButton2.visible = true
                                        }
                                    }

                                    ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeTractsPRMPRDPage1Index}
                                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
		                        }
                            }

                            /*
                            *   Regulations mode L807 page
                            */
                            ColumnLayout {
		                        ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Л807")}

                                DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Установленные интерфейсы:")}
                                DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Интерфейс не обеспечивается")}

                                GridLayout {
                                    rows: 2
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Стык Л807:")}
                                    ComboBoxMD3 {
                                        id: l807Joint
                                        enabled: !changeL807Button.visible
		                                currentIndex: l807.joint
                                        model: [
                                            qsTr("Выключен"),
                                            qsTr("ОЦК СН"),
                                            qsTr("ОЦК ПН"),
                                            qsTr("Т1"),
                                            qsTr("Е1"),
                                            qsTr("С1-ФЛ-КИ"),
                                            qsTr("RS-232"),
                                            qsTr("RS-422/530"),
                                            qsTr("V-35"),
                                            qsTr("RS-232 синхр."),
                                            qsTr("Выключен"),
                                        ]
		                            }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Источник сигнала: ")}
                                    ComboBoxMD3 {
                                        id: l807SignalSource
                                        enabled: !changeL807Button.visible
                                        currentIndex: l807.signal_source
                                        model: [qsTr("Л807"), qsTr("АГ-Л")]
                                    }
		                        }

		                        Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeL807Button
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeL807Button.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            l807.joint = l807Joint.currentIndex
                                            l807.signal_source = l807SignalSource.currentIndex

                                            changeL807Button.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeL807Button.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            l807Joint.currentIndex = l807.joint
                                            l807SignalSource.currentIndex = l807.signal_source

                                            changeL807Button.visible = true
                                        }
                                    }

		                            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
		                        }
		                    }

		                    /*
                            *   Regulations mode AGL page
                            */
                            ColumnLayout {
		                        ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("РЕЖИМ АГ-Л")}

                                GridLayout {
                                    rows: 6
                                    columns: 3
                                    flow: GridLayout.TopToBottom

                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Режим прибора"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationModeAGLDeviceModePageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. ТЛФ1"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLTLF1PageIndex}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. ТЛФ2")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. ТЛФ3")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. ТЛФ4")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. ТЛФ5")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("7. КАУ1")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("8. КАУ2")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("9. КАУ3")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("10. КАУ4")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("11. КАУ5")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("12. ТЛГ1")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("13. ТЛГ2")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("14. ТЛГ3")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("15. ТЛГ4")}
                                    ButtonMD3 {Layout.fillWidth: true; text: qsTr("16. Синх. вход")}
                                }

		                        Item {Layout.fillHeight: true}

		                        ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
		                    }

		                    /*
                            *   Regulations mode AGL device mode page
                            */
                            ColumnLayout {
		                        ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режим прибора АГ-Л")}

		                        GridLayout {
                                    rows: 4
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим работы ЗС")}
                                    ComboBoxMD3 {
                                        id: aglZSOperatingMode
                                        enabled: !changeAGLButton.visible
                                        currentIndex: agl.zs_operating_mode
                                        model: [
                                            qsTr("ПР"),
                                            qsTr("ОСБ без ППРЧ"),
                                            qsTr("ППРЧ непрерывный"),
                                            qsTr("ОСБ ШПС"),
                                            qsTr("Транзит ТЛФ")
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скор ГС ПРМ, кбит/c")}
                                    ComboBoxMD3 {
                                        id: aglGSPRMSpeed
                                        enabled: !changeAGLButton.visible
                                        currentIndex: agl.speed_gs_prm
                                        model: [
                                            qsTr("Нет ГС"),
                                            qsTr("1.5"),
                                            qsTr("3"),
                                            qsTr("6"),
                                            qsTr("12"),
                                            qsTr("30"),
                                            qsTr("60"),
                                            qsTr("120"),
                                            qsTr("180"),
                                            qsTr("300"),
                                            qsTr("600")
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скор ГС ПРД, кбит/c")}
                                    ComboBoxMD3 {
                                        id: aglGSPRDSpeed
                                        enabled: !changeAGLButton.visible
                                        currentIndex: agl.speed_gs_prd
                                        model: [
                                            qsTr("Нет ГС"),
                                            qsTr("1.5"),
                                            qsTr("3"),
                                            qsTr("6"),
                                            qsTr("12")
                                        ]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим РАТС")}
                                    ComboBoxMD3 {
                                        id: aglRATSMode
                                        enabled: !changeAGLButton.visible
                                        currentIndex: agl.rats_mode
                                        model: [
                                            qsTr("Отсутствует"),
                                            qsTr("Закрепл. напр."),
                                            qsTr("Незакрепл. напр.")
                                        ]
                                    }
		                        }

		                        Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changeAGLButton
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeAGLButton.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            agl.zs_operating_mode = aglZSOperatingMode.currentIndex
                                            agl.speed_gs_prm = aglGSPRMSpeed.currentIndex
                                            agl.speed_gs_prd = aglGSPRDSpeed.currentIndex
                                            agl.rats_mode = aglRATSMode.currentIndex

                                            changeAGLButton.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeAGLButton.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            aglZSOperatingMode.currentIndex = agl.zs_operating_mode
                                            aglGSPRMSpeed.currentIndex = agl.speed_gs_prm
                                            aglGSPRDSpeed.currentIndex = agl.speed_gs_prd
                                            aglRATSMode.currentIndex = agl.rats_mode

                                            changeAGLButton.visible = true
                                        }
                                    }

		                            ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
		                        }
		                    }

		                    /*
                            *   Regulations mode AGL TLF1 page
                            */
                            ColumnLayout {
		                        ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режим ТЛФ1")}

		                        GridLayout {
		                            columns: 2

                                    Column {
                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРМ")}
                                        ComboBoxMD3 {
                                            id: tlf1SignalPRMType
                                            enabled: !changeTLF1Button.visible
                                            currentIndex: tlf1.signal_prm_type
                                            model: [
                                                "Канал не задан",
                                                "РАТС", // TODO: this changes one field
                                                "Закреп. непрер.",
                                                "Из спец. ГС"
                                            ]
                                        }

                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость")}
                                        ComboBoxMD3 {
                                            id: tlf1PRMSpeed
                                            enabled: !changeTLF1Button.visible
                                            currentIndex: tlf1.prm_speed
                                            model: [
                                                "9.6",
                                                "4.8",
                                                "2.4",
                                                "1.2"
                                            ]
                                        }

		                                DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Адрес в ГС")}

                                        RowLayout {
                                            ComboBoxMD3 {
                                                id: tlf1PRMAddressOne
                                                enabled: !changeTLF1Button.visible
                                                currentIndex: tlf1.prm_address_one
                                                model: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
                                            }

                                            ComboBoxMD3 {
                                                id: tlf1PRMAddressTwo
                                                enabled: !changeTLF1Button.visible
                                                currentIndex: tlf1.prm_address_two
                                                model: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
                                            }

                                            ComboBoxMD3 {
                                                id: tlf1PRMAddressThree
                                                enabled: !changeTLF1Button.visible
                                                currentIndex: tlf1.prm_address_three
                                                model: ["1", "2", "3", "4"]
                                            }
		                                }
		                            }

                                    Column {
                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРД")}
                                        ComboBoxMD3 {
                                            id: tlf1SignalPRDType
                                            enabled: !changeTLF1Button.visible
                                            currentIndex: tlf1.signal_prd_type
                                            model: [
                                                "Канал не задан",
                                                "РАТС",
                                                "Закреп. непрер."
                                            ]
                                        }

                                        DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость")}
                                        ComboBoxMD3 {
                                            id: tlf1PRDSpeed
                                            enabled: !changeTLF1Button.visible
                                            currentIndex: tlf1.prd_speed
                                            model: [
                                                "9.6",
                                                "4.8",
                                                "2.4",
                                                "1.2",
                                                "1.2 СБД",
                                                "1.5",
                                                "3",
                                            ]
                                        }

		                                DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Адрес в ГС")}

                                        RowLayout {
                                            ComboBoxMD3 {
                                                id: tlf1PRDAddressOne
                                                enabled: !changeTLF1Button.visible
                                                currentIndex: tlf1.prd_address_one
                                                model: ["0", "1", "2"]
                                            }

                                            ComboBoxMD3 {
                                                id: tlf1PRDAddressTwo
                                                enabled: !changeTLF1Button.visible
                                                currentIndex: tlf1.prd_address_two
                                                model: ["1", "2", "3", "4"]
                                            }
                                        }
		                            }
		                        }

							    Item {Layout.fillHeight: true}

		                        RowLayout {
                                    ButtonMD3 {
                                        id: changeTLF1Button
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

                                    Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changeTLF1Button.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            tlf1.signal_prm_type = tlf1SignalPRMType.currentIndex
                                            tlf1.prm_speed = tlf1PRMSpeed.currentIndex
                                            tlf1.prm_address_one = tlf1PRMAddressOne.currentIndex
                                            tlf1.prm_address_two = tlf1PRMAddressTwo.currentIndex
                                            tlf1.prm_address_three = tlf1PRMAddressThree.currentIndex
                                            tlf1.signal_prd_type = tlf1SignalPRDType.currentIndex
                                            tlf1.prd_speed = tlf1PRDSpeed.currentIndex
                                            tlf1.prd_address_one = tlf1PRDAddressOne.currentIndex
                                            tlf1.prd_address_two = tlf1PRDAddressTwo.currentIndex

                                            changeTLF1Button.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changeTLF1Button.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            tlf1SignalPRMType.currentIndex = tlf1.signal_prm_type
                                            tlf1PRMSpeed.currentIndex = tlf1.prm_speed
                                            tlf1PRMAddressOne.currentIndex = tlf1.prm_address_one
                                            tlf1PRMAddressTwo.currentIndex = tlf1.prm_address_two
                                            tlf1PRMAddressThree.currentIndex = tlf1.prm_address_three
                                            tlf1SignalPRDType.currentIndex = tlf1.signal_prd_type
                                            tlf1PRDSpeed.currentIndex = tlf1.prd_speed
                                            tlf1PRDAddressOne.currentIndex = tlf1.prd_address_one
                                            tlf1PRDAddressTwo.currentIndex = tlf1.prd_address_two

                                            changeTLF1Button.visible = true
                                        }
                                    }

		                            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
		                        }
		                    }

		                    /*
                            *   Regulations plume page
                            */
                            ColumnLayout {
							    ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Шлейф ПР")}

							    GridLayout {
                                    rows: 4
                                    columns: 2

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Генератор сдвига:")}
                                    ComboBoxMD3 {
                                        id: plumeShiftGenerator
                                        enabled: !changePlumeButton.visible
                                        currentIndex: plume.shift_generator
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Усилитель мощности:")}
                                    ComboBoxMD3 {
                                        id: plumeAmplifier
                                        enabled: !changePlumeButton.visible
                                        currentIndex: plume.amplifier
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Выход У205Д:")}
                                    ComboBoxMD3 {
                                        id: plumeOutputU205D
                                        enabled: !changePlumeButton.visible
                                        currentIndex: plume.output_u205d
                                        model: ["Откл.", "Вкл."]
                                    }

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРД:")}
                                    TextFieldMD3 {
                                        id: plumePRDWaveNumber
                                        implicitWidth: plumeOutputU205D.implicitWidth
                                        enabled: !changePlumeButton.visible
                                        text: plume.prd_wave_number
                                    }
                                }

                                GridLayout {
                                    rows: 2
                                    columns: 4

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ствол. фильтр:")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text: plume.stem_filter}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("№ волны ПРМ:")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text:  plume.prm_wave_number}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Поддиап. приема:")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text:  plume.receive_subband}

                                    DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("№ фильтра ДМД:")}
                                    DisplayTextMD3 {Layout.fillWidth: true; text: plume.dmd_filter_number}
                                }

							    Item {Layout.fillHeight: true}

                                RowLayout {
                                    ButtonMD3 {
                                        id: changePlumeButton
                                        text: qsTr("1. Изм.")
                                        onClicked: visible = false
                                    }

		                            Item {Layout.fillWidth: true}

                                    ButtonMD3 {
                                        visible: !changePlumeButton.visible
                                        text: qsTr("2. Запись")
                                        onClicked: {
                                            plume.shift_generator = plumeShiftGenerator.currentIndex
                                            plume.amplifier = plumeAmplifier.currentIndex
                                            plume.output_u205d = plumeOutputU205D.currentIndex
                                            plume.prd_wave_number = plumePRDWaveNumber.text

                                            plume.calculate_parameters()

                                            changePlumeButton.visible = true

                                            checker.check(configuration.selected_norm)
                                        }
                                    }

                                    ButtonMD3 {
                                        visible: !changePlumeButton.visible
                                        text: qsTr("3. Отмена")

                                        onClicked: {
                                            plumeShiftGenerator.currentIndex = plume.shift_generator
                                            plumeAmplifier.currentIndex = plume.amplifier
                                            plumeOutputU205D.currentIndex = plume.output_u205d
                                            plumePRDWaveNumber.text = plume.prd_wave_number

                                            changePlumeButton.visible = true
                                        }
                                    }

		                            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
		                        }
						    }
                        }
                    }
                }
            }

            ColumnLayout {
	            id: keyboard

				Layout.rowSpan: 2

				property int borderWidthSection: 4
				property int sectionRadius: 8
				property string neutralButtonColor: "#aeada8"
				property string redButtonColor: "#ba5e51"
				property string blueButtonColor: "#495f8f"

				Rectangle {
					implicitWidth: mainKeyboardSection.implicitWidth
					implicitHeight: helpKeyboardSectionLayout.implicitHeight + 2 * defaultMargin
					color: "transparent"
					radius: keyboard.sectionRadius
					border.width: keyboard.borderWidthSection
					border.color: "black"

					RowLayout {
						id: helpKeyboardSectionLayout

						anchors.fill: parent
						anchors.margins: defaultMargin

						KeyboardButtonMD3 {text: qsTr("ESC")}

						Item {implicitWidth: 3 * defaultMargin}

						RowLayout {
							KeyboardButtonMD3 {text: qsTr("F1")}
							KeyboardButtonMD3 {text: qsTr("F2")}
							KeyboardButtonMD3 {text: qsTr("F3")}
							KeyboardButtonMD3 {text: qsTr("F4")}
						}

						Item {Layout.fillWidth: true}

						KeyboardButtonMD3 {
							Image {
	                            anchors.fill: parent
	                            anchors.margins: 8
	                            source: "../../resources/up_triangle.png"
	                            mipmap: true
	                        }
						}
					}
				}

				Item {implicitHeight: defaultMargin}

				RowLayout {
					id: mainKeyboardSection

					Rectangle {
						implicitWidth: selectedKeyboardModeLayout.implicitWidth + 2 * defaultMargin
						implicitHeight: selectedKeyboardModeLayout.implicitHeight + 2 * defaultMargin
						color: "transparent"
						radius: keyboard.sectionRadius
						border.width: keyboard.borderWidthSection
						border.color: "black"

						ColumnLayout {
							id: selectedKeyboardModeLayout

							anchors.fill: parent
							anchors.margins: defaultMargin

							KeyboardButtonMD3 {
								backgroundColor: keyboard.redButtonColor
								text: qsTr("РУС")
								textVerticalAlignment: Text.AlignTop

								KeyboardModeIndicatorMD3 {id: rusRedModeIndicator}
							}

							KeyboardButtonMD3 {
								backgroundColor: keyboard.blueButtonColor
								text: qsTr("РУС")
								textVerticalAlignment: Text.AlignTop

								KeyboardModeIndicatorMD3 {id: rusBlueModeIndicator}
							}

							KeyboardButtonMD3 {
								backgroundColor: keyboard.redButtonColor
								text: qsTr("ЛАТ")
								textVerticalAlignment: Text.AlignBottom

								KeyboardModeIndicatorMD3 {id: latRedModeIndicator}
							}

							KeyboardButtonMD3 {
								backgroundColor: keyboard.blueButtonColor
								text: qsTr("ЛАТ")
								textVerticalAlignment: Text.AlignBottom

								KeyboardModeIndicatorMD3 {id: latBlueModeIndicator}
							}

							KeyboardButtonMD3 {
								textVerticalAlignment: Text.AlignTop
								text: qsTr("ЦИФ")

								KeyboardModeIndicatorMD3 {
									id: digitsModeIndicator
									isSelected: true
								}
							}
						}
					}

					Item {implicitWidth: defaultMargin}

					Rectangle {
						implicitWidth: numbersSymbolsKeyboardSectionLayout.implicitWidth + 2 * defaultMargin
						implicitHeight: numbersSymbolsKeyboardSectionLayout.implicitHeight + 2 * defaultMargin
						color: "transparent"
						radius: keyboard.sectionRadius
						border.width: keyboard.borderWidthSection
						border.color: "black"

						GridLayout {
							id: numbersSymbolsKeyboardSectionLayout
							rows: 5
							columns: 4

							anchors.fill: parent
							anchors.margins: defaultMargin

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("А"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Б"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("("); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("A"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("B"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("В"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Г"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr(")"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("C"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("D"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Д"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Е"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("<"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("E"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("F"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ж"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("З"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr(">"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("G"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("H"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("И"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("й"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("+"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("I"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("J"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("К"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Л"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("7"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("K"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("L"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("М"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Н"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("8"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("M"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("N"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("О"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("П"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("9"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("O"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("P"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Р"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("С"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("/"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("Q"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("R"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Т"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("У"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("4"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("С"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("Т"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ф"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Ч"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("5"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("U"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("V"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ц"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Ч"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("6"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("W"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("X"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ш"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Щ"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("*"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("Y"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("Z"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ъ"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Ы"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("1"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("("); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr(")"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ь"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Э"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("2"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("!"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr("?"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
								contentItem: GridLayout {
									rowSpacing: 0
									columnSpacing: 0

	                                Text {text: qsTr("Ю"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
	                                Text {text: qsTr("Я"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 0; Layout.column: 1}
	                                Text {text: qsTr("3"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
	                                Text {text: qsTr("."); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
	                                Text {text: qsTr(";"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
	                            }
							}

							KeyboardButtonMD3 {
	                            contentItem: GridLayout {
	                                rowSpacing: 0
                                    columnSpacing: 0

                                    Text {text: qsTr(""); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
                                    Text {text: qsTr("="); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                                    Text {text: qsTr("/"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
                                    Text {text: qsTr("\\"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
                                }
	                        }

                            KeyboardButtonMD3 {
                                contentItem: GridLayout {
                                    rowSpacing: 0
                                    columnSpacing: 0

                                    Text {text: qsTr(""); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
                                    Text {text: qsTr("0"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                                    Text {text: qsTr("@"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
                                    Text {text: qsTr("*"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
                                }
                            }

                            KeyboardButtonMD3 {
                                contentItem: GridLayout {
                                    rowSpacing: 0
                                    columnSpacing: 0

                                    Text {text: qsTr(""); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
                                    Text {text: qsTr(","); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                                    Text {text: qsTr("\""); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
                                    Text {text: qsTr("\""); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
                                }
                            }

                            KeyboardButtonMD3 {
                                contentItem: GridLayout {
                                    rowSpacing: 0
                                    columnSpacing: 0

                                    Text {text: qsTr(":"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 0; Layout.column: 0}
                                    Text {text: qsTr("-"); Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                                    Text {text: qsTr("%"); Layout.alignment: Qt.AlignCenter; color: keyboard.redButtonColor; Layout.row: 2; Layout.column: 0}
                                    Text {text: qsTr("&"); Layout.alignment: Qt.AlignCenter; color: keyboard.blueButtonColor; Layout.row: 2; Layout.column: 1}
                                }
                            }
						}
					}

					Item {implicitWidth: defaultMargin}

					Rectangle {
						implicitWidth: navigationKeyboardSectionLayout.implicitWidth + 2 * defaultMargin
						implicitHeight: navigationKeyboardSectionLayout.implicitHeight + 2 * defaultMargin
						color: "transparent"
						radius: keyboard.sectionRadius
						border.width: keyboard.borderWidthSection
						border.color: "black"

						GridLayout {
							id: navigationKeyboardSectionLayout
							rows: 5
							columns: 3

							anchors.fill: parent
							anchors.margins: defaultMargin

							KeyboardButtonMD3 {
								Image {
	                                anchors.fill: parent
	                                anchors.margins: 2 * defaultMargin
	                                source: "../../resources/clockwise.png"
	                                mipmap: true
	                            }
							}
							KeyboardButtonMD3 {text: qsTr("Page\nUp")}
							KeyboardButtonMD3 {
								Image {
	                                anchors.fill: parent
                                    anchors.margins: 2 * defaultMargin
                                    source: "../../resources/unclockwise.png"
	                                mipmap: true
	                            }
							}
							KeyboardButtonMD3 {text: qsTr("BS")}
							KeyboardButtonMD3 {text: qsTr("Page\nDown")}
							KeyboardButtonMD3 {text: qsTr("DEL")}
							KeyboardButtonMD3 {
								Image {
	                                anchors.fill: parent
	                                anchors.margins: 2 * defaultMargin
	                                source: "../../resources/left_arrow.png"
	                                mipmap: true
	                            }
							}
							KeyboardButtonMD3 {
								Image {
                                    anchors.fill: parent
                                    anchors.margins: 16
                                    source: "../../resources/up_arrow.png"
                                    mipmap: true
                                }
                            }
							KeyboardButtonMD3 {
								Image {
                                    anchors.fill: parent
                                    anchors.margins: 16
                                    source: "../../resources/right_arrow.png"
                                    mipmap: true
                                }
							}
							KeyboardButtonMD3 {text: qsTr("SPACE")}
							KeyboardButtonMD3 {
								Image {
	                                anchors.fill: parent
	                                anchors.margins: 16
	                                source: "../../resources/down_arrow.png"
	                                mipmap: true
	                            }
							}

							KeyboardButtonMD3 {
								text: qsTr("ENTER")
								Layout.rowSpan: 2
								Layout.fillHeight: true

								contentItem: Text {
	                                horizontalAlignment: Text.AlignHCenter
	                                verticalAlignment: Text.AlignTop
	                                text: parent.text
	                                color: "#000"
	                            }

                                background: Rectangle {
                                    anchors.fill: parent
                                    implicitWidth: 64
                                    implicitHeight: implicitWidth
                                    radius: 8
                                    border.color: "#000"
                                    border.width: 4
                                    color: "#aeada8"

                                    Row {
                                        anchors.centerIn: parent
                                        spacing: 10
                                        Repeater {
                                            model: 3
                                            Rectangle {width: 10; height: 2; color: "#000"}
                                        }
                                    }

	                                MouseArea {
								        anchors.fill: parent
								        hoverEnabled: true
								        onEntered: parent.color = Qt.darker("#aeada8", 1.5)
								        onExited: parent.color = "#aeada8"
								    }
	                            }
							}

							KeyboardButtonMD3 {
								text: qsTr("ENTER")
								Layout.columnSpan: 2
								Layout.fillWidth: true
								contentItem: Text {
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    text: parent.text
                                    color: "#000"
                                }

	                            background: Rectangle {
	                                anchors.fill: parent
	                                implicitWidth: 64
	                                implicitHeight: implicitWidth
	                                radius: 8
	                                border.color: "#000"
	                                border.width: 4
	                                color: "#aeada8"

                                    Column {
                                        anchors.centerIn: parent
                                        spacing: 10
                                        Repeater {
                                            model: 3
                                            Rectangle {width: 2; height: 10; color: "#000"}
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: parent.color = Qt.darker("#aeada8", 1.5)
                                        onExited: parent.color = "#aeada8"
                                    }
	                            }
							}
						}
					}
				}
			}

			Rectangle {
				implicitWidth: selectModeSmallKeyboardLayout.implicitWidth + 2 * defaultMargin
				implicitHeight: selectModeSmallKeyboardLayout.implicitHeight + 2 * defaultMargin
				color: "transparent"
				radius: 8
				border.width: 3
				border.color: "black"

				GridLayout {
					id: selectModeSmallKeyboardLayout

					anchors.fill: parent
					anchors.margins: defaultMargin

		            rows: 2
		            columns: 3

                    KeyboardButtonMD3 {
                        backgroundColor: keyboard.redButtonColor
                        text: qsTr("РУС")
                        textVerticalAlignment: Text.AlignTop
                    }

                    KeyboardButtonMD3 {
                        backgroundColor: keyboard.blueButtonColor
                        text: qsTr("РУС")
                        textVerticalAlignment: Text.AlignTop
                    }

                    KeyboardButtonMD3 {
                        backgroundColor: keyboard.redButtonColor
                        Layout.row: 1
                        text: qsTr("ЛАТ")
                        textVerticalAlignment: Text.AlignBottom
                    }

                    KeyboardButtonMD3 {
                        backgroundColor: keyboard.blueButtonColor
                        text: qsTr("ЛАТ")
                        textVerticalAlignment: Text.AlignBottom
                    }

                    KeyboardButtonMD3 {
                        text: qsTr("ЦИФ")
                    }
                }
			}
        }
    }
}