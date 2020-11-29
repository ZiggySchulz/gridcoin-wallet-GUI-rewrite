import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    id: backgroundRect
    width: 90
    height: column.implicitHeight + boincBottomPad.implicitHeight + boinc.implicitHeight
    color:  "#360166"
    signal menuButtonClicked(string identification)
    anchors {
        bottom: parent.bottom
        top: parent.top
    }
    Column{
        id: column
        width: backgroundRect.width
        property int buttonHeight: 50
        Rectangle {
            implicitWidth: parent.width
            implicitHeight: 70
            color: "#300b52"
            Rectangle {
                color: "#4b1a75"
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: 1
            }

            Svg {
                id: gridcoinLogo
                source: "Icons/Logos/ic_logo_app_gradient_white.svg"
                anchors.centerIn: parent
                width: parent.width - 20
                height: parent.height - 20
                fillMode: Image.PreserveAspectFit
            }
        }

        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Overview")
            onClicked: backgroundRect.menuButtonClicked("OverviewResearcherView.qml")
            imagePath: pressed ? "Icons/Menu/ic_menu_overview_blue.svg" : "Icons/Menu/ic_menu_overview_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Send")
            onClicked: backgroundRect.menuButtonClicked("MenuButton.qml")
            imagePath: pressed ? "Icons/Menu/ic_menu_send_blue.svg" : "Icons/Menu/ic_menu_send_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Receive")
            imagePath: pressed ? "Icons/Menu/ic_menu_receive_blue.svg" : "Icons/Menu/ic_menu_receive_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("History")
            imagePath: pressed ? "Icons/Menu/ic_menu_history_blue.svg" : "Icons/Menu/ic_menu_history_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Favourites")
            imagePath: pressed ? "Icons/Menu/ic_menu_favorites_blue.svg" : "Icons/Menu/ic_menu_favorites_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Polls")
            imagePath: pressed ? "Icons/Menu/ic_menu_polls_blue.svg" : "Icons/Menu/ic_menu_polls_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("News")
            imagePath: pressed ? "Icons/Menu/ic_menu_news_blue.svg" : "Icons/Menu/ic_menu_news_white.svg"
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Settings")
            imagePath: pressed ? "Icons/Menu/ic_menu_settings_blue.svg" : "Icons/Menu/ic_menu_settings_white.svg"
        }
        Control {
            topPadding: 10
            horizontalPadding: 10
            width: parent.width
            height: 20
            Rectangle {
                anchors.centerIn: parent
                height: 1
                color: "white"
                width: parent.width - 50

            }
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight + 18
            labelText: qsTr("Lock \nWallet")
            imagePath: pressed ? "Icons/Menu/ic_menu_lock_blue.svg" : "Icons/Menu/ic_menu_lock_white.svg"
        }
    }
    Item {
        id: boincBottomPad
        width: 0
        height: 10
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
    }
    Image {
        id: boinc
        source: "Icons/Logos/ic_logo_boinc_color.svg"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: boincBottomPad.top
        }

    }
}
