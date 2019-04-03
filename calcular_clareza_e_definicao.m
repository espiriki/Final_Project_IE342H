function [C50 C80 D50 D80] = calcular_clareza_e_definicao(ir)

fs=44100;
tempo=0:1/fs:(length(ir)-1)/fs;

[maximo idx] = max(ir);
ir = ir(idx:end);
ir = ir .^ 2;

%Encontra o ponto no eixo do tempo mais proximo de 80ms
tmp = abs (0.08 - tempo);
[valor idx1] = min (tmp);

%Encontra o ponto no eixo do tempo mais proximo de 50ms
tmp = abs (0.05 - tempo);
[valor idx2] = min (tmp);


%calcula a integral nos primeiros 80 ms e divide pela integral de 80ms
%em diante
C80 = sum(ir(1:idx1)) / sum(ir(idx1+1:end));
C80 = 10 * log10(C80);

%calcula a integral nos primeiros 80 ms e divide pela integral de 80ms
%em diante
C50 = sum(ir(1:idx2)) / sum(ir(idx2+1:end));
C50 = 10 * log10(C50);

%calcula a integral nos primeiros 80 ms e divide pela integral da
%resposta inteira
D80 = sum(ir(1:idx1)) / sum(ir);
D80 = 10 * log10(D80);

%calcula a integral nos primeiros 80 ms e divide pela integral da
%resposta inteira
D50 = sum(ir(1:idx2)) / sum(ir);
D50 = 10 * log10(D50);

end