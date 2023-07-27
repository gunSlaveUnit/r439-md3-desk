from PySide6.QtCore import Signal, Property, QObject


class Configuration(QObject):
    def __init__(self):
        super().__init__()

        self._selected_norm = None

    # region SelectedNorm

    selected_norm_changed = Signal()

    @Property(QObject, notify=selected_norm_changed)
    def selected_norm(self):
        return self._selected_norm

    @selected_norm.setter
    def selected_norm(self, new_value: QObject):
        if self._selected_norm == new_value:
            return
        self._selected_norm = new_value
        self.selected_norm_changed.emit()

    # endregion
