pragma Singleton

import QtQuick 2.12

QtObject {
    readonly property color cBlack: "#000000"
    readonly property color cMirage: "#171E26"
    readonly property color cSpaceBlack: "#1A2632"
    readonly property color cMobster: "#B3171B24"
    readonly property color cOxfordBlue: "#3A465D"
    readonly property color cOxfordOffBlue: "#17222C"
    readonly property color cLightSlateGray: "#7383A1"
    readonly property color cLilyWhite: "#EAEDED"
    readonly property color cFrostWhite: "#F4F7F9"
    readonly property color cWhite: "#FFFFFF"
    readonly property color cViolentViolet: "#360166"
    readonly property color cBluePurple: "#9013FE"
    readonly property color cHavelockBlue: "#4A90E2"
    readonly property color cDullLime: "#2AC940"
    readonly property color cCarminePink: "#ED5144"

    readonly property color background: isLightTheme ? cLilyWhite : cSpaceBlack
    //Theme enumeration
    readonly property int lightTheme: 0
    readonly property int darkTheme: 1
    readonly property bool isLightTheme: theme === lightTheme
    property int theme: darkTheme

    readonly property color textColor: isLightTheme ? cOxfordBlue : cWhite
    property font font
    font.family: "SF Pro Text"
    font.pixelSize: 12


    function themeSelect (lightObj, darkObj ){
        return isLightTheme ? lightObj : darkObj
    }

    //Sets the alpha of a color, where translucency is a decimal [0,1]
    //Probably a better way to do this but it works
    function translucent (color, translucency) {
        var a = Math.round(translucency*255)
        var aString = ""
        if (a < 16) {
            aString = "0"
        }
        aString += a.toString(16)
        return "#"+aString+color.toString().slice(-6)
    }
}
