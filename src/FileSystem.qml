import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import LingmoUI 1.0 as LingmoUI

ItemPage {
    id: fileSystem

    headerTitle: qsTr("File Systems")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: LingmoUI.Units.largeSpacing
        spacing: LingmoUI.Units.largeSpacing

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: LingmoUI.Theme.backgroundColor
            radius: LingmoUI.Theme.mediumRadius

            layer.enabled: true
            layer.effect: LingmoUI.WindowBlur {
                windowRadius: parent.radius
            }

            ListView {
                id: fsListView
                anchors.fill: parent
                anchors.margins: 1
                clip: true
                model: systemInfo.diskList

                header: Rectangle {
                    width: parent.width
                    height: 36
                    color: LingmoUI.Theme.darkMode ? Qt.rgba(0, 0, 0, 0.2) 
                                                  : Qt.rgba(0, 0, 0, 0.05)

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: LingmoUI.Units.largeSpacing
                        anchors.rightMargin: LingmoUI.Units.largeSpacing

                        Label {
                            text: qsTr("Device")
                            Layout.preferredWidth: 150
                        }
                        Label {
                            text: qsTr("Mount Point")
                            Layout.preferredWidth: 150
                        }
                        Label {
                            text: qsTr("Type")
                            Layout.preferredWidth: 100
                        }
                        Label {
                            text: qsTr("Total")
                            Layout.preferredWidth: 100
                        }
                        Label {
                            text: qsTr("Free")
                            Layout.preferredWidth: 100
                        }
                        Label {
                            text: qsTr("Used")
                            Layout.fillWidth: true
                        }
                    }
                }

                delegate: ItemDelegate {
                    width: parent.width
                    height: 36

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: LingmoUI.Units.largeSpacing
                        anchors.rightMargin: LingmoUI.Units.largeSpacing

                        Label {
                            text: modelData.device
                            Layout.preferredWidth: 150
                            elide: Text.ElideRight
                        }
                        Label {
                            text: modelData.mountPoint
                            Layout.preferredWidth: 150
                            elide: Text.ElideRight
                        }
                        Label {
                            text: modelData.type
                            Layout.preferredWidth: 100
                        }
                        Label {
                            text: modelData.total
                            Layout.preferredWidth: 100
                        }
                        Label {
                            text: modelData.free
                            Layout.preferredWidth: 100
                        }
                        ProgressBar {
                            Layout.fillWidth: true
                            value: parseInt(modelData.used) / 100
                        }
                    }
                }

                ScrollBar.vertical: ScrollBar {}
            }
        }
    }
} 