import QtQuick 2.0

Item {
    id: titleRow
    property alias text: title.text
    implicitHeight: title.implicitHeight+separator.implicitHeight+separator.anchors.topMargin

    Text {
        id: title
        color: "#3A465D"    //Oxford Blue
        text: ""
        font.weight: Font.DemiBold
        font.pointSize: 13
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left

        }
    }
    Rectangle {
        id: separator
        height: 1
        width: parent.width
        color: "#EAEDED"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: titleRow.bottom
            topMargin: 5
        }
    }
}
