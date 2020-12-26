import QtQuick 2.15
import QtGraphicalEffects 1.15
Item {
    property int maxSize: 50
    property alias tintColor: overlay.color
    property alias source: img.source
    implicitHeight: img.implicitHeight
    implicitWidth: img.implicitWidth
    Image {
        id: img
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        sourceSize: Qt.size(
                        // Store svg at large resolution for downscaling
                        Math.max(hiddenImg.sourceSize.width, maxSize),
                        Math.max(hiddenImg.sourceSize.height, maxSize))
        Image {
            id: hiddenImg
            source: parent.source
            width: 0
            height: 0
        }
    }
    ColorOverlay {
        id: overlay
        anchors.fill: img
        source: img
        color: "transparent"
    }
}
