import QtQuick 2.15
import QtGraphicalEffects 1.15
import MMPTheme 1.0

Rectangle {
    id: tableHeaderRect
    property int currentSortIndex: 0
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
    }
}
