import QtQuick 2.0
import QtQuick.Controls 1.4

StatusBar {
    Text {
        id: clientMessage
        text: qsTr("Client Message: Stake Weight 3982689")
        color: "#55585e"
        font.pointSize: 11
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

        Svg {
            id: lockIcon
            source: "Icons/Status Bar/Lock/ic_unlocked_staking_light.svg"
            maxSize: iconsRow.iconSize
        }
        Svg {
            id: connectionStrengthIcon
            source: "Icons/Status Bar/Connection/ic_connection_normal_light.svg"
            maxSize: iconsRow.iconSize
        }
        Svg {
            id: stakingIcon
            source: "Icons/Status Bar/Staking/ic_staking_yes_light.svg"
            maxSize: iconsRow.iconSize
        }
        Svg {
            id: networkIcon
            source: "Icons/Status Bar/Network/ic_syncing_uptodate.svg"
            maxSize: iconsRow.iconSize
        }
        Svg {
            id: beaconIcon
            source: "Icons/Status Bar/Beacon/ic_beacon_online_light.svg"
            maxSize: iconsRow.iconSize
        }
    }
}
