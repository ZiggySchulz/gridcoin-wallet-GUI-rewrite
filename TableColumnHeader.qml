import QtQuick 2.15
import MMPTheme 1.0
MouseArea {
    id: headerArea
    property bool accending: false
    property bool active: false
    property int index
    property alias text: headerLabel.text
    implicitHeight: 25
    implicitWidth: headerLabel.implicitWidth+headerArrow.implicitWidth+headerArea.anchors.leftMargin+headerLabel.anchors.leftMargin

    Text {
        id: headerLabel
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        color: MMPTheme.textColor
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    Image {
        id: headerArrow
        visible: active
        height: 10
        width: 10
        source: headerArea.accending ?
                    MMPTheme.themeSelect("resources/icons/generic/ic_arrow_up_light.svg","resources/icons/generic/ic_arrow_up_dark.svg") :
                    MMPTheme.themeSelect("resources/icons/generic/ic_arrow_down_light.svg","resources/icons/generic/ic_arrow_down_dark.svg")
        sourceSize: Qt.size(width, height)
        anchors {
            verticalCenter: parent.verticalCenter
            left: headerLabel.right
            leftMargin: 5
        }
    }
}
