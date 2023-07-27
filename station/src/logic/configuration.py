from PySide6.QtCore import Signal, Property, QObject

from norms.norm import Norm


class Configuration(QObject):
    def __init__(self):
        super().__init__()

        self._selected_norm: Norm | None = None
        self._is_training: bool = False

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

    # region IsTraining

    is_training_changed = Signal()

    @Property(bool, notify=is_training_changed)
    def is_training(self):
        return self._is_training

    @is_training.setter
    def is_training(self, new_value: bool):
        if self._is_training == new_value:
            return
        print(new_value)
        self._is_training = new_value
        self.is_training_changed.emit()

    # endregion
