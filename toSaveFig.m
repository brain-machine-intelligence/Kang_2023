clear all

%% NP
load('rirrNP_matchTn.mat')
SampleNplot(rirrNP_matchTn{1,1}, 9); savefig('rirrNP_matchTn_2s.fig')
SampleNplot(rirrNP_matchTn{2,1}, 10); savefig('rirrNP_matchTn_1p5s.fig')
SampleNplot(rirrNP_matchTn{3,1}, 11); savefig('rirrNP_matchTn_1s.fig')
SampleNplot(rirrNP_matchTn{4,1}, 12); savefig('rirrNP_matchTn_p5s.fig')

load('rirrNP_matchRwTn.mat')
SampleNplot(rirrNP_matchRwTn{1,1}, 13); savefig('rirrNP_matchRwTn_2s.fig')
SampleNplot(rirrNP_matchRwTn{2,1}, 14); savefig('rirrNP_matchRwTn_1p5s.fig')
SampleNplot(rirrNP_matchRwTn{3,1}, 15); savefig('rirrNP_matchRwTn_1s.fig')
SampleNplot(rirrNP_matchRwTn{4,1}, 16); savefig('rirrNP_matchRwTn_p5s.fig')

%% ME
load('rirrME_matchTn.mat')
SampleNplot(rirrME_matchTn{1,1}, 9); savefig('rirrME_matchTn_2s.fig')
SampleNplot(rirrME_matchTn{2,1}, 10); savefig('rirrME_matchTn_1p5s.fig')
SampleNplot(rirrME_matchTn{3,1}, 11); savefig('rirrME_matchTn_1s.fig')
SampleNplot(rirrME_matchTn{4,1}, 12); savefig('rirrME_matchTn_p5s.fig')

load('rirrME_matchRwTn.mat')
SampleNplot(rirrME_matchRwTn{1,1}, 13); savefig('rirrME_matchRwTn_2s.fig')
SampleNplot(rirrME_matchRwTn{2,1}, 14); savefig('rirrME_matchRwTn_1p5s.fig')
SampleNplot(rirrME_matchRwTn{3,1}, 15); savefig('rirrME_matchRwTn_1s.fig')
SampleNplot(rirrME_matchRwTn{4,1}, 16); savefig('rirrME_matchRwTn_p5s.fig')


%% MX
load('rirrMX_matchTn.mat')
SampleNplot(rirrMX_matchTn{1,1}, 9); savefig('rirrMX_matchTn_2s.fig')
SampleNplot(rirrMX_matchTn{2,1}, 10); savefig('rirrMX_matchTn_1p5s.fig')
SampleNplot(rirrMX_matchTn{3,1}, 11); savefig('rirrMX_matchTn_1s.fig')
SampleNplot(rirrMX_matchTn{4,1}, 12); savefig('rirrMX_matchTn_p5s.fig')

load('rirrMX_matchRwTn.mat')
SampleNplot(rirrMX_matchRwTn{1,1}, 13); savefig('rirrMX_matchRwTn_2s.fig')
SampleNplot(rirrMX_matchRwTn{2,1}, 14); savefig('rirrMX_matchRwTn_1p5s.fig')
SampleNplot(rirrMX_matchRwTn{3,1}, 15); savefig('rirrMX_matchRwTn_1s.fig')
SampleNplot(rirrMX_matchRwTn{4,1}, 16); savefig('rirrMX_matchRwTn_p5s.fig')

close all