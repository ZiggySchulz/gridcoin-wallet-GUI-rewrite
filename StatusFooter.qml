import QtQuick 2.0
import QtQuick.Controls 1.4

StatusBar {
    Text {
        id: clientMessage
        text: qsTr("Client Message: Stake Weight 3982689")
        color: "#55585e"
        font.pixelSize: 10
        clip: true
        anchors {
            left: parent.left
            right: iconsRow.left
            verticalCenter: parent.verticalCenter
            leftMargin: 5
        }
    }
    Row {
        id: iconsRow
        layoutDirection: Qt.RightToLeft
        spacing: 8
        property int iconSize: 10
        anchors {
            right: parent.right
            rightMargin: spacing
            verticalCenter: parent.verticalCenter
        }

        HelpHover {
            id: lockIcon
            imageSource: "resources/Icons/Status Bar/Lock/ic_unlocked_staking_light.svg"
            iconSize: iconsRow.iconSize
            text: "The wallet is unlocked for staking"
        }
        HelpHover {
            id: connectionStrengthIcon
            imageSource: "resources/Icons/Status Bar/Connection/ic_connection_normal_light.svg"
            iconSize: iconsRow.iconSize
            text: "Connection is strong"
        }
        HelpHover {
            id: stakingIcon
            imageSource: "resources/Icons/Status Bar/Staking/ic_staking_yes_light.svg"
            iconSize: iconsRow.iconSize
            text: "Currently staking"
        }
        HelpHover {
            id: networkIcon
            imageSource: "resources/Icons/Status Bar/Network/ic_syncing_uptodate.svg"
            iconSize: iconsRow.iconSize
            text: "Network is connected"
        }
        HelpHover {
            id: beaconIcon
            imageSource: "resources/Icons/Status Bar/Beacon/ic_beacon_online_light.svg"
            iconSize: iconsRow.iconSize
            text: "Beacon is lit"
        }
    }
}
