import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    width: 750
    height: minimumHeight
    minimumHeight: 640

    visible: true
    title: qsTr("Gridcoin Wallet")

    property int statusBarSize: 24

    TabMenu{
        id: menu
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
        height: statusBarSize
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
