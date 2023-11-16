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
    title: qsTr("Hello World")


    ColumnLayout{
        id:mainLayout
        spacing:100


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
            id:bodyContainer
            Layout.alignment: Qt.AlignCenter


            // Timer container
            Rectangle{
                id:timerContainer
                anchors.topMargin: 100
                Layout.alignment: Qt.AlignCenter
                height: 30

                // Timer
                Text{
                    id:timer;
                    text:"15.5";
                }
            }
        }

        Rectangle{
            Layout.alignment: Qt.AlignCenter

            // Timer button container
            Rectangle{
                id:pauseMainContaine

                color:"red"
                Layout.alignment: Qt.AlignCenter


                // Time button Layout
                RowLayout{

                    spacing: mainWindow.width/6

                    // Add 5 minutes
                    Rectangle{
                        id:pauseContainer
                        Layout.alignment: Qt.AlignCenter

                        PauseButton {
                            id:pauseButton
                            displayedText:"pause";
                        }
                    }

                }
            }
        }









        Rectangle{
            id:buttonContainer
            Layout.alignment: Qt.AlignCenter



            color:"red"
            // Time button Layout
            RowLayout{

                spacing: mainWindow.width/6

                // Add 5 minutes
                Rectangle{
                    id:fiveMinContainer

                    RoundButton{
                        id:fiveMinuteButton
                        displayedText:"5";
                    }
                }
                // Add 10 minutes
                Rectangle{
                    id:tenMinContainer
                    RoundButton{
                        id:tenMinuteButton
                        displayedText: "10"
                    }
                }
                // Add 20 minutes
                Rectangle{
                    id:twentyMinContainer
                    RoundButton{
                        id:twentyMinuteButton
                        displayedText:"20";
                    }
                }
                // Add 30 minutes
                Rectangle{
                    id:thirtyMinContainer
                    RoundButton{
                        id:thirtyMinuteButton
                        displayedText:"30";
                    }
                }
            }

        }



    }

}








