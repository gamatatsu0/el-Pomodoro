import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15

import 'UI/components'


Window {
    id:mainWindow
    width: 640
    height: 500
    visible: true

    property int timeButtonSize: 60;
    property int pauseButtonSize: 80;
    property int otherButtonSize: 60;
    property int progressBarSize: 250;

    property string color1: "#00ffae";
    property string color2: "white"
    property string color3: "transparent";

Rectangle{
    height: mainWindow.height
    width: mainWindow.width
    color: color1

    anchors.left: mainWindow.left
    anchors.right: mainWindow.right
    ColumnLayout{
        id:mainLayout
        spacing:20

        // Title container
        Rectangle{
            id:titleContainer
            Layout.preferredWidth: 640
            Layout.preferredHeight: 40
            anchors.bottomMargin: 50
            Layout.alignment: Qt.AlignCenter
            color:color3;



            // Program Title
            Text {
                id: title
                anchors.fill: parent
                font.pixelSize: 24
                fontSizeMode: Text.Fit
                minimumPixelSize: 6
                wrapMode: Text.WordWrap
                color: color2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Pomodoro Timer")
            }

        }

        // Top Body container
        Rectangle{
            id:topBodyContainer
            width:progressBarSize
            height:progressBarSize
            Layout.alignment: Qt.AlignCenter
            color:color3


            // Timer container
            Rectangle{
                id:timerContainer
                anchors.topMargin: 10
                anchors.right: topBodyContainer.right
                anchors.left: topBodyContainer.left
                width:progressBarSize
                height:progressBarSize
                color:color3

                // Timer
                RoundProgressBar{
                    size:250;
                    timeText: qsTr("15:30")
                }
            }
        }

        Rectangle{
            id:pauseMainContaine

            Layout.preferredWidth: restartContainer.width + pauseContainer.width + endContainer.width + 10;
            height: pauseContainer.height;
            Layout.alignment: Qt.AlignCenter
            color:color3

            RowLayout{
                // Restart Button
                Rectangle{
                    id:restartContainer
                    height: otherButtonSize;
                    width: otherButtonSize;
                    color:color3

                    PauseButton {
                        id:restartButton
                        displayedText:"restart";
                        size:otherButtonSize;
                    }
                }

                // Pause button
                Rectangle{
                    id:pauseContainer
                    color:color3
                    height: pauseButtonSize;
                    width: pauseButtonSize;
                    PauseButton {
                        id:pauseButton
                        displayedText:"pause";
                        size:pauseButtonSize;
                    }
                }

                // Finish button
                Rectangle{
                    id:endContainer
                    height: otherButtonSize;
                    width: otherButtonSize;
                    color:color3


                    PauseButton {
                        id:endButton
                        displayedText:"end";
                        size:otherButtonSize;
                    }
                }
            }
        }

        Rectangle{
            id:buttonContainer

            width: fiveMinContainer.width * 2;
            height: fiveMinContainer.height;

            Layout.alignment: Qt.AlignCenter;
            color: color3
            // Time button Layout
            RowLayout{
                // Add 5 minutes
                Rectangle{
                    id:fiveMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    color:color3

                    RoundButton{
                        id:fiveMinuteButton
                        size:timeButtonSize;
                        displayedText:"+5";
                        buttonColor:color3
                        borderColor: color2
                    }
                }
                // Add 10 minutes
                Rectangle{
                    id:tenMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    color:color3

                    RoundButton{
                        id:tenMinuteButton
                        size:timeButtonSize;
                        displayedText: "+10"
                        buttonColor:color3
                        borderColor: color2
                    }
                }
//                // Add 20 minutes
//                Rectangle{
//                    id:twentyMinContainer
//                    height: timeButtonSize
//                    width:timeButtonSize
//                    color:color3

//                    RoundButton{
//                        id:twentyMinuteButton
//                        size:timeButtonSize;
//                        displayedText:"+20";
//                        buttonColor:color3
//                        borderColor: color2
//                    }
//                }
//                // Add 30 minutes
//                Rectangle{
//                    id:thirtyMinContainer
//                    height: timeButtonSize
//                    width:timeButtonSize
//                    color:color3

//                    RoundButton{
//                        id:thirtyMinuteButton
//                        size:timeButtonSize;
//                        displayedText:"+30";
//                        buttonColor:color3
//                        borderColor: color2

//                    }
//                }
            }

        }
    }

}
}








