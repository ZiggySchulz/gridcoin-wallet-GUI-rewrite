import QtQuick 2.0

Image {
    property int maxSize: 100
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
