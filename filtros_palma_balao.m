function [ir_final] = filtros_palma_balao(ir)

fl=40;
fs=44100;
fh=15000;
tamanho = length(ir);

eixo_frequencia = (0:(length(ir)/2)-1)/(length(ir)/2)*(fs/2);

%filtro passa alta com corte em 40Hz
[b,a] = cheby1(9,1,fh/(fs/2));
filtro_alta = freqz(b,a,round(tamanho/2));

%filtro passa baixa com corte em 18 Khz
[d,c] = cheby1(5,1,fl/(fs/2),'high');
filtro_baixa = freqz(d,c,round((tamanho)/2));

%espelha o filtro
filtro_baixa = filtro_baixa';
filtro_baixa = [filtro_baixa filtro_baixa(end:-1:2)];
filtro_alta = filtro_alta';
filtro_alta = [filtro_alta filtro_alta(end:-1:2)];

%para nao ter problemas com o tamanho do filtro
if (mod(tamanho,2)==0)
   ir = ir(1:end-1);
end

%calcular a resposta ao impulso
espectro_resultante = fft(ir) .* filtro_baixa .* filtro_alta;
ir_final = real(ifft(espectro_resultante));

end