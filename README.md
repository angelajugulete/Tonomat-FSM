# Tonomat FSM (Mealy)

Acest proiect contine un automat finit de tip Mealy scris in SystemVerilog, care simuleaza functionarea unui tonomat ce accepta monede de 1 RON, 5 RON si 10 RON.

## Comportament

Automatul recunoaste combinatii de monede pentru a oferi un produs (3 RON), si returneaza rest (R1 si R5) cand este cazul. 
Intrarile sunt: `RON1`, `RON5`, `RON10`, `CLK`, `RESET`. 
Iesirile sunt: `PRODUS`, `R1`, `R5`.
