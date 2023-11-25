# This Python file uses the following encoding: utf-8

import sys
from pathlib import Path
import datetime
import time

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

# To be used on the @QmlElement decorator
# (QML_IMPORT_MINOR_VERSION is optional)
QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

class Pomodoro():
    """ This class is the logic of the pomodoro timer.
    """
    def __init__(self):
        self.minutes = 1
        self.seconds = self.minutes * 60


    def set_starting_time(self, minutes):
        """ Sets the starting time of the Pomodoro timer.
        """
        self.minutes = minutes
        self.seconds = minutes * 60

    def get_current_time_seconds(self):
        """ Return the current time left on timer in seconds.
        """
        return self.seconds

    def countdown(self, run):
        """ Decreases the number of seconds by 1.
        """
        if run:
            self.seconds  = self.seconds -1
            time.sleep(1)
            print(self.seconds)


    def add_10_minutes(self):
        """ Increases number of minutes by 10
        """
        self.minutes += 10

    def add_15_minutes(self):
        """ Increases number of minutes by 15
        """
        self.minutes += 15

    def add_20_minutes(self):
        """ Increases number of minutes by 20
        """
        self.minutes += 20


@QmlElement
class Bridge(QObject):
    """ Bridge class is used to connect the python logic to the
    front QML front-end
    """
    def __init__(self):
        QObject.__init__(self)
        self.timer = Pomodoro()
        self.running = False

        self.lastStartingTime = [0]

    def set_starting_time(self, timer):
        """ Sets the starting time of the countdown clock.
            The 'timer' parameter is to receive the time being set in minutes.
        """
        self.timer.set_starting_time(timer)

    @Slot(int, result=str)
    def get_current_time(self, current):
        """ Returns time left on the timer in seconds.
        """
        minutes = int(self.timer.get_current_time_seconds() / 60)
        seconds = self.timer.get_current_time_seconds() % 60
        if seconds == 0:
            seconds = "00"

        string_time = f"{minutes} : {seconds}"
        return string_time

    @Slot(int, result=int)
    def get_current_time_seconds(self, seconds):
        """ Returns time left in seconds
        * "seconds" parameter being passed is just present to prevent an error.
        """
        seconds = self.timer.get_current_time_seconds()
        return seconds


    @Slot(int, result=int)
    def get_last_starting_time(self, seconds):
        """ Returns time left in seconds
        * "seconds" parameter being passed is just present to prevent an error.
        """

        if self.lastStartingTime:
            return self.lastStartingTime[0] * 60

        return 0

    @Slot(int, result=int)
    def add_time(self, timer):
        """ Based on the value provided by the "time" variable
        a diiferent case will be executed adding the specified time to the
        countdown timer.
        """

        print(timer)
        match timer:
            case 10:
                self.timer.add_10_minutes()
                print(self.timer.minutes)
            case 15:
                self.timer.add_15_minutes()
                print(self.timer.minutes)

    @Slot(bool, result=bool)
    def clock_coundown(self, count):
        """ Subtract 1 second from the current time of in the Pomodoro class.
        """
        print("count: "+str(count))
        self.timer.countdown(self.running)
        self.check_if_done()


    @Slot(bool, result=bool)
    def pause_or_start(self,count):
        """ it sends signal for the pause button.
        """
        fresh_start = int(self.timer.get_current_time_seconds()/60)
        self.running = not self.running

        if fresh_start > self.lastStartingTime[0]:
            self.lastStartingTime[0] = fresh_start
            print(self.lastStartingTime[0])

        print(str(count) +": " + str(self.running))

    def check_if_done(self):
        """ Functions checks if the timer os over.
        If the minutes and seconds are below 1 the timer is re-started to its last
        startig time.
        The running value is also set to False to keep the timer from continuing to run
        """
        minutes = int(self.timer.get_current_time_seconds() / 60)
        seconds = self.timer.get_current_time_seconds() % 60

        if minutes < 1 and seconds < 1:
            self.running = False
            self.re_start(1) # Passing '1' because parameter is expected but doesnt do anything

    @Slot(int, result=bool)
    def re_start(self, restart):
        """ Re-set the timer to the last known starting time.
            The last known starting time is held in an array of length 1.
            * 'restart' parameter is only present to prevent an error.
        """

        if self.get_last_starting_time(1) < 60:
            print("less than 60")
            pass
        else:
            print("re-start pressed")
            self.running = False
            print(self.lastStartingTime[0])
            self.set_starting_time(self.lastStartingTime[0])
            print(self.timer.get_current_time_seconds())

    @Slot(int, result=str)
    def set_timer_quickstart(self, minutes):
        """ Set the timer to 'minutes var' minutes.
            * The 'minutes' parameter passed sets holds the desired time.
                for the quickstart timer.
                quickstart timer just refers to the buttons with predefined times for
                the user.
            * First the stimer stops and after that the time is changed.

        """
        self.running = False
        self.timer.set_starting_time(minutes)




if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()

    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
