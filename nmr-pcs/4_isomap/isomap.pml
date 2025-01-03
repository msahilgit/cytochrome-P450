# PyMOL macro for loading tensor isosurface from paramagpy
# ax    | 1E-32 m^3 :    -7.198
# rh    | 1E-32 m^3 :    -4.049
# x     |   1E-10 m :    17.842
# y     |   1E-10 m :   -12.493
# z     |   1E-10 m :    12.878
# a     |       deg :    73.347
# b     |       deg :    12.911
# g     |       deg :   132.974
# mueff |        Bm :     0.000
# shift |       ppm :     0.000
# B0    |         T :    18.790
# temp  |         K :   298.150
# t1e   |        ps :     0.000
# taur  |        ns :     0.000

import os, pymol
curdir = os.path.dirname(pymol.__script__)
set normalize_ccp4_maps, off
meshfile = os.path.join(curdir, './isomap.pml.ccp4')
cmd.load(meshfile, 'isomap', 1, 'ccp4')
isosurface pos_isomap, isomap, 1.0
isosurface neg_isomap, isomap, -1.0
set transparency, 0.5, pos_isomap
set transparency, 0.5, neg_isomap
set surface_color, blue, pos_isomap
set surface_color, red, neg_isomap
pseudoatom ori_isomap, pos=[17.842, -12.493, 12.878]
show spheres, ori_isomap
color pink, ori_isomap
cmd.load(os.path.join(curdir, '../0_crystals/3l63.pdb'),'3l63')
show_as cartoon, 3l63
