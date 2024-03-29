QT += quick
QT += svg
QT += widgets

CONFIG += c++11
CONFIG += sdk_no_version_check #Temporary for testing
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp

RESOURCES += \
    qml.qrc

TRANSLATIONS += \
    translations/GridcoinWalletGUI_en_AU.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/plugins/

QMAKE_APPLE_DEVICE_ARCHS = arm64

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH = $$PWD/

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#DISTFILES += \

