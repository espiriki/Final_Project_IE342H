function [comeco] = encontrar_inicio_ruido_fundo(ir,tempo,nivel_ruido,margem)

%obtem o envelope do sinal (suaviza a curva para um melhor calculo da media)
[h l] = envelope (ir,700,'peak');

%tempo é dado em ms!
fs=44100;
N = round((tempo/1000)*fs);
inicio=1;
fim=N;
media=0;

%analisa o sinal em uma janela de "tempo" ms e mede o valor medio do envelope
%do sinal nesse intervalo. O overlap das janelas é de 50%
%Quando o valor medio cair abaixo do nivel do ruido de fundo mais uma
%margem, o loop termina
while( media > (nivel_ruido + margem))

    x = h(inicio:fim);
  
    media = mean(x);
   
    inicio = round((inicio + fim)/2);
    fim = inicio + N;

end

%o ponto inicial da integral será o meio da primeira janela em que o valor
%medio caiu abaixo do valor que queremos (nivel de ruido de fundo mais uma margem)
comeco = round((inicio+fim)/2);

end