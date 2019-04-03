function [curva_dB tempo] = integral_Schroeder(ir)

close all;
fs=44100;

%obtem a resposta ao impulso ao quadrado (h^2 visto em sala)
ir = ir .^ 2;

%retira a parte correspondente ao inicio da reverberação, quando o nível
%sonoro ainda está subindo
[maximo idx] = max(ir);
ir = ir(idx:end);

tempo = 0:1/fs:(length(ir)-1)/fs;

%obtém o valor em dB de h^2
resp_quad_dB = 10 * log10(ir/max(ir));

%obtem o envelope do sinal
[h l] = envelope (resp_quad_dB,700,'peak');

plot(tempo,resp_quad_dB);
hold on;

%encontra o valor em dB do ruído de fundo
ruido_de_fundo = ruido_fundo(resp_quad_dB);

linha_ruido_de_fundo = ruido_de_fundo * ones(1, length(tempo));
plot(tempo,linha_ruido_de_fundo,'r');

%encontra o ponto em que o nível da resposta ao impulso chega a um nível 10dB
%acima do ruido de fundo. Utiliza-se janelas de 40 ms para analisar o valor
%médio da resposta ao impulso
ponto = encontrar_inicio_ruido_fundo(resp_quad_dB,40,ruido_de_fundo,10);


%obtem o envelope do sinal com uma suavização maior, só para o ponto da figura
%que marca o início da integral de Schroeder não ficar bem em cima da curva
[h l] = envelope (resp_quad_dB,400,'peak');

plot(tempo(ponto),h(ponto),'o','MarkerFaceColor','y','MarkerSize',10);
text(tempo(ponto),h(ponto),'\leftarrow Inicio da integral de Schroeder','VerticalAlignment','bottom');
title('Energia da resposta ao impulso em dB (em relação ao nível máximo)');
xlabel('Tempo (s)');
ylabel('Amplitude (dB)');

%Faz a integral de Schroeder com os dados obtidos acima
%integra reversamente a partir do ponto retornado por
%encontrar_inicio_ruido_fundo()
curva(ponto:-1:1) = cumsum(ir(ponto:-1:1));

%obtem a curva de Schroeder em db
curva_dB = 10 * log10(curva/max(curva));

end