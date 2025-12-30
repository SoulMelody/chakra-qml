import subprocess
from pathlib import Path
from loguru import logger


def uv_run(cmd: list):
    """Execute command using uv run"""
    uv_cmd = ["uv", "run"]
    uv_cmd.extend(cmd)
    try:
        subprocess.run(
            uv_cmd,
            check=True,
            capture_output=True,
            text=True,
        )
        logger.success(f"Successfully executed: {' '.join([str(i) for i in cmd])}")
    except subprocess.CalledProcessError as e:
        logger.error(f"Error: {e.stderr}")
    except FileNotFoundError:
        logger.error(f"{cmd[0]} not found!")


def gen_qrc(path: Path | str, qrc_prefix: str = "/Chakra"):
    """Generate Qt resource file (.qrc) from directory"""
    path = Path(path)
    qrc = path / f"{path.stem}.qrc"

    excluded_suffixes = [
        ".ui",
        ".qrc",
        ".py",
        ".pyc",
        ".pyi",
    ]

    resource = [
        i.relative_to(path).as_posix()
        for i in path.rglob("*")
        if all([i.suffix not in excluded_suffixes, i.is_file()])
    ]

    with qrc.open("w", encoding="utf-8") as f:
        f.write("<RCC>\n")
        f.write(f'    <qresource prefix="{qrc_prefix}">\n')
        for _p in resource:
            f.write(f"        <file>{_p}</file>\n")
        f.write("    </qresource>\n")
        f.write("</RCC>\n")

    logger.success(f"Generated {qrc}")


def update_qrc(qrc: Path | str):
    """Compile .qrc to Python resource file"""
    qrc = Path(qrc)
    uv_run(
        [
            "pyside6-rcc",
            qrc,
            "-o",
            qrc.parent / f"{qrc.stem}_rc.py",
        ]
    )


def update_qrcs(path: Path | str):
    """Compile all .qrc files in directory"""
    path = Path(path)
    qrcs = path.rglob("*.qrc")
    list(map(update_qrc, qrcs))


def gen_qmldir(
    folder_path: Path | str,
    qml_module: str = "Chakra",
    version: str = "1.0",
    qml_prefix: str = ":/Chakra/",
):
    """Generate qmldir file for QML module"""
    folder_path = Path(folder_path)

    _ps = list(folder_path.rglob("*.qml"))
    if not _ps:
        logger.warning(f"No QML files found in {folder_path}")
        return

    qmldir = folder_path / "qmldir"

    with qmldir.open("w", encoding="utf-8") as f:
        f.write(f"module {qml_module}\n\n")

        for qml in sorted(_ps):
            if qml.name == "qmldir":
                continue

            # Check if file is a singleton
            is_singleton = False
            try:
                content = qml.read_text(encoding="utf-8")
                if "pragma Singleton" in content:
                    is_singleton = True
            except Exception:
                pass

            if is_singleton:
                f.write(f"singleton {qml.stem} {qml.name}\n")
            else:
                f.write(f"{qml.stem} {qml.name}\n")

    logger.success(f"Generated {qmldir}")


def gen_qmltypes(path: Path | str, name: str, major: str = "1", minor: str = "0"):
    """Generate QML type information from Python files"""
    project_path = Path(path)

    py_files = [
        f
        for f in project_path.rglob("*.py")
        if not f.name.startswith("_") and f.name != "setup.py"
    ]

    if not py_files:
        logger.warning(f"No Python files found in {project_path}")
        return

    metadata_path = project_path / "metadata.json"
    qmltypes_path = project_path / "plugins.qmltypes"

    command = ["pyside6-metaobjectdump"]
    command.extend(py_files)
    command.extend(["--out-file", metadata_path])
    uv_run(command)

    uv_run(
        [
            "pyside6-qmltyperegistrar",
            metadata_path,
            "--import-name",
            name,
            "--major-version",
            major,
            "--minor-version",
            minor,
            "--generate-qmltypes",
            qmltypes_path,
        ]
    )

    if metadata_path.exists():
        metadata_path.unlink()

    logger.success(f"Generated {qmltypes_path}")
