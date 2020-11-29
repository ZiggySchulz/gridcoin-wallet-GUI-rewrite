import QtQuick 2.0

MouseArea {
    id: questionMarkMouseOver
    property alias size: questionMarkImg.maxSize
    property alias text: popup.infoText
    width: questionMarkImg.implicitWidth
    height: questionMarkImg.implicitHeight
    hoverEnabled: true

    Svg {
        id: questionMarkImg
        source: "Icons/Generic/ic_help.svg"
        maxSize: 15
    }

    InfoPopup {
        id: popup
        visible: questionMarkMouseOver.containsMouse
        y: questionMarkImg.height+ 5
        x: -width/2
    }

}
