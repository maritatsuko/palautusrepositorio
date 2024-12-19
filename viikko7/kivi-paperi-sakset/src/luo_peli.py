from kps_koko_peli import KiviPaperiSakset
from kps_pelaaja_vs_pelaaja import KPSPelaajaVsPelaaja
from kps_tekoaly import KPSTekoaly
from kps_parempi_tekoaly import KPSParempiTekoaly

def luo_peli(tyyppi):
    if tyyppi == 'a':
        return KPSPelaajaVsPelaaja(KiviPaperiSakset)
    if tyyppi == 'b':
        return KPSTekoaly(KiviPaperiSakset)
    if tyyppi == 'c':
        return KPSParempiTekoaly(KiviPaperiSakset)

    return None
