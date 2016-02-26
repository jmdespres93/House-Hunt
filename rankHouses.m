function ranking = rankHouses(houses, weights)

%% rankHouses: ranks an input list of houses
% 
% rankHouses ranks the houses held in houses based on the criteria
% attributed to them and the weights held in weights. This way we can
% decide based on how important certain things are. There is one weight for
% each of the criteria in houses. The inputs are formatted as follows.
%
%   houses = [addressn, pricen, square ftn, landn, dist to benn, dist to
%               jas(stow)n, dist to jas(framingham)n, dist to bostonn, 
%               days on marketn, fireplacen, garagen]
%
%   weights = [price weight, square ft weight, land weight, ben weight, jas
%   stow weight, jas framingham weight, dist to boston weight, days on market weight]

%preallocate for speeeeeed
% address, score
scores = zeros(size(houses, 1), 2);
scores(:,1) = houses(:,1);
for n=2:length(houses(1,(2:end))) 
    houses(:,n)=houses(:,n)-min(houses(:,n));
end
pricemax = max(houses(:,2));
sqftmax = max(houses(:,3));
landmax = max(houses(:,4));
benmax = max(houses(:,5));
stowmax = max(houses(:,6));
frammax = max(houses(:,7));
bostmax = max(houses(:,8));
marketdaymax = max(houses(:,9));
fpmax = max(houses(:,10));
garmax = max(houses(:,11));

pricescore = (1-(houses(:,2)./pricemax))*weights(1);
sqftscore = (houses(:,3)./sqftmax)*weights(2);
landscore = (houses(:,4)./landmax)*weights(3);
benscore = (1-(houses(:,5)./benmax))*weights(4);
stowscore = (1-(houses(:,6)./stowmax))*weights(5);
framscore = (1-(houses(:,7)./frammax))*weights(6);
bostscore = (1-(houses(:,8)./bostmax))*weights(7);
marketdayscore = (houses(:,9)./marketdaymax)*weights(8);
fpscore = (houses(:,10)./fpmax)*weights(9);
garscore = (houses(:,11)./garmax)*weights(10);

for n=1:size(houses, 1)
    
   scores(n,2) = pricescore(n)+sqftscore(n)+landscore(n)+benscore(n)+...
                 stowscore(n)+framscore(n)+bostscore(n)+marketdayscore(n) + ...
                 fpscore(n)+garscore(n)
    
end

ranking = sortrows(scores,-2)



    
