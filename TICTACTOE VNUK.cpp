// TICTACTOE VNUK.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <ctime>
#include <random>
using namespace std;

//funkcie a premenne
char plocha[9] = { ' ' , ' ' , ' ' , ' ' , ' ' , ' ' , ' ' , ' ', ' ' };
void ukaz_plochu();
void daj_x_hracovi_vyber();
void daj_o_hracovi_vyber();
void daj_pocitacu_vyber();
int zapis_plochy(char symbol);
char skontroluj_winnera();
void pocitac_vs_hrac();
void hrac_vs_hrac();

int main()
{
	ukaz_plochu();
	cin.get();
	cin.get();
	return 0;
	
}
//funkcia pre vyber pocitaca
void daj_pocitacu_vyber() {
	srand(time(0));
	int vyber;
	do {
		vyber = rand() % 10;
	} while (plocha[vyber] != ' ');
	plocha[vyber] = 'O';
}

void daj_x_hracovi_vyber() {
	while (true) {
		cout << "PROSIM ZADAJ SVOJE ROZHODNUTIE (1-9):";
		int vyber;
		cin >> vyber;
		vyber--;
		if (vyber < 0 || vyber > 0) {
			cout << "PROSIM ZADAJ SVOJE ROZHODNUTIE (1-9)" << endl;
		}
		else if (plocha[vyber != ' ']) {
			cout << "PROSIM VYBER PRAZDNE MIESTO" << endl;
		}
		else  {
			plocha[vyber] = 'X';
			break;
		}
	}
}

//funkcia na ukazanie hracej tabule alebo plochy
void ukaz_plochu() {
	cout << "   " << "   |   " << "   |   " << endl;
	cout << "   " << plocha[0] << "  |   " << plocha[1] << "  |   " << plocha[2] << endl;
	cout << "   " << "   |   " << "   |   " << endl;
	cout << "--------------------" << endl;
	
	cout << "   " << "   |   " << "   |   " << endl;
	cout << "   " << plocha[3] << "  |   " << plocha[4] << "  |   " << plocha[5] << endl;
	cout << "   " << "   |   " << "   |   " << endl;
	cout << "--------------------" << endl;
	
	cout << "   " << "   |   " << "   |   " << endl;
	cout << "   " << plocha[6] << "  |   " << plocha[7] << "  |   " << plocha[8] << endl;
	cout << "   " << "   |   " << "   |   " << endl;
	
}

