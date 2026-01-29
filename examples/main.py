import os
import sys
from pathlib import Path
import chakra
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

os.environ["QT_QUICK_CONTROLS_STYLE"] = "Basic"
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
chakra.init(engine)
qml_file = Path(__file__).parent / "app.qml"
engine.load(str(qml_file))
sys.exit(app.exec())
