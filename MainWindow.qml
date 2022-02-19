import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import Qt.labs.platform 1.1 as PLAT
import MMPTheme 1.0
ApplicationWindow {
    id: window
    height: minimumHeight
    minimumHeight: 640
    minimumWidth: 720
    visible: true
    title: qsTr("Gridcoin Wallet")
    opacity: 1

    Behavior on opacity {
        NumberAnimation { duration: 1000 }
    }

    PLAT.SystemTrayIcon {
        visible: true
        icon.source: "qrc:/resources/icons/logos/ic_logo_app_gradient_white.svg"
    }
    PLAT.MenuBar {
        PLAT.Menu {
            title: qsTr("File")
            PLAT.MenuItem { text: qsTr("Backup Wallet/Config")}
            PLAT.MenuItem {
                text: qsTr("Export")
                enabled: false
            }
            PLAT.MenuItem { text: qsTr("Snapshot Download")}
            PLAT.MenuItem {text: qsTr("Export")}
            PLAT.MenuItem {
                id: aboutMenuItem
                role: PLAT.MenuItem.AboutRole
                text: qsTr("About")
                enabled: true
                onTriggered: {
                    enabled = false
                    var component = Qt.createComponent("AboutWindow.qml")
                    var windowObj = component.createObject(window)
                    windowObj.onClosing.connect(function(){enabled=true})
                    windowObj.show()
                }
            }
        }
        PLAT.Menu {
            id: editMenu
            title: qsTr("&Edit")
        }
        PLAT.Menu {
            id: viewMenu
            title: qsTr("&View")
        }
        PLAT.Menu {
            id: helpMenu
            title: qsTr("&Help")
        }

    }

    TabMenu{
        id: menu
        width: 90
        onMenuButtonClicked: loader.source=identification
        anchors{
            top: parent.top
            bottom: statusBar.top
            left: parent.left
        }
    }

    Loader {
        id: loader
        source: "OverviewResearcherView.qml"
        anchors {
            top: parent.top
            bottom: statusBar.top
            right: parent.right
            left: menu.right
        }
    }
    StatusFooter {
        id: statusBar
        height: 24
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
