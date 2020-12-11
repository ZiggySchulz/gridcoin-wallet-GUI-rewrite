import QtQuick 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0
Rectangle {
    id: backgroundRect
    width: 90
    color:  MMPTheme.themeSelect("#360166", MMPTheme.cSpaceBlack)
    signal menuButtonClicked(string identification)
    anchors {
        bottom: parent.bottom
        top: parent.top
    }
    Rectangle {
        id: rightBorderRect
        z:2
        width: 1
        color: MMPTheme.themeSelect("transparent", MMPTheme.cBlack)
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }

    Column{
        id: column
        width: backgroundRect.width
        property int buttonHeight: 50
        Rectangle {
            implicitWidth: parent.width
            implicitHeight: 70
            color: MMPTheme.themeSelect("#300b52", MMPTheme.cSpaceBlack)
            Rectangle {
                color: MMPTheme.themeSelect("#4b1a75", MMPTheme.cBlack)
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: 1
            }

            Svg {
                id: gridcoinLogo
                source: "resources/icons/logos/ic_logo_app_gradient_white.svg"
                anchors.centerIn: parent
                width: parent.width - 20
                height: parent.height - 20
                fillMode: Image.PreserveAspectFit
            }
        }

        MenuButton{
            width: parent.width
            height: column.buttonHeight
            current: true
            labelText: qsTr("Overview")
            onClicked: backgroundRect.menuButtonClicked("OverviewResearcherView.qml")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_overview_white.svg","resources/icons/menu/ic_menu_overview_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Send")
            onClicked: backgroundRect.menuButtonClicked("SendView.qml")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_send_white.svg","resources/icons/menu/ic_menu_send_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Receive")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_receive_white.svg","resources/icons/menu/ic_menu_receive_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("History")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_history_white.svg","resources/icons/menu/ic_menu_history_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Favourites")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_favorites_white.svg","resources/icons/menu/ic_menu_favorites_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Polls")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_polls_white.svg","resources/icons/menu/ic_menu_polls_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("News")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_news_white.svg","resources/icons/menu/ic_menu_news_blue.svg")
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight
            labelText: qsTr("Settings")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_settings_white.svg","resources/icons/menu/ic_menu_settings_blue.svg")
        }
        Control {
            topPadding: 10
            horizontalPadding: 10
            width: parent.width
            height: 20
            Rectangle {
                anchors.centerIn: parent
                height: 1
                color: MMPTheme.separatorColor //Change
                width: parent.width - 50

            }
        }
        MenuButton{
            width: parent.width
            height: column.buttonHeight + 18
            labelText: qsTr("Lock \nWallet")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_lock_white.svg","resources/icons/menu/ic_menu_lock_blue.svg")
        }
    }

    Image {
        id: boinc
        source: "resources/icons/logos/ic_logo_boinc_color.svg"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 10
        }

    }
}
