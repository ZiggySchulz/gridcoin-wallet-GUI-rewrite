import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MMPTheme 1.0

Rectangle {
    id: backgroundRect
    property int buttonHeight: 50
    signal menuButtonClicked(string identification)
    color:  MMPTheme.themeSelect("#360166", MMPTheme.cSpaceBlack)

    ListModel {
        id: menuModel
        ListElement {
            label: qsTr("Overview")
            lightImageSource: "resources/icons/menu/ic_menu_overview_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_overview_blue.svg"
            path: "OverviewResearcherView.qml"
        }
        ListElement {
            label: qsTr("Send")
            lightImageSource: "resources/icons/menu/ic_menu_send_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_send_blue.svg"
            path: "SendView.qml"
        }
        ListElement {
            label: qsTr("Receive")
            lightImageSource: "resources/icons/menu/ic_menu_receive_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_receive_blue.svg"
            path: ""
        }
        ListElement {
            label: qsTr("History")
            lightImageSource: "resources/icons/menu/ic_menu_history_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_history_blue.svg"
        }
        ListElement {
            label: qsTr("Favourites")
            lightImageSource: "resources/icons/menu/ic_menu_favorites_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_favorites_blue.svg"
        }
        ListElement {
            label: qsTr("Polls")
            lightImageSource: "resources/icons/menu/ic_menu_polls_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_polls_blue.svg"
        }
        ListElement {
            label: qsTr("News")
            lightImageSource: "resources/icons/menu/ic_menu_news_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_news_blue.svg"
        }
        ListElement {
            label: qsTr("Settings")
            lightImageSource: "resources/icons/menu/ic_menu_settings_white.svg"
            darkImageSource: "resources/icons/menu/ic_menu_settings_blue.svg"
            path: "TestView.qml"
        }
    }

    Rectangle {
        //id: rightBorderRect
        z:2
        width: 1
        color: MMPTheme.themeSelect("transparent", MMPTheme.cBlack)
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: logoRect
        implicitWidth: parent.width
        implicitHeight: 70
        color: "transparent"
        Rectangle {
            //id: bottomBorder
            color: MMPTheme.themeSelect("#4b1a75", MMPTheme.cBlack)
            height: 1
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
        Svg {
            //id: gridcoinLogo
            source: "resources/icons/logos/ic_logo_app_gradient_white.svg"
            anchors.centerIn: parent
            width: parent.width - 20
            height: parent.height - 20
            fillMode: Image.PreserveAspectFit
        }
    }
    Column {
        //id: buttonColumn
        width: parent.width
        anchors {
            top: logoRect.bottom
            bottom: boinc.top
            bottomMargin: 10
        }

        ListView {
            id: menuList
            height: Math.min(buttonHeight*count, parent.height-separator.height-lockButton.height)
            implicitHeight: contentItem.height
            implicitWidth: parent.width
            clip: true
            interactive: buttonHeight*count > height
            model: menuModel
            currentIndex: 0
            delegate: MenuButton {
                width: parent.width
                height: buttonHeight
                labelText: label
                imagePath: MMPTheme.themeSelect(lightImageSource, darkImageSource)
                current: ListView.isCurrentItem
                onClicked: {
                    menuList.currentIndex = index
                    backgroundRect.menuButtonClicked(path)
                }
            }
        }
        Item {
            id: separator
            height: 20
            width: parent.width
            Rectangle {
                height: 1
                anchors.centerIn: parent
                width: parent.width - 50
                color: MMPTheme.translucent(MMPTheme.cWhite, 0.7)

            }
        }
        MenuButton{
            id: lockButton
            height: buttonHeight+15
            width: parent.width-30
            labelText: qsTr("Lock Wallet")
            imagePath: MMPTheme.themeSelect("resources/icons/menu/ic_menu_lock_white.svg","resources/icons/menu/ic_menu_lock_blue.svg")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (MMPTheme.isLightTheme){
                    MMPTheme.theme = MMPTheme.darkTheme
                } else {
                    MMPTheme.theme = MMPTheme.lightTheme
                }
            }
        }
    }
    Svg {
        id: boinc
        source: "resources/icons/logos/ic_logo_boinc_color.svg"
        fillMode: Image.PreserveAspectFit
        maxSize: 20
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 10
        }

    }
}
