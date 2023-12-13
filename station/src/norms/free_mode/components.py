from norms.component import NormComponent


class FreeModeComponent(NormComponent):
    def check(self):
        return False
