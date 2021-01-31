import QtQuick 2.15
import QtGraphicalEffects 1.15
import MMPTheme 1.0

Rectangle {
    id: tableHeaderRect
    property int currentSortIndex: 0
    property alias model: columnHeadersRepeater.model
    implicitHeight: 25
    color: "transparent"
    Rectangle {
        id: tableHeaderInnerRect
        height: parent.height
        width: parent.width
        border.color: parent.border.color
        gradient: Gradient {
            GradientStop { position: 0; color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cMirage) }
            GradientStop { position: 1; color: MMPTheme.themeSelect(MMPTheme.cLilyWhite, MMPTheme.cMirage) }
        }
        layer {
            enabled: true
            effect: OpacityMask {
                maskSource: Item {
                    width: tableHeaderInnerRect.width
                    height: tableHeaderInnerRect.height
                    Rectangle {
                        id: radiusRect
                        y:1
                        width: parent.width
                        height: 2*radius
                        radius: tableHeaderRect.radius
                    }
                    Rectangle {
                        width: parent.width
                        anchors {
                            top: radiusRect.verticalCenter
                            bottom: parent.bottom
                        }
                    }
                }
            }
        }
        Row {
            anchors.fill: parent
            Repeater {
                id: columnHeadersRepeater
                MouseArea {
                    id: headerArea
                    property bool accending: false
                    property bool active: tableHeaderRect.currentSortIndex === model.index
                    height: parent.height
                    width: modelData.width
                    implicitWidth: headerLabel.implicitWidth+headerArrow.implicitWidth+headerArea.anchors.leftMargin+headerLabel.anchors.leftMargin
                    onClicked: {
                        if (active){
                            if (accending) { accending=false }
                            else { accending=true }
                        } else {
                            tableHeaderRect.currentSortIndex = index
                        }
                        //c++Model.sort(index, accending)
                    }
                    Text {
                        id: headerLabel
                        text: modelData.text
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
            }
        }
    }
}
