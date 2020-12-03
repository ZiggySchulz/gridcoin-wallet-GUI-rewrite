import QtQuick 2.0
import QtQml 2.15

Item {
    id: main
    property real amount: 2.0
    property date transactionDate: new Date()
    property string account
    height: 42  //Chosen to have a fit of 7 transactions on the page
    width: parent.width
    states: [
        State {
            name: "incomingTransaction"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_green.svg"
            }
        },
        State {
            name: "sentTransaction"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_red.svg"
            }
        },
        State {
            name: "proofOfResearch"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_purple.svg"
            }
        },
        State {
            name: "proofOfResearchSideStakeReceive"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_purple.svg"
            }
        },
        State {
            name: "proofOfResearchSideStakeSend"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_red.svg"
            }
        },
        State {
            name: "proofOfStake"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_yellow.svg"
            }
        },
        State {
            name: "proofOfStakeSideStakeReceive"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_yellow_purple.svg"
            }
        },
        State {
            name: "orphaned"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Generic/ic_negative.svg"
            }
        },
        State {
            name: "superblock"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/superblock.svg"
            }
        },
        State {
            name: "beaconAdvertisement"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/beacon_grey.svg"
                //source: "Icons/Status Bar/Beacon/ic_beacon_online_light.svg" //Generic beacon icon, doesn't seem designed for large scale
            }
            PropertyChanges {
                target: amountLabel
                color: "#9ca2af"
            }
        },
        State {
            name: "vote"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/voting.svg"
            }
        },
        State {
            name: "message"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/message.svg"
            }
        },
        State {
            name: "inOut"
            PropertyChanges {
                target: transactionIcon
                source: "Icons/Events/ic_event_green_red.svg"
            }
        }
    ]

    Svg {
        id: transactionIcon
        maxSize: 30
        height: 30
        width: 30
        source: "Icons/Events/ic_event_purple.svg"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
    }
    Column {
        id: transactionInfoColumn
        anchors {
            verticalCenter: parent.verticalCenter
            left: transactionIcon.right
            right: parent.right
            leftMargin: 10
        }
        Item {
            id: transactionInfoTopRow
            width: parent.width
            height: amountLabel.implicitHeight
            anchors {
                left: parent.left
                right: parent.right
            }

            Text {
                id: amountLabel
                text: amount.toLocaleString(Qt.locale(), 'f', 8)
                clip: true
                color: amount >= 0 ? "#2AC940" : "#ED5144"
                anchors {
                    left: parent.left
                    right: dateLabel.left
                }
            }
            Text {
                id: dateLabel
                horizontalAlignment: Text.AlignRight
                text: transactionDate.toLocaleDateString(Qt.locale(), Locale.ShortFormat) +" "+ transactionDate.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)
                font.weight: Font.Light
                font.pointSize: 10
                color: "#5c5f65"
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                }
            }
        }
        Text {
            id: addressLabel
            text: account
            font.pointSize: 11
            color: "#5c5f65"
        }
    }

}
