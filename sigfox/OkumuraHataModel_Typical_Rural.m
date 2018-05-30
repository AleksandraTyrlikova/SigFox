function Lrural = OkumuraHataModel_Typical_Rural(d,hm,hb,fc) 

% fc  >= 400MHz 

ahm = 3.2*(log10(11.75*hm)).^2 - 4.97; % формула (7.16)

% формула (7.14) + (7.14)
A_B = 69.55 + 26.16*log10(fc) + (44.9 - 6.55*log10(hb))*log10(d) - 13.82*log10(hb) - ahm;

% формула (7.21)
Lrural = A_B - 4.78*(log10(fc)).^2 + 18.33*log10(fc) - 40.98;