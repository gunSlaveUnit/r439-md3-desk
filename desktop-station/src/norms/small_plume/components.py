from logic.AGL import AGL
from logic.DMDUZOZM import DMDUZOZM
from logic.KLU import KLU
from logic.L807 import L807
from logic.Plume import Plume
from logic.TLF1 import TLF1
from logic.TractsPRMPRD import TractsPRMPRD
from norms.component import NormComponent


class L807SmallPlumeComponent(NormComponent):
    def __init__(self, l807: L807):
        self._l807 = l807

    def check(self):
        return self._l807.signal_source == 1


class AGLSmallPlumeComponent(NormComponent):
    def __init__(self, agl: AGL):
        self._agl = agl

    def check(self):
        return self._agl.zs_operating_mode == 0 \
            and self._agl.speed_gs_prm == 3 \
            and self._agl.speed_gs_prd == 3 \
            and self._agl.rats_mode == 0


class TLF1SmallPlumeComponent(NormComponent):
    def __init__(self, tlf1: TLF1):
        self._tlf1 = tlf1

    def check(self):
        return self._tlf1.signal_prm_type == 2 \
            and self._tlf1.prm_speed == 1 \
            and self._tlf1.prm_address_one == 0 \
            and self._tlf1.prm_address_two == 0 \
            and self._tlf1.prm_address_three == 0 \
            and self._tlf1.signal_prd_type == 2 \
            and self._tlf1.prd_speed == 1 \
            and self._tlf1.prd_address_one == 0 \
            and self._tlf1.prd_address_two == 0


class KLUSmallPlumeComponent(NormComponent):
    def __init__(self, klu: KLU):
        self._klu = klu

    def check(self):
        return self._klu.test_check == 1 \
            and self._klu.prd70 == 1 \
            and self._klu.prd_signal_type == 0


class DMDUZOZMSmallPlumeComponent(NormComponent):
    def __init__(self, dmd_uzozm: DMDUZOZM):
        self._dmd_uzozm = dmd_uzozm

    def check(self):
        return self._dmd_uzozm.prm_signal_type == 1 \
            and self._dmd_uzozm.decoder == 4 \
            and self._dmd_uzozm.dmd_speed == 2 \
            and self._dmd_uzozm.dmd_mode == 0 \
            and self._dmd_uzozm.prd_uzozm_speed == 0 \
            and self._dmd_uzozm.uzozm_mode == 0 \
            and self._dmd_uzozm.filter_number == 2 \
            and self._dmd_uzozm.aru == 0 \
            and self._dmd_uzozm.auto_search == 0 \
            and self._dmd_uzozm.asch == 0 \
            and self._dmd_uzozm.dif_decoder == 1 \
            and self._dmd_uzozm.dmd_band == 1 \
            and self._dmd_uzozm.corrector == 1


class TractsPRMPRDSmallPlumeComponent(NormComponent):
    def __init__(self, tracts_prm_prd: TractsPRMPRD):
        self._tracts_prm_prd = tracts_prm_prd

    def check(self):
        return self._tracts_prm_prd.auto_check_can == 0 \
            and self._tracts_prm_prd.receive_subband == 0 \
            and self._tracts_prm_prd.shift_generator == 1 \
            and self._tracts_prm_prd.barrel_filter == 0 \
            and self._tracts_prm_prd.amplifier == 0 \
            and self._tracts_prm_prd.radio_signal == 0 \
            and self._tracts_prm_prd.signal_type == 0 \
            and self._tracts_prm_prd.zs_speed == 2 \
            and self._tracts_prm_prd.output_u205d == 0 \
            and self._tracts_prm_prd.prd_wave_number == 0 \
            and self._tracts_prm_prd.prm_wave_number == 2500


class PlumeSmallPlumeComponent(NormComponent):
    def __init__(self, plume: Plume):
        self._plume = plume

    def check(self):
        return self._plume.shift_generator == 1 \
            and self._plume.amplifier == 0 \
            and self._plume.output_u205d == 1 \
            and self._plume.prd_wave_number == 65432
