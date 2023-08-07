import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "./custom"

Window {
    id: mainWindow

    property int defaultMargin: 8
    property int doubleDefaultMargin: 2 * defaultMargin

    minimumWidth: authWindowLayout.implicitWidth + doubleDefaultMargin
    minimumHeight: authWindowLayout.implicitHeight + doubleDefaultMargin
    width: minimumWidth
    height: minimumHeight
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: true
    title: qsTr("Р439-МД3 Вход")

    StackLayout {
        id: authWindowLayout

        property int signInPageIndex: 0
        property int signUpPageIndex: 1

        /*
        *   Sign in page
        */
        ColumnLayout {
            GridLayout {

            }

            Separator {}

            GridLayout {

            }
        }

        /*
        *   Sign up page
        */
        ColumnLayout {
            GridLayout {

            }

            Separator {}

            GridLayout {

            }
        }
    }
}