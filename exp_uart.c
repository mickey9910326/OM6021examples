/**
 * @file exp_uart.c
 * @author LiYu
 * @date 2018.05.18
 * @brief Example of using uart1 to communicate with pc.
 *
 */

#define USART_baud 38400

#include "ASA_Lib.h"

void uart0_init();
void uart0_put(uint8_t ch);
uint8_t uart0_get();

int main() {

    uart0_init();
    uart0_put('H');
    uart0_put('e');
    uart0_put('l');
    uart0_put('l');
    uart0_put('o');

    return 0;
}

void uart0_init() {
    unsigned int baud;
    // 11059200
	baud = F_CPU/16/USART_baud-1;
	UBRR0H = (unsigned char)(baud>>8);
	UBRR0L = (unsigned char)baud;

	UCSR0B |= (1<<RXEN0) | (1<<TXEN0);
	UCSR0C |= (3<<UCSZ00);
}

void uart0_put(uint8_t ch) {
    while(!(UCSR0A&(1<<UDRE0)));
    UDR0 = ch;
}

uint8_t uart0_get() {
    while(!(UCSR0A&(1<<RXC)));
    return UDR0;
}
