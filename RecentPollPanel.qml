import QtQuick 2.0

ListView {
    clip: true
    spacing: 5
    interactive: false

    model: PollModel{}
    delegate: Item {
        id: pollWrapper
        height: pollItemTitle.height
        property bool current: new Date(expires*1000) > new Date()
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
