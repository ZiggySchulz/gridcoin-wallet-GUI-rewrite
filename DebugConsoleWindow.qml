import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MMPTheme 1.0

Window {
    id: window
    title: qsTr("Debug Console")
    width: 700
    height: 600
    minimumWidth: 480
    minimumHeight: 450
    flags: Qt.Dialog
    Shortcut {
        sequence: StandardKey.Close
        onActivated: window.close()
    }
    Rectangle {
        id: debugTabMenuRect
        color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cSpaceBlack)
        height: 70
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        Rectangle {
            id: headerBottomBorderRect
            color: MMPTheme.themeSelect("transparent", MMPTheme.cBlack)
            height: 1
            width: parent.width
            anchors.bottom: parent.bottom
        }
        RowLayout {
            id: tabMenuRowLayout
            anchors.centerIn: parent
            spacing: 30
            property Item currentItem: informationTabButton
            Shortcut {
                sequence: StandardKey.MoveToNextPage
                onActivated: {
                    switch(tabMenuRowLayout.currentItem) {
                    case generalSettingsTabButton:
                        tabMenuRowLayout.currentItem = networkSettingsTabButton
                        break
                    case networkSettingsTabButton:
                        tabMenuRowLayout.currentItem = windowSettingsTabButton
                        break
                    case windowSettingsTabButton:
                        tabMenuRowLayout.currentItem = displaySettingsTabButton
                        break
                    case displaySettingsTabButton:
                        tabMenuRowLayout.currentItem = nodesSettingsTabButton
                        break
                    case nodesSettingsTabButton:
                        break
                    }
                }
            }
            Shortcut {
                sequence: StandardKey.MoveToPreviousPage
                onActivated: {
                    switch(tabMenuRowLayout.currentItem) {
                    case generalSettingsTabButton:
                        break
                    case networkSettingsTabButton:
                        tabMenuRowLayout.currentItem = generalSettingsTabButton
                        break
                    case windowSettingsTabButton:
                        tabMenuRowLayout.currentItem = networkSettingsTabButton
                        break
                    case displaySettingsTabButton:
                        tabMenuRowLayout.currentItem = windowSettingsTabButton
                        break
                    case nodesSettingsTabButton:
                        tabMenuRowLayout.currentItem = displaySettingsTabButton
                        break
                    }
                }
            }

            MouseArea {
                id: informationTabButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 80
                opacity: tabMenuRowLayout.currentItem==informationTabButton ? 1 : 0.4
                onClicked: tabMenuRowLayout.currentItem = informationTabButton
                Image {
                    id: informationIcon
                    sourceSize: Qt.size(30,30)
                    source: MMPTheme.themeSelect("/resources/icons/tabs/ic_tab_info_light.svg", "/resources/icons/tabs/ic_tab_info_dark.svg")
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: informationLabel
                    text: qsTr("Information")
                    color: MMPTheme.textColor
                    font.weight:  tabMenuRowLayout.currentItem==informationTabButton ? Font.DemiBold : Font.Medium
                    anchors {
                        top: informationIcon.bottom
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            MouseArea {
                id: networkTrafficTabButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 80
                opacity: tabMenuRowLayout.currentItem==networkTrafficTabButton ? 1 : 0.4
                onClicked: tabMenuRowLayout.currentItem = networkTrafficTabButton
                Image {
                    id: networkTrafficIcon
                    sourceSize: Qt.size(30,30)
                    source: MMPTheme.themeSelect("qrc:/resources/icons/tabs/ic_tab_net_traffic_light.svg", "qrc:/resources/icons/tabs/ic_tab_net_traffic_dark.svg")
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: networkTrafficLabel
                    text: qsTr("Network Traffic")
                    color: MMPTheme.textColor
                    font.weight:  tabMenuRowLayout.currentItem==networkTrafficTabButton ? Font.DemiBold : Font.Medium
                    anchors {
                        top: networkTrafficIcon.bottom
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            MouseArea {
                id: consoleTabButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 80
                opacity: tabMenuRowLayout.currentItem==windowSettingsTabButton ? 1 : 0.4
                onClicked: tabMenuRowLayout.currentItem = windowSettingsTabButton
                Image {
                    id: consoleIcon
                    sourceSize: Qt.size(30,30)
                    source: MMPTheme.themeSelect("/resources/icons/tabs/ic_tab_console_light.svg", "/resources/icons/tabs/ic_tab_console_dark.svg")
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: consoleLabel
                    text: qsTr("Console")
                    color: MMPTheme.textColor
                    font.weight:  tabMenuRowLayout.currentItem==windowSettingsTabButton ? Font.DemiBold : Font.Medium
                    anchors {
                        top: consoleIcon.bottom
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            MouseArea {
                id: scraperTabButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 50
                opacity: tabMenuRowLayout.currentItem==scraperTabButton ? 1 : 0.4
                onClicked: tabMenuRowLayout.currentItem = scraperTabButton
                Image {
                    id: scraperIcon
                    sourceSize: Qt.size(30,30)
                    source: MMPTheme.themeSelect("qrc:/resources/icons/tabs/ic_tab_cmd_line_light.svg", "qrc:/resources/icons/tabs/ic_tab_cmd_line_dark.svg")
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: scraperLabel
                    text: qsTr("Scraper")
                    color: MMPTheme.textColor
                    font.weight: tabMenuRowLayout.currentItem==scraperTabButton ? Font.DemiBold : Font.Medium
                    anchors {
                        top: scraperIcon.bottom
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }

            }
            MouseArea {
                id: peersTabButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 80
                opacity: tabMenuRowLayout.currentItem==peersTabButton ? 1 : 0.4
                onClicked: tabMenuRowLayout.currentItem = peersTabButton
                Image {
                    id: peersIcon
                    sourceSize: Qt.size(30,30)
                    source: MMPTheme.themeSelect("/resources/icons/tabs/ic_tab_nodes_light.svg", "/resources/icons/tabs/ic_tab_nodes_dark.svg")
                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: nodesSettingsLabel
                    text: qsTr("Peers")
                    color: MMPTheme.textColor
                    font.weight:  tabMenuRowLayout.currentItem==peersTabButton ? Font.DemiBold : Font.Medium
                    anchors {
                        top: peersIcon.bottom
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
    Rectangle {
        id: background
        color: MMPTheme.backgroundColor
        anchors {
            top: debugTabMenuRect.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        Loader {
            id: debugContentLoader
            anchors.fill: parent
            sourceComponent: informationView
        }
    }
    Component {
        id: informationView
        Item {
            Rectangle {
                id: corePanel
                color: MMPTheme.bodyColor
                radius: 4
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.horizontalCenter
                    bottom: debugLogButton.top
                    margins: 10
                    rightMargin: 5
                }
                PanelTitle {
                    id: corePanelTitle
                    text: qsTr("Gridcoin Core")
                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 10
                        leftMargin: 20
                    }
                }
                Rectangle {
                    id: corePanelTitleSeparator
                    height: 1
                    color: MMPTheme.separatorColor
                    anchors {
                        top: corePanelTitle.bottom
                        left: parent.left
                        right: parent.right
                        margins: 20
                        topMargin: 5
                    }
                }
                GridLayout {
                    id: corePanelGridLayout
                    columns: 2
                    columnSpacing: 10
                    rowSpacing: 20
                    clip: true
                    anchors {
                        top: corePanelTitleSeparator.bottom
                        left: parent.left
                        right: parent.right
                        margins: 20
                        topMargin: 10
                    }
                    Text {
                        text: qsTr("Client Name:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "Halford"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Client Version:")
                        color: MMPTheme.textColor
                    }
                    Text{
                        text: "v5.3.2.0-unk-3"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("OpenSSL version:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "OpenSSL 1.1.1k  25 Mar 2021"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Boost Version:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "1.76.0"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Qt Version:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "5.15.2"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Startup Time:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: new Date().toLocaleString(Qt.locale(), Locale.ShortFormat)
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Difficulty:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "18.27"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }
            }
            Rectangle {
                id: networkPanel
                color: MMPTheme.bodyColor
                radius: 4
                anchors {
                    top: parent.top
                    left: parent.horizontalCenter
                    right: parent.right
                    bottom: debugLogButton.top
                    margins: 10
                    leftMargin: 5
                }
                PanelTitle {
                    id: networkPanelTitle
                    text: qsTr("Network")
                    anchors {
                        left: parent.left
                        top: parent.top
                        topMargin: 10
                        leftMargin: 20
                    }
                }
                Rectangle {
                    id: networkPanelTitleSeparator
                    height: 1
                    color: MMPTheme.separatorColor
                    anchors {
                        top: networkPanelTitle.bottom
                        left: parent.left
                        right: parent.right
                        margins: 20
                        topMargin: 5
                    }
                }
                GridLayout {
                    id: networkPanelGridLayout
                    columns: 2
                    columnSpacing: 10
                    rowSpacing: 20
                    clip: true
                    anchors {
                        top: networkPanelTitleSeparator.bottom
                        left: parent.left
                        right: parent.right
                        margins: 20
                        topMargin: 10
                    }
                    Text {
                        text: qsTr("Number of Connections:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "12"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("On Testnet:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: qsTr("No")
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Current Number of Blocks:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "12439728"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Total Estimated Blocks:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: "12000000"
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                    Text {
                        text: qsTr("Last Block Time:")
                        color: MMPTheme.textColor
                    }
                    Text {
                        text: new Date().toLocaleString(Qt.locale(), Locale.ShortFormat)
                        color: MMPTheme.lightTextColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }
            }
            Button {
                id: debugLogButton
                text: qsTr("Event Log")
                icon.source: MMPTheme.themeSelect("qrc:/resources/icons/buttons/ic_btn_log_light.svg", "qrc:/resources/icons/buttons/ic_btn_log_dark.svg")
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: 10
                }
            }
        }
    }
}
