%%
% @file exp1_1.m
% @author LiYu
% @date 2017.11.26
% @brief Example of getting array data by using HMI function.
%
% Can run with "exp1_1.c".

%%
% �M�����e�ܼ�
clc; clear;

% �}�Ҧ�C��
port_num = 8;
port = REMO_open(port_num);

% ���o�r��
s1 = fscanf(port,'%s');
s2 = fscanf(port,'%s');

% �o�e�r��
fprintf(port, 'Hello');
res = fscanf(port,'%s');
% ASA_M128 �|�� scanf �����쪺�r�꭫�s�o�e�@�M�A�G���|������ 'Hello'

% �����x�}���
type = 8; bytes = 4*5; % 5 �� f32
f32_data  = REMO_get(port, type, bytes);
type = 5; bytes = 2*5; % 5 �� ui8
ui16_data = REMO_get(port, type, bytes);
type = 2; bytes = 4*8; % 8 �� i32
i32_data  = REMO_get(port, type, bytes);

% ���o�r��
s3 = fscanf(port,'%s');

% �ק��ƫ�A�e�^M128
for i = 1:5
    f32_data(i) = f32_data(i) + 1;
end
type = 8; bytes = 4*5; % 5 �� f32
REMO_put(port, type, bytes, f32_data);

% �����x�}���
f32_data_re = REMO_get(port, type, bytes);

% ������C��
REMO_close(port);
