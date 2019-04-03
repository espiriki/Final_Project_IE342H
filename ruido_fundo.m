function [media] = ruido_fundo(ir)

%obtem o envelope do sinal
[h l] = envelope (ir,700,'peak');

%obtem-se os 10% finais da resposta ao impulso, onde considera-se
%que o ruído de fundo já domina.
final_ir = h(round(length(ir)*0.9):end);

%Faz uma media dos valores dos 10% finais e esse valor eh o nivel do
%ruido de fundo
media = mean(final_ir);

end