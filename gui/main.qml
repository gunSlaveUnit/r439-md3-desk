import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "./custom"

Window {
  visible: true
  title: qsTr("MD3Desk")

  property int defaultMargin: 8

  color: "#969392"

  minimumWidth: mainLayout.implicitWidth + 2 * defaultMargin
  minimumHeight: mainLayout.implicitHeight + 2 * defaultMargin

  GridLayout {
    id: mainLayout

    anchors.fill: parent
    anchors.margins: defaultMargin

    rows: 2
    columns: 2

    ColumnLayout {
      Rectangle {
        anchors.fill: parent
        color: "black"
      }

      GridLayout {
        rows: 2
        columns: 3

				// TODO: current date and time from config

        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("(. Приборы - авария")}
        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("15-02-2023")}
        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("11:36:42")}
        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("). Обмен")}
        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr("<. Запрет ПРД")}
        ButtonMD3 {hoverable: false; Layout.fillWidth: true; text: qsTr(">. Тракт ПРМ - не норма")}
      }

			StackLayout {
        id: displayStackLayout

        property int mainPageIndex: 0
        property int regulationsPageIndex: mainPageIndex + 1
        property int regulationsModePageIndex: regulationsPageIndex + 1
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

				ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("ГЛАВНОЕ")}

          GridLayout {
            rows: 6
            columns: 2
            flow: GridLayout.TopToBottom

						// TODO: not equal width

            ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. СХОС")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. Монитор")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. Сл. связь")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. Архив команд")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. РАТС")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. ПРД")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("7. Установка")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("8. Регламент"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("9. Антенна")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("0. Ок. сеанса"); Layout.row: 4; Layout.column: 1}
          }
        }

				ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("РЕГЛАМЕНТ")}

          GridLayout {
            rows: 3
            columns: 2
            flow: GridLayout.TopToBottom

            ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Состояние")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. Режим"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. Режим АГ-Л"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. Монитор")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. Шлейф"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPlumePageIndex}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Управление")}
          }

          Item {Layout.fillHeight: true}

          ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.mainPageIndex}
        }

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

							// TODO: stretch text

              DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Внимание!")}
              DisplayTextMD3 {text: qsTr("Вы вошли в технологический режим\nуправления станцией.\nКоррекция режимных параметров\nможет привести к нарушению\n рабочего режима")}
            }
          }

          Item {Layout.fillHeight: true}

          ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
        }

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

          GridLayout {
            rows: 8
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ПРМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Код Баркера ПРМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Инверсия кода Баркера:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ДСЧ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер ключа ПРМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер подключа ПРМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Полоса поиска ПРМ, кГц:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ПРМ:")}
            ComboBox {Layout.fillWidth: true}
          }

          Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage2Index}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
        }

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

          GridLayout {
            rows: 5
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ПРД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Код Баркера ПРД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер ключа ПРД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер подключа ПРД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ПРД:")}
            ComboBox {Layout.fillWidth: true}
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

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры КЛ-У")}

          GridLayout {
            rows: 8
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тестпроверка:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим теста:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("ПРД 70:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Сброс счетчика ошибок:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный 1:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный 2:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ft ПСП ШПС ПРД:")}
            ComboBox {Layout.fillWidth: true}
          }

          Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeKLUPage2Index}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
        }

        ColumnLayout {
					ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ДМД, УЗОЗМ")}

					GridLayout {
            rows: 7
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип радиосигнала ПРМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Декодер:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ДМД, кбит/с:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим ДМД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ПРД УЗОЗМ, кбит/с:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим УЗОЗМ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Служебный канал в ФТ4:")}
            ComboBox {Layout.fillWidth: true}
          }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeDMDUZOZMPage2Index}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
        }

        ColumnLayout {
					ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ДМД")}

					GridLayout {
            rows: 7
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер фильтра:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("АРУ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Автопоиск:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("АСЧ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Диф. декодер:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Полоса ДМД:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Корректор:")}
            ComboBox {Layout.fillWidth: true}
          }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            Button {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeDMDUZOZMPage1Index}
            ButtonMD3 {text: qsTr(">")}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
        }

        ColumnLayout {
					ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ПРМ, ПРД")}

					GridLayout {
            rows: 5
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Автоконтроль CAN:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Поддиппазон приема:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Генератор сдвига:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ствольный фильтр:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Усилитель мощности:")}
            ComboBox {Layout.fillWidth: true}
          }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr(">"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeTractsPRMPRDPage2Index}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
				}

				ColumnLayout {
					ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режимные параметры ПРМ, ПРД")}

					GridLayout {
            rows: 6
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип радиосигнала:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Вид сигнала ОФТ:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость ЗС:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Выход У205Д:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРД:")}
            TextField {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРМ:")}
            TextField {Layout.fillWidth: true}
          }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr("<"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeTractsPRMPRDPage1Index}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
				}

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Л807")}

          DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Установленные интерфейсы:")}
          DisplayTextMD3 {Layout.alignment: Qt.AlignHCenter; text: qsTr("Интерфейс не обеспечивается")}

          GridLayout {
            rows: 2
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Стык Л807:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Источник сигнала: ")}
            ComboBox {Layout.fillWidth: true}
          }

          Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModePageIndex}
          }
        }

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

          Item {Layout.fillWidth: true}

          ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
        }

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режим прибора АГ-Л")}

          GridLayout {
            rows: 4
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим работы ЗС")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скор ГС ПРМ кбит/c")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скор ГС ПРД кбит/c")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Режим РАТС")}
            ComboBox {Layout.fillWidth: true}
          }

          Item {Layout.fillHeight: true}

          ButtonMD3 {Layout.alignment: Qt.AlignBottom | Qt.AlignRight; text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
        }

        ColumnLayout {
          ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Режим ТЛФ1")}

          GridLayout {
            columns: 2

            Column {
              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРМ")}
              ComboBox {Layout.fillWidth: true}

              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость")}
              ComboBox {Layout.fillWidth: true}

              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Адрес в ГС")}

              RowLayout {
                ComboBox {Layout.fillWidth: true}
                ComboBox {Layout.fillWidth: true}
                ComboBox {Layout.fillWidth: true}
              }
            }

            Column {
              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Тип сигнала ПРД")}
              ComboBox {Layout.fillWidth: true}

              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Скорость")}
              ComboBox {Layout.fillWidth: true}

              DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Адрес в ГС")}

              RowLayout {
                ComboBox {Layout.fillWidth: true}
                ComboBox {Layout.fillWidth: true}
              }
            }
          }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsModeAGLPageIndex}
          }
        }

        ColumnLayout {
					ButtonMD3 {hoverable: false; Layout.alignment: Qt.AlignHCenter; text: qsTr("Шлейф ПР")}

					GridLayout {
            rows: 4
            columns: 2

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Генератор сдвига:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Усилитель мощности:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Выход У205Д:")}
            ComboBox {Layout.fillWidth: true}

            DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Номер волны ПРД:")}
            TextField {Layout.fillWidth: true}
          }

	        GridLayout {
	          rows: 2
	          columns: 4

	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Ствол. фильтр:")}
	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("1")}

	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("№ волны ПРМ:")}
	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("2500")}

	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("Поддиап. приема:")}
	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("1")}

	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("№ фильтра ДМД:")}
	          DisplayTextMD3 {Layout.fillWidth: true; text: qsTr("3")}
	        }

					Item {Layout.fillHeight: true}

          RowLayout {
            ButtonMD3 {text: qsTr("1. Изм.")}
            Item {Layout.fillWidth: true}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: displayStackLayout.currentIndex = displayStackLayout.regulationsPageIndex}
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
              source: "../resources/up_triangle.png"
              mipmap: true
            }
					}
				}
			}

			Item {
				implicitHeight: defaultMargin
			}

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

				Item {
					implicitWidth: defaultMargin
				}

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

				Item {
					implicitWidth: defaultMargin
				}

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
                anchors.margins: 16
                source: "../resources/clockwise.png"
                mipmap: true
              }
						}
						KeyboardButtonMD3 {text: qsTr("Page\nUp")}
						KeyboardButtonMD3 {
							Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/unclockwise.png"
                mipmap: true
              }
						}
						KeyboardButtonMD3 {text: qsTr("BS")}
						KeyboardButtonMD3 {text: qsTr("Page\nDown")}
						KeyboardButtonMD3 {text: qsTr("DEL")}
						KeyboardButtonMD3 {
							Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/left_arrow.png"
                mipmap: true
              }
						}
						KeyboardButtonMD3 {
							Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/up_arrow.png"
                mipmap: true
              }
            }
						KeyboardButtonMD3 {
							Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/right_arrow.png"
                mipmap: true
              }
						}
						KeyboardButtonMD3 {text: qsTr("SPACE")}
						KeyboardButtonMD3 {
							Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/down_arrow.png"
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
	      }

	      KeyboardButtonMD3 {
	        backgroundColor: keyboard.blueButtonColor
	        text: qsTr("РУС")
	      }

	      KeyboardButtonMD3 {
		      backgroundColor: keyboard.redButtonColor
		      Layout.row: 1
		      text: qsTr("ЛАТ")
	      }

	      KeyboardButtonMD3 {
		      backgroundColor: keyboard.blueButtonColor
		      text: qsTr("ЛАТ")
	      }

	      KeyboardButtonMD3 {
	        text: qsTr("ЦИФ")
	      }
	    }
		}
  }
}