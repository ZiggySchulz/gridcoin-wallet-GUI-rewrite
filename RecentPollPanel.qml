import QtQuick 2.0

Rectangle {
    id: latestPollsPanel
    property int sideBodyMargin: 20
    color: "white"
    radius: 4

    PanelTitle {
        id: latestPollTitle
        text: "Latest Polls"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: topBodyMargin
            leftMargin: sideBodyMargin
            rightMargin: sideBodyMargin
        }
    }

    ListView {
        id: recentPollList
        anchors {
            top: latestPollTitle.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: topBodyMargin
            leftMargin: sideBodyMargin
            rightMargin: sideBodyMargin
            bottomMargin: bottomBodyMargin
        }
        clip: true
        spacing: 5
        interactive: false

        model: PollModel{}
        delegate: Item {
            id: pollWrapper
            property bool current: new Date(expires*1000) > new Date()
            height: pollItemTitle.height
            Circle {
                id: pollItemCircle
                radius: 2
                color: current ? "#3A465D" : "transparent"
                border.color: current ? "#3A465D" : "#5c5f65"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: pollItemTitle
                text: title
                color: current ? "#3A465D" : "#8b8d91"
                font.weight: current ? Font.Medium : Font.Normal
                font.pointSize: 12
                anchors.left: pollItemCircle.right
                anchors.verticalCenter: pollItemCircle.verticalCenter
                anchors.leftMargin: 4
            }
        }
    }
}
