// TICTACTOE VNUK.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <ctime>
#include <random>
#include <string>
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
	do {
		int mod;
		cout << "1. Pocitac VS Hrac" << endl;
		cout << "2. Hrac VS Hrac" << endl;
		cout << "Vyber mod hry: (1/2)" << endl;
		cin >> mod;
		switch (mod) {
		case 1:
			pocitac_vs_hrac();
			break;
		case 2:
			hrac_vs_hrac();
			break;
		default:
			cout << "Vyber prosim spravny mod od (1-2)" << endl;
			break;
		}
		cout << "Ak chces pokracovat v hre zadaj 1, ak chces hru ukoncit daj 2" << endl;
		int roz;
		cin >> roz;
		if (roz != 1) {
			return 0;
		}
		else if (roz == 1) {
			plocha[0] = ' ';
			plocha[1] = ' ';
			plocha[2] = ' ';
			plocha[3] = ' ';
			plocha[4] = ' ';
			plocha[5] = ' ';
			plocha[6] = ' ';
			plocha[7] = ' ';
			plocha[8] = ' ';
			system("CLS");
		}
		continue;
	}

	while (1);


	return 0;
	}

void pocitac_vs_hrac() {
	string meno_hraca;
	cout << "Zadaj svoje meno: ";
	cin >> meno_hraca;
	while (true) {
		system("cls");
		ukaz_plochu();
		if (zapis_plochy('X') == zapis_plochy('O')) {
			cout << meno_hraca << "'s TAH." << endl;
			daj_x_hracovi_vyber();
		}
		else {
			daj_pocitacu_vyber();
		}
		char vyherca = skontroluj_winnera();
		if (vyherca == 'X') {
			
			ukaz_plochu();
			cout << meno_hraca << " Vyhral hru!" << endl;
			break;
		}
		else if (vyherca == 'O') {
			
			ukaz_plochu();
			cout << "Pocitac vyhral hru!" << endl;
			break;
		}
		else if (vyherca == 'D') {
			cout << "Je to remiza!" << endl;
			break;
		}
	}
}

//funkcia pre vyber pocitaca
void daj_pocitacu_vyber() {
	srand (time(0));
	int vyber;
	do {
		vyber = rand() % 10;
	} while (plocha[vyber] != ' ');
	plocha[vyber] = 'O';
}


// funkcia pre hraca X
void daj_x_hracovi_vyber() {
	while (true) {
		cout << "PROSIM ZADAJ SVOJE ROZHODNUTIE (1-9):" << endl;
		int vyber;
		cin >> vyber;
		vyber--;
		if (vyber < 0 || vyber > 8) {
			cout << "PROSIM ZADAJ ROZHODNUTIE OD (1-9)" << endl;
		}
		else if (plocha[vyber] != ' ') {
			cout << "PROSIM VYBER PRAZDNE MIESTO" << endl;
		}
		else  {
			plocha[vyber] = 'X';
			break;
		}
	}
}
// funkcia pre hraca O
void daj_o_hracovi_vyber() {
	while (true) {
		cout << "PROSIM ZADAJ SVOJE ROZHODNUTIE (1-9):" << endl;
		int vyber;
		cin >> vyber;
		vyber--;
		if (vyber < 0 || vyber > 8) {
			cout << "PROSIM ZADAJ ROZHODNUTIE OD (1-9)" << endl;
		}
		else if (plocha[vyber] != ' ') {
			cout << "PROSIM VYBER PRAZDNE MIESTO" << endl;
		}
		else {
			plocha[vyber] = 'O';
			break;
		}
	}
}

//funkcia pre hrac vs hrac
void hrac_vs_hrac() {
	string xmeno;
	string omeno;
		cout << "Zadaj meno hraca X:";
		cin >> xmeno;
		cout << "Zadaj meno hraca O:";
		cin >> omeno;
			
		while (true) {
			system("cls");
			ukaz_plochu();
			
			if (zapis_plochy('X') == zapis_plochy('O')) {
				cout << xmeno << "'s TAH." << endl;
				daj_x_hracovi_vyber();
			}
			else {
				cout << omeno << "'s TAH" << endl;
				daj_o_hracovi_vyber();
			}
			char vyherca = skontroluj_winnera();
			if (vyherca == 'X') {
				
				ukaz_plochu();
				cout << xmeno << " Vyhral hru!" << endl;
				break;
			}
			else if (vyherca == 'O') {
				
				ukaz_plochu();
				cout << omeno << "Vyhral hru!" << endl;
				break;
			}
			else if (vyherca == 'D') {
				cout << "Je to remiza!" << endl;
				break;

			}
		
	}
}


int zapis_plochy(char symbol) {
	int total = 0;
	for (int i = 0; i < 9; i++) {
		if (plocha[i] == symbol)
			total += 1;
	}
	return total;
}



char skontroluj_winnera() {
	//kontrola winnera horizontal/riadok
	if (plocha[0] == plocha[1] && plocha[1] == plocha[2] && plocha[0] != ' ')
		return plocha[0];
	if (plocha[3] == plocha[4] && plocha[4] == plocha[5] && plocha[3] != ' ')
		return plocha[3];
	if (plocha[6] == plocha[7] && plocha[7] == plocha[8] && plocha[6] != ' ')
		return plocha[6];
	
	
	//kontrola winnera vertikalne/kolmo
	if (plocha[0] == plocha[3] && plocha[3] == plocha[6] && plocha[0] != ' ')
		return plocha[0];
	if (plocha[1] == plocha[4] && plocha[4] == plocha[7] && plocha[1] != ' ')
		return plocha[1];
	if (plocha[2] == plocha[5] && plocha[5] == plocha[8] && plocha[2] != ' ')
		return plocha[2];
	
	
	//kontrola winnera diagonalne
	if (plocha[0] == plocha[4] && plocha[4] == plocha[8] && plocha[0] !=  ' ')
		return plocha[0];
	if (plocha[2] == plocha[4] && plocha[4] == plocha[6] && plocha[2] != ' ')
		return plocha[2];
	if (zapis_plochy('X') + zapis_plochy('O') < 9)
		return 'C';
	else
		return 'D';
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
