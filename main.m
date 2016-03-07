
houseTable = readtable('houselist.txt');

houses = table2array(houseTable);

str = input('would yew like to set weights(0-10)? (y/somethingotherthany) (if not y, defaults will be set):  ', 's');

if str=='y' 
    weights(1)=input('price: ');
    weights(2)=input('sqare footage: ');
    weights(3)=input('land: ');
    weights(4)=input('distance to Cascodium(mins): ');
    weights(5)=input('distance to Bose Stow(mins: ');
    weights(6)=input('distance to Bose Framingham(mins): ');
    weights(7)=input('distance to Boston(house of blues)(mins): ');
    weights(8)=input('days on market: ');
    weights(9)=input('fireplaces: ');
    weights(10)=input('garage: ');   
    weights(11)=input('taxes:  ');
    
else    
    weights = [10 7 6 6 7 5 3 2 4 4 5];   
end

ranking = rankHouses(houses, weights);