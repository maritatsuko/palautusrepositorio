# tehdään alussa importit
#muutos
from logger import logger
from summa import summa
from erotus import erotus
#muutos2
logger("aloitetaan ohjelma")

x = int(input("luku 1: "))
y = int(input("luku 2: "))

print(f"Lukujen {x} ja {y} summa on {summa(x, y)}")  # muutos bugikorjaus-branchissa
print(f"Lukujen {x} ja {y} erotus on {erotus(x, y)}")  # muutos bugikorjaus-branchissa

logger("lopetetaan")
print("goodbye!")
