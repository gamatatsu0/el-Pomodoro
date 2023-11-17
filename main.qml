import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15

import 'UI/components'


Window {
    id:mainWindow
    width: 640
    height: 480
    visible: true

    property int timeButtonSize: 100;
    property int pauseButtonSize: 80;
    property int otherButtonSize: 60;


    title: qsTr("Hello World")


    ColumnLayout{
        id:mainLayout
        spacing:25

        // Title container
        Rectangle{
            id:titleContainer
            Layout.preferredWidth: 640
            Layout.preferredHeight: 40
            anchors.bottomMargin: 50

            color:"#00ffae"

            // Program Title
            Text {
                id: title
                anchors.fill: parent
                font.pixelSize: 24
                fontSizeMode: Text.Fit
                minimumPixelSize: 10
                wrapMode: Text.WordWrap

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Pomodoro Timer")
            }

        }

        // Top Body container
        Rectangle{
            id:topBodyContainer
            width:200
            height:200
            Layout.alignment: Qt.AlignCenter

            // Timer container
            Rectangle{
                id:timerContainer
                anchors.topMargin: 10
                Layout.alignment: Qt.AlignCenter
                height: 30
                width: 30
                color:"#00ffae"

                // Timer
                Text{
                    id:timer;
                    anchors.fill: parent
                    font.pixelSize: 24
                    fontSizeMode: Text.Fit
                    minimumPixelSize: 10
                    wrapMode: Text.WordWrap

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("15:30")
                }
                RoundProgressBar{
                    size:250;

                }
            }
        }

        Rectangle{
            id:pauseMainContaine

            Layout.preferredWidth: restartContainer.width + pauseContainer.width + endContainer.width + 10;
            height: pauseContainer.height;
            Layout.alignment: Qt.AlignCenter
            color:"red"
            RowLayout{
                // Restart Button
                Rectangle{
                    id:restartContainer
                    height: otherButtonSize;
                    width: otherButtonSize;
                    PauseButton {
                        id:restartButton
                        displayedText:"restart";
                        size:otherButtonSize;
                    }
                }

                // Pause button
                Rectangle{
                    id:pauseContainer
                    color:"blue"
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

            width: fiveMinContainer.width * 4;
            height: fiveMinContainer.height;

            Layout.alignment: Qt.AlignCenter;
            color: "red"
            // Time button Layout
            RowLayout{
                // Add 5 minutes
                Rectangle{
                    id:fiveMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    RoundButton{
                        id:fiveMinuteButton
                        size:timeButtonSize;
                        displayedText:"5";
                    }
                }
                // Add 10 minutes
                Rectangle{
                    id:tenMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    RoundButton{
                        id:tenMinuteButton
                        size:timeButtonSize;
                        displayedText: "10"
                    }
                }
                // Add 20 minutes
                Rectangle{
                    id:twentyMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    RoundButton{
                        id:twentyMinuteButton
                        size:timeButtonSize;
                        displayedText:"20";
                    }
                }
                // Add 30 minutes
                Rectangle{
                    id:thirtyMinContainer
                    height: timeButtonSize
                    width:timeButtonSize
                    RoundButton{
                        id:thirtyMinuteButton
                        size:timeButtonSize;
                        displayedText:"30";
                    }
                }
            }

        }
    }

}








