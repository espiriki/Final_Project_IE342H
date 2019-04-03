function [RT EDT] = calcular_RT_EDT(schroeder, Tx)

Tx=Tx+5;
schroeder=schroeder';
fs=44100;
tempo = 0:1/fs:(length(schroeder)-1)/fs;
tempo=tempo';

%faz o calculo do EDT
EDT = calculo_edt(schroeder);


%acha o ponto mais proximo de -5dB
tmp = abs(schroeder + 5);
[idx1 inf] = min(tmp);

%acha o ponto mais proximo de -Tx [dB] - Tx é passado como parametro
%pode ser T10,T20,T30,T60, etc
tmp = abs(schroeder + Tx);
[idx2 sup] = min(tmp);

%ajusta uma resta aos pontos nesse intervalo
[f gof] = fit(tempo(inf:sup),schroeder(inf:sup),'poly1');

coeffs = coeffvalues(f);

%esse bloco de código é só pra plotar os pontos no gráfico
tempo = 0:1/fs:(length(schroeder)-1)/fs;
tempo=tempo';
linha_fitada = coeffs(2) + coeffs(1)*tempo;
figure();
plot(tempo,schroeder);
hold on;
plot(tempo,linha_fitada,'r');
plot(tempo(inf),linha_fitada(inf),'o','MarkerFaceColor','y','MarkerSize',10);
plot(tempo(sup),linha_fitada(sup),'o','MarkerFaceColor','y','MarkerSize',10);
text(tempo(inf),linha_fitada(inf),'\leftarrow -5 dB','VerticalAlignment','bottom');
limite = sprintf ('\\leftarrow -%d dB',Tx);
text(tempo(sup),linha_fitada(sup),limite,'VerticalAlignment','bottom');
title('Curva de Schroeder');
xlabel('Tempo (s)');
ylabel('Amplitude (dB)');


%calcular o tempo de reverberação, lembrando que ele é definido
%como o tempo que demora pra cair 60 dB, se não temos esse range
%ajustamos uma reta e extrapolamos
RT = -60/coeffs(1);

msg1 = sprintf('\nTempo de reverberação T%d',Tx-5);
msg2 = sprintf('é de: %.2f s \n', RT);

%Imprime no console
disp(msg1);
disp(msg2);

end

%usa o mesmo principio do calculo do tempo de reverberação, mas agora
%calcula o tempo que o som leva pra cair de 0dB pra -10dB
function [edt] = calculo_edt(schroeder)

fs=44100;
tempo = 0:1/fs:(length(schroeder)-1)/fs;
tempo=tempo';


tmp = abs(schroeder + 10);
[dummy fim] = min(tmp);

[f gof] = fit(tempo(1:fim),schroeder(1:fim),'poly1');

coeffs = coeffvalues(f);

edt = -60/coeffs(1);

msg1 = sprintf('\nEarly Decay Time = %.2f s',edt);
disp(msg1);

end