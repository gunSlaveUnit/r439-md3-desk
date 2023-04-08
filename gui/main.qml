import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Dialogs

import "./custom"

Window {
    visible: true
    title: qsTr("MD3Desk")

    property int default_margin: 8
    property int main_width: row_layout.implicitWidth + default_margin * 2
    property int main_height: row_layout.implicitHeight + default_margin * 2

    width: main_width
    height: main_height
    minimumWidth: main_width
    minimumHeight: main_height

    Connections {
        target: norm

        function onPassed() {
            dialog.visible = true
        }
    }

    MessageDialog {
        id: dialog
        text: qsTr("Норматив успешно завершен")
        visible: false
        buttons: MessageDialog.Ok
    }

    RowLayout {
        id: row_layout
        anchors.fill: parent
        anchors.margins: default_margin

        ColumnLayout {
            GridLayout {
                rows: 2
                columns: 3

                ButtonMD3 {Layout.fillWidth: true; text: qsTr("(. Приборы - авария")}
                ButtonMD3 {Layout.fillWidth: true; text: qsTr("15-02-2023")}
                ButtonMD3 {Layout.fillWidth: true; text: qsTr("11:36:42")}
                ButtonMD3 {Layout.fillWidth: true; text: qsTr("). Обмен")}
                ButtonMD3 {Layout.fillWidth: true; text: qsTr("<. Запрет ПРД")}
                ButtonMD3 {Layout.fillWidth: true; text: qsTr(">. Тракт ПРМ - не норма")}
            }

            StackLayout {
                id: display_stack

                property int main_page_index: 0
                property int monitor_page_index: 1
                property int regulations_page_index: 2
                property int regulations_status_page_index: 3
                property int regulations_status_agl_1_page_index: 4
                property int regulations_status_agl_2_page_index: 5
                property int regulations_status_dmd_uzozm_page_index: 6
                property int regulations_mode_page_index: 7
                property int regulations_mode_klu_1_page_index: 8
                property int regulations_mode_klu_2_page_index: 9
                property int regulations_mode_klu_3_page_index: 10
                property int regulations_mode_dmd_uzozm_1_page_index: 11
                property int regulations_mode_dmd_uzozm_2_page_index: 12
                property int regulations_mode_tracts_prm_prd_1_page_index: 13
                property int regulations_mode_tracts_prm_prd_2_page_index: 14
                property int regulations_mode_l807_page_index: 15
                property int regulations_mode_agl_page_index: 16
                property int regulations_mode_agl_device_page_index: 17
                property int regulations_mode_agl_tlf1_page_index: 18
                property int regulations_plume_page_index: 19

                ColumnLayout {
                    // Main page

                    ButtonMD3 {text: qsTr("ГЛАВНОЕ")}

                    GridLayout {
                        rows: 6
                        columns: 2
                        flow: GridLayout.TopToBottom

                        ButtonMD3 {text: qsTr("1. СХОС")}
                        ButtonMD3 {text: qsTr("2. Монитор"); onClicked: {display_stack.currentIndex = display_stack.monitor_page_index}}
                        ButtonMD3 {text: qsTr("3. Сл. связь")}
                        ButtonMD3 {text: qsTr("4. Архив команд")}
                        ButtonMD3 {text: qsTr("5. РАТС")}
                        ButtonMD3 {text: qsTr("6. ПРД")}
                        ButtonMD3 {text: qsTr("7. Установка")}
                        ButtonMD3 {text: qsTr("8. Регламент"); onClicked: {display_stack.currentIndex = display_stack.regulations_page_index}}
                        ButtonMD3 {text: qsTr("9. Антенна")}
                        ButtonMD3 {text: qsTr("0. Ок. сеанса"); Layout.row: 4; Layout.column: 1}
                    }
                }

                ColumnLayout {
                    // Monitor page

                    GridLayout {
                        rows: 3
                        columns: 2

                        GridLayout {
                            rows: 3
                            columns: 2

                            TextMD3 {text: qsTr("Прием ШПС:")}
                            TextMD3 {text: qsTr("Не задан")}

                            TextMD3 {text: qsTr("Уровень:")}
                            TextMD3 {text: qsTr("257")}

                            ButtonMD3 {text: qsTr("1. Тест")}
                            ButtonMD3 {text: qsTr("2. Поиск")}
                        }

                        GridLayout {
                            rows: 3
                            columns: 2

                            TextMD3 {text: qsTr("Прием УП:")}
                            TextMD3 {text: qsTr("Есть")}

                            TextMD3 {text: qsTr("Уровень:")}
                            TextMD3 {text: qsTr("16325")}

                            ButtonMD3 {text: qsTr("3. Поиск"); Layout.row: 2; Layout.column: 1}
                        }

                        GridLayout {
                            rows: 3
                            columns: 2

                            TextMD3 {text: qsTr("Качество ДМД:")}
                            TextMD3 {text: qsTr("Норма")}

                            TextMD3 {text: qsTr("ГС 6 кБод:")}
                            TextMD3 {text: qsTr("Нет СЦС")}

                            TextMD3 {text: qsTr("ГС доп:")}
                            TextMD3 {text: qsTr("Не задан")}
                        }

                        GridLayout {
                            rows: 2
                            columns: 2

                            Layout.row: 2
                            Layout.column: 0

                            TextMD3 {text: qsTr("ППРЧ:")}
                            TextMD3 {text: qsTr("Не задан")}

                            TextMD3 {text: qsTr("Мощность:")}
                            TextMD3 {text: qsTr("Запрет")}
                        }

                        GridLayout {
                            rows: 2
                            columns: 2

                            ButtonMD3 {text: qsTr("4. Пуск")}
                            ButtonMD3 {text: qsTr("5. АГ-Л")}
                            ButtonMD3 {text: qsTr("6. Стоп")}
                            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.main_page_index}}
                        }
                    }
                }

                ColumnLayout {
                    // Regulations page

                    ButtonMD3 {text: qsTr("РЕГЛАМЕНТ")}

                    GridLayout {
                        rows: 3
                        columns: 2
                        flow: GridLayout.TopToBottom

                        ButtonMD3 {text: qsTr("1. Состояние"); onClicked: {display_stack.currentIndex = display_stack.regulations_status_page_index}}
                        ButtonMD3 {text: qsTr("2. Режим"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                        ButtonMD3 {text: qsTr("3. Режим АГ-Л"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_agl_page_index}}
                        ButtonMD3 {text: qsTr("4. Монитор")}
                        ButtonMD3 {text: qsTr("5. Шлейф"); onClicked: {display_stack.currentIndex = display_stack.regulations_plume_page_index}}
                        ButtonMD3 {text: qsTr("6. Управление")}
                    }

                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.main_page_index}}
                }

                ColumnLayout {
                    // Status page

                    GridLayout {
                        rows: 4
                        columns: 2
                        flow: GridLayout.TopToBottom

                        ButtonMD3 {text: qsTr("1. Общее")}
                        ButtonMD3 {text: qsTr("2. АГ-Л"); onClicked: display_stack.currentIndex = display_stack.regulations_status_agl_1_page_index}
                        ButtonMD3 {text: qsTr("3. ПГ-Л")}
                        ButtonMD3 {text: qsTr("4. КЛ-У")}
                        ButtonMD3 {text: qsTr("5. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = display_stack.regulations_status_dmd_uzozm_page_index}}
                        ButtonMD3 {text: qsTr("6. Тракты ПРД, ПРМ")}
                    }

                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_page_index}}
                }

                ColumnLayout {
                    // Status AGL page 1

                    GridLayout {
                        rows: 11
                        columns: 2

                        TextMD3 {text: qsTr("Норма ТЭЗ АГ-БЛ:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Норма ТЭЗ АГ-АЛ:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Корректность режима:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Норма каналов:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Синхронизация с РТР:")}
                        TextMD3 {text: "Пусто"}

                        TextMD3 {text: qsTr("Запрос КАУ ПРМ:")}
                        TextMD3 {text: "Нет"}

                        TextMD3 {text: qsTr("Запрос РАТС:")}
                        TextMD3 {text: "Нет"}

                        TextMD3 {text: qsTr("Прием ГС основного:")}
                        TextMD3 {text: "Норма"}

                        TextMD3 {text: qsTr("Ошибки в ГС основном:")}
                        TextMD3 {text: "0"}

                        TextMD3 {text: qsTr("Прием ГС дополнительного:")}
                        TextMD3 {text: "Не задан"}

                        TextMD3 {text: qsTr("Ошибки в ГС дополнительном:")}
                        TextMD3 {text: "Пусто"}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr(">"); onClicked: display_stack.currentIndex = display_stack.regulations_status_agl_2_page_index}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_status_page_index}}
                    }
                }

                ColumnLayout {
                    // Status AGL page 2

                    GridLayout {
                        rows: 9
                        columns: 2

                        TextMD3 {text: qsTr("Режим ПРМ:")}
                        TextMD3 {text: "Задан"}

                        TextMD3 {text: qsTr("Сигнал на входе РТР:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Сигнал абонента:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Информация:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Ошибки:")}
                        TextMD3 {text: "0"}

                        TextMD3 {text: qsTr("Режим ПРД:")}
                        TextMD3 {text: "Задан"}

                        TextMD3 {text: qsTr("Синхронизация:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Сигнал на входе:")}
                        TextMD3 {text: "Есть"}

                        TextMD3 {text: qsTr("Информация на входе:")}
                        TextMD3 {text: "Есть"}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("<"); onClicked: display_stack.currentIndex = display_stack.regulations_status_agl_1_page_index}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_status_page_index}}
                    }
                }

                ColumnLayout {
                    // Status DMD UZOZM page

                    GridLayout {
                        rows: 8
                        columns: 2

                        TextMD3 {text: qsTr("Норма УПЧ:")}
                        TextMD3 {text: qsTr("Есть")}

                        TextMD3 {text: qsTr("Норма ДМД:")}
                        TextMD3 {text: qsTr("Есть")}

                        TextMD3 {text: qsTr("Захват ПЧ")}
                        TextMD3 {text: qsTr("Есть")}

                        TextMD3 {text: qsTr("Захват ТЧ:")}
                        TextMD3 {text: qsTr("Есть")}

                        TextMD3 {text: qsTr("Поиск:")}
                        TextMD3 {text: qsTr("Нет")}

                        TextMD3 {text: qsTr("Качество сигнала:")}
                        TextMD3 {text: qsTr("Норма")}

                        TextMD3 {text: qsTr("Расстройка, Гц:")}
                        TextMD3 {text: qsTr("-100")}

                        TextMD3 {text: qsTr("Уровень ПРМ:")}
                        TextMD3 {text: qsTr("16513")}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_status_page_index}}
                    }
                }

                ColumnLayout {
                    // Mode page

                    ButtonMD3 {text: qsTr("ВВОД РЕЖИМНЫХ ПАРАМЕТРОВ")}

                    GridLayout {
                        rows: 6
                        columns: 3

                        ButtonMD3 {Layout.row: 0; Layout.column: 0; text: qsTr("1. Общее")}
                        ButtonMD3 {Layout.row: 1; Layout.column: 0; text: qsTr("2. ПГ-Л")}
                        ButtonMD3 {Layout.row: 2; Layout.column: 0; text: qsTr("3. КЛ-У"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_klu_1_page_index}}
                        ButtonMD3 {Layout.row: 0; Layout.column: 1; text: qsTr("4. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_dmd_uzozm_1_page_index}}
                        ButtonMD3 {Layout.row: 1; Layout.column: 1; text: qsTr("5. Тракты ПРД, ПРМ"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_tracts_prm_prd_1_page_index}}
                        ButtonMD3 {Layout.row: 0; Layout.column: 2; text: qsTr("6. Л807"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_l807_page_index}}

                        ColumnLayout {
                            Layout.row: 2;
                            Layout.column: 1
                            Layout.rowSpan: 4;
                            Layout.columnSpan: 2

                            TextMD3 {text: qsTr("Внимание!")}
                            TextMD3 {text: qsTr("Вы вошли в технологический режим\nуправления станцией.\nКоррекция режимных параметров\nможет привести к нарушению\n рабочего режима")}
                        }
                    }

                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_page_index}}
                }

                ColumnLayout {
                    // KLU page 1

                    GridLayout {
                        rows: 8
                        columns: 2

                        TextMD3 {text: qsTr("Вид сигнала ПРМ:")}
                        ComboBoxMD3 {model: [qsTr("Спец. ГС")]}

                        TextMD3 {text: qsTr("Код Баркера ПРМ:")}
                        ComboBoxMD3 {model: [qsTr("Вкл.")]}

                        TextMD3 {text: qsTr("Инверсия кода Баркера:")}
                        ComboBoxMD3 {model: [qsTr("Вкл.")]}

                        TextMD3 {text: qsTr("ДСЧ:")}
                        ComboBoxMD3 {model: [qsTr("Вкл.")]}

                        TextMD3 {text: qsTr("Номер ключа ПРМ:")}
                        ComboBoxMD3 {model: [0]}

                        TextMD3 {text: qsTr("Номер подключа ПРМ:")}
                        ComboBoxMD3 {model: [1]}

                        TextMD3 {text: qsTr("Полоса поиска ПРМ, кГц:")}
                        ComboBoxMD3 {model: [qsTr("+-1")]}

                        TextMD3 {text: qsTr("Ft ПСП ПРМ:")}
                        ComboBoxMD3 {model: [qsTr("Ft2")]}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr(">"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_klu_2_page_index}}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // KLU page 2

                    GridLayout {
                        rows: 5
                        columns: 2

                        TextMD3 {text: qsTr("Вид сигнала ПРД:")}
                        ComboBoxMD3 {model: [qsTr("Спец. ГС")]}

                        TextMD3 {text: qsTr("Код Баркера ПРД:")}
                        ComboBoxMD3 {model: [qsTr("Вкл.")]}

                        TextMD3 {text: qsTr("Номер ключа ПРД:")}
                        ComboBoxMD3 {model: [0]}

                        TextMD3 {text: qsTr("Номер подключа ПРД:")}
                        ComboBoxMD3 {model: [1]}

                        TextMD3 {text: qsTr("Ft ПСП ПРД:")}
                        ComboBoxMD3 {model: [qsTr("Ft2")]}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_klu_1_page_index}}
                        ButtonMD3 {text: qsTr(">"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_klu_3_page_index}}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // KLU page 3

                    Connections {
                        target: klu
                    }

                    GridLayout {
                        rows: 8
                        columns: 2

                        TextMD3 {text: qsTr("Тестпроверка:")}
                        ComboBoxMD3 {
                            model: klu.test_check_modes
                            onCurrentIndexChanged: {
                                klu.test_check = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Режим теста:")}
                        ComboBoxMD3 {model: [qsTr("ПР")]}

                        TextMD3 {text: qsTr("ПРД 70:")}
                        ComboBoxMD3 {
                          currentIndex: klu.prd70
                            model: klu.prd70_modes
                            onCurrentIndexChanged: {
                                klu.prd70 = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Сброс счетчика ошибок:")}
                        ComboBoxMD3 {model: [qsTr("Откл.")]}

                        TextMD3 {text: qsTr("Служебный 1:")}
                        ComboBoxMD3 {model: [qsTr("Откл.")]}

                        TextMD3 {text: qsTr("Служебный 2:")}
                        ComboBoxMD3 {model: [qsTr("Откл.")]}

                        TextMD3 {text: qsTr("Тип сигнала ПРД:")}
                        ComboBoxMD3 {
                            model: klu.prd_signal_types
                            onCurrentIndexChanged: {
                                klu.prd_signal_type = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Ft ПСП ШПС ПРД:")}
                        ComboBoxMD3 {model: [qsTr("Ft2")]}
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_klu_2_page_index}}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // DMD UZOZM page 1

                    Connections {
                        target: dmd_uzozm
                    }

                    GridLayout {
                        rows: 7
                        columns: 2

                        TextMD3 {text: qsTr("Тип радиосигнала ПРМ:")}
                        ComboBoxMD3 {
                          currentIndex: dmd_uzozm.prm_signal_type
                            model: dmd_uzozm.prm_signal_types
                            onCurrentIndexChanged: {
                                dmd_uzozm.prm_signal_type = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Декодер:")}
                        ComboBoxMD3 {
                          currentIndex: dmd_uzozm.decoder
                            model: dmd_uzozm.decoder_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.decoder = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Скорость ДМД, кбит/с:")}
                        ComboBoxMD3 {
                          currentIndex: dmd_uzozm.dmd_speed
                            model: dmd_uzozm.dmd_speeds
                            onCurrentIndexChanged: {
                                dmd_uzozm.dmd_speed = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Режим ДМД:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.dmd_modes
                            onCurrentIndexChanged: {
                                dmd_uzozm.dmd_mode = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Скорость ПРД УЗОЗМ, кбит/с:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.prd_uzozm_speeds
                            onCurrentIndexChanged: {
                                dmd_uzozm.prd_uzozm_speed = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Режим УЗОЗМ:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.uzozm_modes
                            onCurrentIndexChanged: {
                                dmd_uzozm.uzozm_mode = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Служебный канал в ФТ4:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.service_channel_ft4_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.service_channel_ft4 = currentIndex
                                norm.check()
                            }
                        }
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr(">"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_dmd_uzozm_2_page_index}}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // DMD UZOZM page 2

                    Connections {
                        target: dmd_uzozm
                    }

                    GridLayout {
                        rows: 7
                        columns: 2

                        TextMD3 {text: qsTr("Номер фильтра:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.filter_numbers
                            onCurrentIndexChanged: {
                                dmd_uzozm.filter_number = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("АРУ:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.aru_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.aru = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Автопоиск:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.auto_search_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.auto_search = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("АСЧ:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.asch_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.asch = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Диф. декодер:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.dif_decoder_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.dif_decoder = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Полоса ДМД:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.dmd_bands
                            onCurrentIndexChanged: {
                                dmd_uzozm.dmd_band = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Корректор:")}
                        ComboBoxMD3 {
                            model: dmd_uzozm.corrector_variants
                            onCurrentIndexChanged: {
                                dmd_uzozm.corrector = currentIndex
                                norm.check()
                            }
                        }
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_dmd_uzozm_1_page_index}}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // Tracts PRM PRD page 1

                    Connections {
                        target: tracts_prm_prd
                    }

                    GridLayout {
                        rows: 5
                        columns: 2

                        TextMD3 {text: qsTr("Автоконтроль CAN:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.auto_check_can
                            model: tracts_prm_prd.auto_check_can_variants
                            onCurrentIndexChanged: {
                                tracts_prm_prd.auto_check_can = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Поддиппазон приема:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.receive_subband
                            model: tracts_prm_prd.receive_subbands
                            onCurrentIndexChanged: {
                                tracts_prm_prd.receive_subband = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Генератор сдвига:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.shift_generator
                            model: tracts_prm_prd.shift_generator_variants
                            onCurrentIndexChanged: {
                                tracts_prm_prd.shift_generator = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Ствольный фильтр:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.barrel_filter
                            model: tracts_prm_prd.barrel_filter_variants
                            onCurrentIndexChanged: {
                                tracts_prm_prd.barrel_filter = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Усилитель мощности:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.amplifier
                            model: tracts_prm_prd.amplifier_variants
                            onCurrentIndexChanged: {
                                tracts_prm_prd.amplifier = currentIndex
                                norm.check()
                            }
                        }
                    }

                    RowLayout {
                        ButtonMD3 {
                            text: qsTr(">")
                            onClicked: display_stack.currentIndex = display_stack.regulations_mode_tracts_prm_prd_2_page_index
                        }

                        ButtonMD3 {
                            text: qsTr("0. Выход")
                            onClicked: display_stack.currentIndex = display_stack.regulations_mode_page_index
                        }
                    }
                }

                ColumnLayout {
                    // Tracts PRM PRD page 2

                    Connections {
                        target: tracts_prm_prd
                    }

                    GridLayout {
                        rows: 6
                        columns: 2

                        TextMD3 {text: qsTr("Тип радиосигнала:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.radio_signal
                            model: tracts_prm_prd.radio_signal_types
                            onCurrentIndexChanged: {
                                tracts_prm_prd.radio_signal = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Вид сигнала ОФТ:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.signal_type
                            model: tracts_prm_prd.signal_types
                            onCurrentIndexChanged: {
                                tracts_prm_prd.signal_type = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Скорость ЗС:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.zs_speed
                            model: tracts_prm_prd.zs_speeds
                            onCurrentIndexChanged: {
                                tracts_prm_prd.zs_speed = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Выход У205Д:")}
                        ComboBoxMD3 {
                          currentIndex: tracts_prm_prd.output_u205d
                            model: tracts_prm_prd.outputs_u205d
                            onCurrentIndexChanged: {
                                tracts_prm_prd.output_u205d = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Номер волны ПРД:")}
                        TextFieldMD3 {
                            text: tracts_prm_prd.prd_wave_number
                            onEditingFinished: {
                              tracts_prm_prd.prd_wave_number = text
                              norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Номер волны ПРМ:")}
                        TextFieldMD3 {
                            text: tracts_prm_prd.prm_wave_number
                            onEditingFinished: {
                              tracts_prm_prd.prm_wave_number = text
                              norm.check()
                            }
                        }
                    }

                    RowLayout {
                        ButtonMD3 {
                            text: qsTr("<")
                            onClicked: display_stack.currentIndex = display_stack.regulations_mode_tracts_prm_prd_1_page_index
                        }

                        ButtonMD3 {
                            text: qsTr("0. Выход")
                            onClicked: display_stack.currentIndex = display_stack.regulations_mode_page_index
                        }
                    }
                }

                ColumnLayout {
                    // L807

                    Connections {
                        target: l807
                    }

                    ButtonMD3 {
                        text: qsTr("Л807")
                    }

                    TextMD3 {text: qsTr("Установленные интерфейсы:")}
                    TextMD3 {text: qsTr("Интерфейс не обеспечивается")}

                    GridLayout {
                        rows: 2
                        columns: 2

                        TextMD3 {text: qsTr("Стык Л807:")}
                        ComboBoxMD3 {
                            model: l807.joint_modes
                            currentIndex: l807.joint
                            onCurrentIndexChanged: {
                                l807.joint = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Источник сигнала: ")}
                        ComboBoxMD3 {
                            model: l807.signal_source_modes
                            currentIndex: l807.signal_source
                            onCurrentIndexChanged: {
                                l807.signal_source = currentIndex
                                norm.check()
                            }
                        }
                    }

                    RowLayout {
                        ButtonMD3 {text: qsTr("1. Изм.")}
                        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_page_index}}
                    }
                }

                ColumnLayout {
                    // Mode AGL page

                    ButtonMD3 {
                        text: qsTr("РЕЖИМ АГ-Л")
                    }

                    GridLayout {
                        rows: 6
                        columns: 3
                        flow: GridLayout.TopToBottom

                        ButtonMD3 {text: qsTr("1. Режим прибора"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_agl_device_page_index}}
                        ButtonMD3 {text: qsTr("2. ТЛФ1"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_agl_tlf1_page_index}}
                        ButtonMD3 {text: qsTr("3. ТЛФ2")}
                        ButtonMD3 {text: qsTr("4. ТЛФ3")}
                        ButtonMD3 {text: qsTr("5. ТЛФ4")}
                        ButtonMD3 {text: qsTr("6. ТЛФ5")}
                        ButtonMD3 {text: qsTr("7. КАУ1")}
                        ButtonMD3 {text: qsTr("8. КАУ2")}
                        ButtonMD3 {text: qsTr("9. КАУ3")}
                        ButtonMD3 {text: qsTr("10. КАУ4")}
                        ButtonMD3 {text: qsTr("11. КАУ5")}
                        ButtonMD3 {text: qsTr("12. ТЛГ1")}
                        ButtonMD3 {text: qsTr("13. ТЛГ2")}
                        ButtonMD3 {text: qsTr("14. ТЛГ3")}
                        ButtonMD3 {text: qsTr("15. ТЛГ4")}
                        ButtonMD3 {text: qsTr("16. Синх. вход")}
                    }

                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: display_stack.currentIndex = display_stack.regulations_page_index}
                }

                ColumnLayout {
                    // Device mode page

                    Connections {
                        target: agl
                    }

                    GridLayout {
                        rows: 4
                        columns: 2

                        TextMD3 {text: qsTr("Режим работы ЗС")}
                        ComboBoxMD3 {
                            model: agl.zs_operating_mode_variants
                            onCurrentIndexChanged: {
                                agl.zs_operating_mode = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Скор ГС ПРМ кбит/c")}
                        ComboBoxMD3 {
                            model: agl.speed_gs_prm_variants
                            onCurrentIndexChanged: {
                                agl.speed_gs_prm = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Скор ГС ПРД кбит/c")}
                        ComboBoxMD3 {
                            model: agl.speed_gs_prd_variants
                            onCurrentIndexChanged: {
                                agl.speed_gs_prd = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Режим РАТС")}
                        ComboBoxMD3 {
                            model: agl.rats_mode_variants
                            onCurrentIndexChanged: {
                                agl.rats_mode = currentIndex
                                norm.check()
                            }
                        }
                    }

                    ButtonMD3 {
                        text: qsTr("0. Выход")
                        onClicked: display_stack.currentIndex = display_stack.regulations_mode_agl_page_index
                    }
                }

                ColumnLayout {
                    // TLF1 page

                    Connections {
                        target: tlf1
                    }

                    GridLayout {
                        columns: 2

                        Column {
                            TextMD3 {text: qsTr("Тип сигнала ПРМ")}
                            ComboBoxMD3 {
                                model: tlf1.signal_prm_types
                                onCurrentIndexChanged: {
                                    tlf1.signal_prm_type = currentIndex
                                    norm.check()
                                }
                            }

                            TextMD3 {text: qsTr("Скорость")}
                            ComboBoxMD3 {
                                model: tlf1.prm_speeds
                                onCurrentIndexChanged: {
                                    tlf1.prm_speed = currentIndex
                                    norm.check()
                                }
                            }

                            TextMD3 {text: qsTr("Адрес в ГС")}
                            RowLayout {
                                ComboBoxMD3 {
                                    model: tlf1.prm_addresses_one
                                    onCurrentIndexChanged: {
                                        tlf1.prm_address_one = currentIndex
                                        norm.check()
                                    }
                                }

                                ComboBoxMD3 {
                                    model: tlf1.prm_addresses_two
                                    onCurrentIndexChanged: {
                                        tlf1.prm_address_two = currentIndex
                                        norm.check()
                                    }
                                }

                                ComboBoxMD3 {
                                    model: tlf1.prm_addresses_three
                                    onCurrentIndexChanged: {
                                        tlf1.prm_address_three = currentIndex
                                        norm.check()
                                    }
                                }
                            }
                        }

                        Column {
                            TextMD3 {text: qsTr("Тип сигнала ПРД")}
                            ComboBoxMD3 {
                                model: tlf1.signal_prd_types
                                onCurrentIndexChanged: {
                                    tlf1.signal_prd_type = currentIndex
                                    norm.check()
                                }
                            }

                            TextMD3 {text: qsTr("Скорость")}
                            ComboBoxMD3 {
                                model: tlf1.prd_speeds
                                onCurrentIndexChanged: {
                                    tlf1.prd_speed = currentIndex
                                    norm.check()
                                }
                            }

                            TextMD3 {text: qsTr("Адрес в ГС")}
                            RowLayout {
                                ComboBoxMD3 {
                                    model: tlf1.prd_addresses_one
                                    onCurrentIndexChanged: {
                                        tlf1.prd_address_one = currentIndex
                                        norm.check()
                                    }
                                }

                                ComboBoxMD3 {
                                    model: tlf1.prd_addresses_two
                                    onCurrentIndexChanged: {
                                        tlf1.prd_address_two = currentIndex
                                        norm.check()
                                    }
                                }
                            }
                        }
                    }


                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_mode_agl_page_index}}
                }

                ColumnLayout {
                    // Plume page

                    Connections {
                        target: plume
                    }

                    GridLayout {
                        rows: 4
                        columns: 2

                        TextMD3 {text: qsTr("Генератор сдвига:")}
                        ComboBoxMD3 {
                            model: plume.shift_generator_variants
                            currentIndex: plume.shift_generator
                            onCurrentIndexChanged: {
                                plume.shift_generator = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Усилитель мощности:")}
                        ComboBoxMD3 {
                            model: plume.amplifier_variants
                            currentIndex: plume.amplifier
                            onCurrentIndexChanged: {
                                plume.amplifier = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Выход У205Д:")}
                        ComboBoxMD3 {
                            model: plume.outputs_u205d
                            currentIndex: plume.output_u205d
                            onCurrentIndexChanged: {
                                plume.output_u205d = currentIndex
                                norm.check()
                            }
                        }

                        TextMD3 {text: qsTr("Номер волны ПРД:")}
                        TextFieldMD3 {
                            text: plume.prd_wave_number
                            onEditingFinished: {
                              plume.prd_wave_number = text
                              norm.check()
                            }
                        }
                    }

                    GridLayout {
                        rows: 2
                        columns: 4

                        TextMD3 {text: qsTr("Ствол. фильтр:")}
                        TextMD3 {
                            text: plume.stem_filter
                        }

                        TextMD3 {text: qsTr("№ волны ПРМ:")}
                        TextMD3 {
                            text: plume.prm_wave_number
                        }

                        TextMD3 {text: qsTr("Поддиап. приема:")}
                        TextMD3 {
                            text: plume.receive_subband
                        }

                        TextMD3 {text: qsTr("№ фильтра ДМД:")}
                        TextMD3 {
                            text: plume.dmd_filter_number
                        }
                    }

                    ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = display_stack.regulations_page_index}}
                }
            }
        }

        GridLayout {
            id: keyboard_grid
            rows: 6
            columns: 8
            flow: GridLayout.TopToBottom
            anchors.margins: 8

            property var red_color: "#bb534b"
            property var blue_color: "#335e89"

            KeyBoardButtonMD3 {text: qsTr("ESC")}
            KeyBoardButtonMD3 {
                text: qsTr("РУС")

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: keyboard_grid.red_color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.background.color = Qt.darker(keyboard_grid.red_color, 1.5)
                    onExited: parent.background.color = keyboard_grid.red_color
                }
            }
            KeyBoardButtonMD3 {
                text: qsTr("РУС")

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: keyboard_grid.blue_color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.background.color = Qt.darker(keyboard_grid.blue_color, 1.5)
                    onExited: parent.background.color = keyboard_grid.blue_color
                }
            }
            KeyBoardButtonMD3 {
                text: qsTr("ЛАТ")

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: keyboard_grid.red_color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.background.color = Qt.darker(keyboard_grid.red_color, 1.5)
                    onExited: parent.background.color = keyboard_grid.red_color
                }
            }
            KeyBoardButtonMD3 {
                text: qsTr("ЛАТ")

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: keyboard_grid.blue_color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.background.color = Qt.darker(keyboard_grid.blue_color, 1.2)
                    onExited: parent.background.color = keyboard_grid.blue_color
                }
            }
            KeyBoardButtonMD3 {
                text: qsTr("ЦИФ")

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }
            }

            KeyBoardButtonMD3 {text: qsTr("F1")}
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("А"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Б"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("("); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("A"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("B"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("И"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Й"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("+"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("I"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("J"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Р"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("С"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("/"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("Q"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("R"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ш"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Щ"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("*"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("Y"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("Z"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("="); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("/"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("\\"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }

            KeyBoardButtonMD3 {text: qsTr("F2")}
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("В"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Г"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr(")"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("C"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("D"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color:  keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("К"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Л"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("7"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("K"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("L"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Т"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("У"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("4"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("S"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("T"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ъ"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Ы"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("1"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("("); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr(")"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("0"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("@"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("*"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }

            KeyBoardButtonMD3 {text: qsTr("F3")}
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Д"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Е"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("<"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("E"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("F"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("М"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Н"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("8"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("M"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("N"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ф"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Х"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("5"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("U"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("V"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ь"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Э"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("2"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("!"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("?"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr(","); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("\""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("\""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }

            KeyBoardButtonMD3 {text: qsTr("F4")}
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ж"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("З"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr(">"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("G"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("H"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("О"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("П"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("9"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("O"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("P"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ц"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Ч"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("6"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("W"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("X"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr("Ю"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                    Text {text: qsTr("Я"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("3"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("."); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr(";"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }
            KeyBoardButtonMD3 {
                contentItem: GridLayout {
                    Text {text: qsTr(":"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                    Text {text: qsTr("-"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                    Text {text: qsTr("%"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                    Text {text: qsTr("&"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
                }
            }

            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 16
                    source: "../resources/clockwise.png"
                    mipmap: true
                }
                Layout.row: 1;
                Layout.column: 5
            }
            KeyBoardButtonMD3 {text: qsTr("BS")}

            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 20
                    source: "../resources/left_arrow.png"
                    mipmap: true
                }
            }

            KeyBoardButtonMD3 {text: qsTr("SPACE")}
            KeyBoardButtonMD3 {
                text: qsTr("ENTER");
                Layout.row: 5;
                Layout.column: 5;
                Layout.columnSpan: 2;
                Layout.fillWidth: true

                contentItem: Text {
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: "#b4afac"

                    Column {
                        anchors.centerIn: parent
                        spacing: 10
                        Repeater {
                            model: 3
                            Rectangle {width: 2; height: 10; color: "#000"}
                        }
                    }
                }
            }

            KeyBoardButtonMD3 {text: qsTr("Page\nUp"); Layout.row: 1; Layout.column: 6}
            KeyBoardButtonMD3 {text: qsTr("Page\nDown")}
            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 20
                    source: "../resources/up_arrow.png"
                    mipmap: true
                }
            }
            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 20
                    source: "../resources/down_arrow.png"
                    mipmap: true
                }
            }

            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 12
                    source: "../resources/up_triangle.png"
                    mipmap: true
                }
            }
            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 16
                    source: "../resources/unclockwise.png"
                    mipmap: true
                }
            }
            KeyBoardButtonMD3 {text: qsTr("DEL")}
            KeyBoardButtonMD3 {
                Image {
                    anchors.fill: parent
                    anchors.margins: 20
                    source: "../resources/right_arrow.png"
                    mipmap: true
                }
            }
            KeyBoardButtonMD3 {
                text: qsTr("ENTER");
                Layout.row: 4;
                Layout.column: 7;
                Layout.rowSpan: 2;
                Layout.fillHeight: true

                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    text: parent.text
                    font.pointSize: 12
                    color: "#000"
                }

                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 72
                    implicitHeight: implicitWidth
                    radius: 8
                    border.color: "#000"
                    border.width: 4
                    color: "#b4afac"

                    Row {
                        anchors.centerIn: parent
                        spacing: 10
                        Repeater {
                            model: 3
                            Rectangle {width: 10; height: 2; color: "#000"}
                        }
                    }
                }
            }
        }
    }
}