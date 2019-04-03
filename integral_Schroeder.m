function [curva_dB tempo] = integral_Schroeder(ir)

close all;
fs=44100;

%obtem a resposta ao impulso ao quadrado (h^2 visto em sala)
ir = ir .^ 2;

%retira a parte correspondente ao inicio da reverbera��o, quando o n�vel
%sonoro ainda est� subindo
[maximo idx] = max(ir);
ir = ir(idx:end);

tempo = 0:1/fs:(length(ir)-1)/fs;

%obt�m o valor em dB de h^2
resp_quad_dB = 10 * log10(ir/max(ir));

%obtem o envelope do sinal
[h l] = envelope (resp_quad_dB,700,'peak');

plot(tempo,resp_quad_dB);
hold on;

%encontra o valor em dB do ru�do de fundo
ruido_de_fundo = ruido_fundo(resp_quad_dB);

linha_ruido_de_fundo = ruido_de_fundo * ones(1, length(tempo));
plot(tempo,linha_ruido_de_fundo,'r');

%encontra o ponto em que o n�vel da resposta ao impulso chega a um n�vel 10dB
%acima do ruido de fundo. Utiliza-se janelas de 40 ms para analisar o valor
%m�dio da resposta ao impulso
ponto = encontrar_inicio_ruido_fundo(resp_quad_dB,40,ruido_de_fundo,10);


%obtem o envelope do sinal com uma suaviza��o maior, s� para o ponto da figura
%que marca o in�cio da integral de Schroeder n�o ficar bem em cima da curva
[h l] = envelope (resp_quad_dB,400,'peak');

plot(tempo(ponto),h(ponto),'o','MarkerFaceColor','y','MarkerSize',10);
text(tempo(ponto),h(ponto),'\leftarrow Inicio da integral de Schroeder','VerticalAlignment','bottom');
title('Energia da resposta ao impulso em dB (em rela��o ao n�vel m�ximo)');
xlabel('Tempo (s)');
ylabel('Amplitude (dB)');

%Faz a integral de Schroeder com os dados obtidos acima
%integra reversamente a partir do ponto retornado por
%encontrar_inicio_ruido_fundo()
curva(ponto:-1:1) = cumsum(ir(ponto:-1:1));

%obtem a curva de Schroeder em db
curva_dB = 10 * log10(curva/max(curva));

end