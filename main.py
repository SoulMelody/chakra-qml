import os
import sys
from pathlib import Path
from PyQt6.QtCore import qInstallMessageHandler, QDir, QObject
from PyQt6.QtCore import pyqtSlot as Slot
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine, qmlRegisterType

from src.Chakra.CFrameless import CFrameless

os.environ["QT_QUICK_CONTROLS_STYLE"] = "Basic"


class ClipboardHelper(QObject):
    @Slot(str)
    def copyToClipboard(self, text):
        clipboard = QGuiApplication.clipboard()
        clipboard.setText(text)


def message_handler(mode, context, message):
    print(message)


qInstallMessageHandler(message_handler)

app = QGuiApplication(sys.argv)
QDir.setCurrent(str(Path(__file__).parent))

# import source.source_rc  # noqa

qmlRegisterType(CFrameless, "Chakra", 1, 0, "CFrameless")

clipboard_helper = ClipboardHelper()

engine = QQmlApplicationEngine()
engine.rootContext().setContextProperty("clipboardHelper", clipboard_helper)
engine.addImportPath("src")
engine.load("gallery/index.qml")

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
