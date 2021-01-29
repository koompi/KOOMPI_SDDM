/*
 *   Copyright 2016 David Edmundson <davidedmundson@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
import QtQuick 2.8
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.5
import org.kde.plasma.core 2.0


// RowLayout {
   
//     readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software


//     Label {
//          x:220
//         y: 45
//         text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
//         color: config.color
//         style: softwareRendering ? Text.Outline : Text.Normal
//         styleColor: softwareRendering ? ColorScope.backgroundColor : "transparent" //no outline, doesn't matter
//         font.pointSize: 11
//         Layout.alignment: Qt.AlignHCenter
//         font.family: config.font

//     }
//     Label {
//         text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
//         color: config.color
//         style: softwareRendering ? Text.Outline : Text.Normal
//         styleColor: softwareRendering ? ColorScope.backgroundColor : "transparent" //no outline, doesn't matter
//         font.pointSize: 11
//         Layout.alignment: Qt.AlignHCenter
//         font.family: config.font

//     }
//     DataSource {
//         id: timeSource
//         engine: "time"
//         connectedSources: ["Local"]
//         interval: 1000
//     }
// }

     
Column {

        id: container
        anchors.horizontalCenter: parent.horizontalCenter

        property date dateTime: new Date()
        property color color: "white"
        property alias timeFont: time.font
        property alias dateFont: date.font
        property int timeFontSize: 14
        property int dateFontSize: 11
        Timer {
            interval: 100; running: true; repeat: true;
            onTriggered: container.dateTime = new Date()
        }
        Text {
            id: time
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#0C090A"//container.color
            text : Qt.formatTime(container.dateTime, "hh:mm")
            font.pointSize: 65
        }
        Text {
            id: date
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#0C090A"//container.color
            text : Qt.formatDate(container.dateTime, Qt.DefaultLocaleLongDate)
            font.pointSize: 15
        }
    }



