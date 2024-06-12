# Leading Zero Counter (2-Bit aligned)
The Leading Zero Counter (LZC) is based on algorithms specified by Oklobdzija et al. (1994).
It is takes an input value that is 2 Bit aligned ($WIDTH\mod 2 = 0$) in **Big Endian** format and returns the amount of leading zeros as a binary number of $log_{2}(WIDTH)$ bits size. Additionally a validity bit is asserted.