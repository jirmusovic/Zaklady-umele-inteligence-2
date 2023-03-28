% Zadani c. 14:
% Napiste program resici ukol dany predikatem u14(LIN,VIN,VOUT), kde LIN je 
% vstupni ciselny seznam s nejmene jednim prvkem, VIN je vstupni promenna  
% obsahujici cislo/prah a VOUT je vystupni promenna vracejici prumernou 
% hodnotu cisel seznamu LIN, jejichz absolutni hodnota je vetsi nez prah.
% Muzete predpokladat, ze absolutni hodnota alespon jednoho cisla seznamu
% je vetsi nez prah.

% Testovaci predikaty:                                  % VOUT
u14_1:- u14([5,27,-1,28,19,-40],10,VOUT),write(VOUT).    % 8.5
u14_2:- u14([2.5,3.6,4.7],3,VOUT),write(VOUT).             % 4.15
u14_3:- u14([8,6,-6,-8],2,VOUT),write(VOUT).        % 0
u14_r:- write('Zadej LIN: '),read(LIN),
        write('Zadej VIN: '),read(VIN),
        u14(LIN,VIN,VOUT),write(VOUT).

% Reseni:
u14(LIN, VIN, VOUT) :- iterate(LIN, Sum, Count, VIN), VOUT is Sum / Count. 

my_abs(X, AbsVal) :- X >= 0 -> AbsVal is X; X < 0 -> AbsVal is -X.

get_value(Abs, X, Value, Count, Threshold) :- 
    Abs > Threshold -> Value is X, Count is 1; 
    Abs =< Threshold -> Value is 0, Count is 0.

iterate([], 0, 0, _).
iterate([H|T], SumFinal, CountFianl, Threshold) :- 
    iterate(T, SumTemp, CountTemp, Threshold), 
    my_abs(H, X), get_value(X, H, Val, Count, Threshold), 
    SumFinal is SumTemp + Val, 
    CountFianl is CountTemp + Count.