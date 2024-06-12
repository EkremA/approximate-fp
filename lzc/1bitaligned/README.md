# Leading Zero Counter (1-Bit aligned)
The Leading Zero Counter (LZC) is based on algorithms specified by Oklobdzija et al. (1994).
Originally taking 2-bitaligned input words only in this publication, this version is adapted to take input values of **any width**  in **Big Endian** format and returns the amount of leading zeros as a binary number of $log_{2}(WIDTH)$ bits size. Additionally a validity bit is asserted.