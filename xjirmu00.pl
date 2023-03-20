% Zadani c. 14:
% Napiste program resici ukol dany predikatem u14(LIN,VIN,VOUT), kde LIN je 
% vstupni ciselny seznam s nejmene jednim prvkem, VIN je vstupni promenna  
% obsahujici cislo/prah a VOUT je vystupni promenna vracejici prumernou 
% hodnotu cisel seznamu LIN, jejichz absolutni hodnota je vetsi nez prah.
% Muzete predpokladat, ze absolutni hodnota alespon jednoho cisla seznamu
% je vetsi nez prah.

% Testovaci predikaty:                                  % VOUT
u14_1:- u14([5,27,-1,28,19,-40],10,VOUT),write(VOUT).	% 8.5
u14_2:- u14([2.5,3.6,4.7],3,VOUT),write(VOUT).         	% 4.15
u14_3:- u14([8,6,-6,-8],2,VOUT),write(VOUT).		% 0
u14_r:- write('Zadej LIN: '),read(LIN),
        write('Zadej VIN: '),read(VIN),
        u14(LIN,VIN,VOUT),write(VOUT).

% Reseni:
u14(LIN, VIN, VOUT) :-
    sum_filtered(LIN, VIN, 0, Sum, Count),
    VOUT is Sum / Count.

sum_filtered([], _, Sum, Sum, Count) :-
    Count > 0.
sum_filtered([H|T], VIN, Acc, Sum, Count) :-
    (   abs(H) > VIN
    ->  Acc1 is Acc + H,
        Count1 is Count + 1
    ;   Acc1 = Acc,
        Count1 = Count
    ),
    sum_filtered(T, VIN, Acc1, Sum, Count1).