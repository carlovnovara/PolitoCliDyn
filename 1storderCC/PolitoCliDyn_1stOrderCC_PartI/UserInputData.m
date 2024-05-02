%% PolitoCliDyn: 1st order CC - model regression - Part I
%% User input data
% Authors E.Canuto, C.Novara, Politecnico di Torino, Torino, Italy 
% April 2024
%% User input data, Fit=Regression
logOpt=0;  % =1 regression search is graphically shown
%  Rolling regression times
%  Example
%  Ind.eraInit 1stInit   2ndInit ----    --- tLastFit         End of raw data 
%     1850     1855      1875                 1955                   2020
%               |--dFit--|--20y ....    --20y--|--- 66 samples       ---|
%               |-----                     166 samples      ---|
%                        |-----                     146 samples      ---| 
% Explanation:  1stInit=tLastInit-dtFit*(szFit-1)
% Regression bounds
%  1850                          1980                    2000        2020 
%    |----   recommended       ----|----not recommended----|--forbidden--|
% Explanation:  2000 (explicit) fixed by difference F-test (see Figure 8)
%               diverging estimates                    
%               1980 (not explicit) fixed by explained and residual RMS 
%               increasing uncertainty (see Figure 9)       
% Bounds are checked and input data corrected (WARNING)
%
tLastFit=2000;      % Init year of the last rolling regression
szFit=31;           % Number of rolling regressions
dtFit=5;            % Step between init years >=1
indPlotFit=szFit-9;   % regression count whose results are plotted and written
                    % on the Command Window <=szFit