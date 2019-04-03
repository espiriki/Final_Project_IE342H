function [ir] = obter_resposta_impulso(sinal_de_excitacao, gravacao)

fh=15000;
fl=40;
fs=44100;
tamanho = length(sinal_de_excitacao);
eixo_frequencia = (0:(length(sinal_de_excitacao)/2)-1)/(length(sinal_de_excitacao)/2)*(fs/2);

%filtro passa alta com corte de 40Hz
[b,a] = cheby1(9,1,fh/(fs/2));
filtro_alta = freqz(b,a,round(tamanho/2));

%filtro passa baixa com corte em 15Khz
[d,c] = cheby1(5,1,fl/(fs/2),'high');
filtro_baixa = freqz(d,c,round(tamanho/2));

%espelha os filtros para poder aplicar no espectro (fiz isso no sonometro)
filtro_alta = filtro_alta';
filtro_alta = [filtro_alta filtro_alta(end:-1:2)];
filtro_baixa = filtro_baixa';
filtro_baixa = [filtro_baixa filtro_baixa(end:-1:2)];

%calcula a resposta ao impulso
inverso_transformada_sinal_excitacao = 1 ./ fft(sinal_de_excitacao);
sinal_de_compensacao  = filtro_alta .* filtro_baixa .* inverso_transformada_sinal_excitacao;
espectro_resultante = fft(gravacao) .* sinal_de_compensacao;

ir = real(ifft(espectro_resultante));

%força a resposta ao impulso a ter media zero
ir = ir - mean(ir);

end