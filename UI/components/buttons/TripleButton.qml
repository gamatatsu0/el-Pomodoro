import QtQuick

import "../buttons"

Item {
    id: tripleButton
    property string leftText: "Left";
    property string centerText: "Center";
    property string rightText: "Right";

    property string buttonColor: "transparent";
    property string borderColor: "black";
    property int buttonWidth: 100
    property int buttonHeight: 40

    Rectangle{
        id:tripleButtonContainer
        width: buttonWidth * 3
        height: buttonHeight
        color: "transparent"

        Rectangle{
            id:leftButtonContainer
            height: buttonWidth/2
            width:buttonWidth
            color:buttonColor

            anchors.left: tripleButtonContainer.left
//            anchors.right: centerButtonContainer.left

            LeftButton{
                id:leftButton
                buttonHeight: 40
                buttonWidth: 100
                displayedText: qsTr(leftText)
                buttonColor: buttonColor
                borderColor: borderColor
            }
        }

        Rectangle{
            id:centerButtonContainer
            height: buttonWidth/2
            width:buttonWidth

            anchors.right: rightButtonContainer.left
            anchors.left: leftButtonContainer.right


            color:buttonColor
            SquareButton{
                id:centerButton
                buttonHeight: 40
                buttonWidth: 100
                displayedText:centerText;
                buttonColor:buttonColor
                borderColor: borderColor

                onPressed: bridge.clock_coundown()
            }
        }
        Rectangle{
            id:rightButtonContainer
            height: buttonWidth/2
            width:buttonWidth
            color:buttonColor
//            anchors.left: centerButtonContainer.right
            anchors.right: tripleButtonContainer.right

            RoundButton{
                id:rightButton
                buttonHeight: 40
                buttonWidth: 100
                displayedText:rightText;
                buttonColor: buttonColor
                borderColor: borderColor



            }
        }
    }

}
