%%%%Valores iniciais

fs=44100;
exponencial_sweep = audioread('exponencial_sweep.wav');
exponencial_sweep = exponencial_sweep';
linear_sweep = audioread('linear_sweep.wav');
linear_sweep = linear_sweep';


%%%%LOGARITHMIC%%%%


%%%%P1%%%%
exp_sweep_p1 = audioread('exponencial_sweep_p1.wav');
exp_sweep_p1 = exp_sweep_p1';
exp_p1_ir = obter_resposta_impulso(exponencial_sweep, exp_sweep_p1);
exp_p1_ir = exp_p1_ir(1:300000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(exp_p1_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(exp_p1_ir);

%%%%P3%%%%
exp_sweep_p3 = audioread('exponencial_sweep_p3.wav');
exp_sweep_p3 = exp_sweep_p3';
exp_p3_ir = obter_resposta_impulso(exponencial_sweep, exp_sweep_p3);
exp_p3_ir = exp_p3_ir(1:300000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(exp_p3_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(exp_p3_ir);

%%%%P4%%%%
exp_sweep_p4 = audioread('exponencial_sweep_p4.wav');
exp_sweep_p4 = exp_sweep_p4';
exp_p4_ir = obter_resposta_impulso(exponencial_sweep, exp_sweep_p4);
exp_p4_ir = exp_p4_ir(1:300000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(exp_p4_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(exp_p4_ir);



%%%%LINEAR%%%%


%%%%P1%%%%
lin_sweep_p1 = audioread('linear_sweep_p1.wav');
lin_sweep_p1 = lin_sweep_p1';
lin_p1_ir = obter_resposta_impulso(linear_sweep, lin_sweep_p1);
lin_p1_ir = lin_p1_ir(1:400000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(lin_p1_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(lin_p1_ir);

%%%%P3%%%%
lin_sweep_p3 = audioread('linear_sweep_p3.wav');
lin_sweep_p3 = lin_sweep_p3';
lin_p3_ir = obter_resposta_impulso(linear_sweep, lin_sweep_p3);
lin_p3_ir = lin_p3_ir(1:400000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(lin_p3_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(lin_p3_ir);

%%%%P4%%%%
lin_sweep_p4 = audioread('linear_sweep_p4.wav');
lin_sweep_p4 = lin_sweep_p4';
lin_p4_ir = obter_resposta_impulso(linear_sweep, lin_sweep_p4);
lin_p4_ir = lin_p4_ir(1:400000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(lin_p4_ir),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(lin_p4_ir);





%%%%PALMAS%%%%


%%%%P1%%%%
palma_p1 = audioread('palma_p1.wav');
palma_p1 = palma_p1';
palma_p1 = palma_p1(1:350000);
[maximo idx] = max(palma_p1);
palma_p1 = palma_p1(idx:end);
palma_p1 = filtros_palma_balao(palma_p1);
palma_p1 = palma_p1(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(palma_p1 ),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(palma_p1);

%%%%P2%%%%
palma_p2 = audioread('palma_p2.wav');
palma_p2 = palma_p2';
palma_p2 = palma_p2(1:230000);
[maximo idx] = max(palma_p2);
palma_p2 = palma_p2(idx:end);
palma_p2 = filtros_palma_balao(palma_p2);
palma_p2 = palma_p2(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(palma_p2 ),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(palma_p2);

%%%%P3%%%%
palma_p3 = audioread('palma_p3.wav');
palma_p3 = palma_p3';
palma_p3 = palma_p3(1:230000);
[maximo idx] = max(palma_p3);
palma_p3 = palma_p3(idx:end);
palma_p3 = filtros_palma_balao(palma_p3);
palma_p3 = palma_p3(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(palma_p3 ),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(palma_p3);

%%%%P4%%%%
palma_p4 = audioread('palma_p4.wav');
palma_p4 = palma_p4';
palma_p4 = palma_p4(1:250000);
[maximo idx] = max(palma_p4);
palma_p4 = palma_p4(idx:end);
palma_p4 = filtros_palma_balao(palma_p4);
palma_p4 = palma_p4(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(palma_p4 ),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(palma_p4);


%%%%BALAO%%%%


%%%%P1%%%%
bexiga_p1 = audioread('bexiga_p1.wav');
bexiga_p1 = bexiga_p1';
bexiga_p1 = bexiga_p1(1:350000);
[maximo idx] = max(bexiga_p1);
bexiga_p1 = bexiga_p1(idx:end);
bexiga_p1 = filtros_palma_balao(bexiga_p1);
bexiga_p1 = bexiga_p1(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(bexiga_p1),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(bexiga_p1);

%%%%P2%%%%
bexiga_p2 = audioread('bexiga_p2.wav');
bexiga_p2 = bexiga_p2';
bexiga_p2 = bexiga_p2(1:350000);
[maximo idx] = max(bexiga_p2);
bexiga_p2 = bexiga_p2(idx:end);
bexiga_p2 = filtros_palma_balao(bexiga_p2);
bexiga_p2 = bexiga_p2(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(bexiga_p2),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(bexiga_p2);

%%%%P3%%%%
bexiga_p3 = audioread('bexiga_p3.wav');
bexiga_p3 = bexiga_p3';
bexiga_p3 = bexiga_p3(1:350000);
[maximo idx] = max(bexiga_p3);
bexiga_p3 = bexiga_p3(idx:end);
bexiga_p3 = filtros_palma_balao(bexiga_p3);
bexiga_p3 = bexiga_p3(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(bexiga_p3),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(bexiga_p3);

%%%%P4%%%%
bexiga_p4 = audioread('bexiga_p4.wav');
bexiga_p4 = bexiga_p4';
bexiga_p4 = bexiga_p4(1:350000);
[maximo idx] = max(bexiga_p4);
bexiga_p4 = bexiga_p4(idx:end);
bexiga_p4 = filtros_palma_balao(bexiga_p4);
bexiga_p4 = bexiga_p4(1:end-4000);
[RT EDT] = calcular_RT_EDT(integral_Schroeder(bexiga_p4),30);
[C50 C80 D50 D80] = calcular_clareza_e_definicao(bexiga_p4);

