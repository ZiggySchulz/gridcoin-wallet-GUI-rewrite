import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.15
Item {
    //Acts as the parent item for windows
    id: root
    Component.onCompleted: showSplashScreen()

    function showSplashScreen() {
        var component = Qt.createComponent("SplashScreen.qml")
        var windowObj = component.createObject(root)
        windowObj.loaded.connect(showMainWindow)
        windowObj.show()
    }

   function showMainWindow() {
       var component = Qt.createComponent("MainWindow.qml")
       var windowObj = component.createObject(root, {opacity: 0})
       windowObj.show()
       windowObj.opacity = 1
   }
}
