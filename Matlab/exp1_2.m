%%
% @file exp1_2.m
% @author LiYu
% @date 2017.11.26
% @brief Example of getting array data by using HMI function.
%
% Can run with "exp1_2.c".

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

% �������c���
Bytes = 1*10 + 4*10 + 4*5;
[data,FormatString,error] = REMO_FORM_get(port,Bytes);
data

% ���ܸ��
data.type1(1) = data.type1(1) + 1;

% �o�e���c���
REMO_FORM_put(port,FormatString,Bytes,data);

% �������c���
[data_re,FormatString,error] = REMO_FORM_get(port,Bytes);
data_re

% ������C��
REMO_close(port);
