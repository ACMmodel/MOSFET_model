v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -60 -360 450 40 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1


divx=6
subdivx=3
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0












y1=1.3e-11
y2=0.0026
x2=3.3
x1=0.1
color="4 5"
node="\\"ID_ACM;i(vs)\\"
\\"ID_GF;i(vs2)\\""
linewidth_mult=3.0}
B 2 -60 -750 450 -360 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1


divx=6

xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0





















linewidth_mult=3.0
subdivx=3

color="4 5"
x1=0.1
x2=3.3
node="\\"gm/ID - ACM;i(gm_id)\\"
\\"gm/ID - GF180;i(gm_id_gf)\\""



y1=0.55
y2=29}
B 2 450 -360 960 40 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=8
unity=1


divx=6
subdivx=3
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=1












y1=-11
y2=-2.5
x2=3.3
x1=0.1
color="4 5"
node="\\"ID_ACM;i(vs)\\"
\\"ID_GF;i(vs2)\\""
linewidth_mult=3.0}
N -210 -170 -210 -160 {
lab=GND}
N -200 -290 -200 -280 {
lab=GND}
N -300 -350 -200 -350 {
lab=vd}
N -300 -350 -300 -260 {
lab=vd}
N -400 -170 -400 -150 {
lab=GND}
N -300 -200 -300 -190 {
lab=vs}
N -300 -130 -300 -110 {
lab=GND}
N -300 -230 -210 -230 {
lab=vb}
N -330 -190 -300 -190 {
lab=vs}
N -230 -250 -230 -230 {
lab=vb}
N -520 -140 -520 -130 {
lab=GND}
N -510 -300 -510 -290 {
lab=GND}
N -610 -360 -510 -360 {
lab=vd2}
N -610 -360 -610 -270 {
lab=vd2}
N -610 -210 -610 -200 {
lab=vs2}
N -610 -140 -610 -120 {
lab=GND}
N -610 -240 -520 -240 {
lab=vb2}
N -640 -200 -610 -200 {
lab=vs2}
N -540 -260 -540 -240 {
lab=vb2}
N -520 -240 -520 -200 {
lab=vb2}
N -700 -240 -650 -240 {
lab=vg}
N -400 -230 -340 -230 {
lab=vg}
C {devices/code_shown.sym} -750 -830 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.model NMOS_ACM nmos_ACM
"}
C {devices/code_shown.sym} -740 -710 0 0 {name=NGSPICE only_toplevel=true
value="
.control
pre_osdi /home/gmaranhao/Desktop/gf180_work/ACM/NMOS_ACM_2V0.osdi
save all

dc VG 0.1 3.3 5m

*gm for ACM
let gm_id = deriv(ln(i(Vs)))

*gm for GF180
let gm_id_gf = deriv(ln(i(Vs2)))

save gm_id gm_id_gf
write TB_nmos_acm.raw

.endc
"}
C {devices/vsource.sym} -400 -200 0 0 {name=VG value=0}
C {devices/vsource.sym} -200 -320 0 0 {name=VD value=3.3}
C {devices/vsource.sym} -210 -200 0 0 {name=VB value=0}
C {devices/gnd.sym} -300 -110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -210 -160 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -200 -280 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -400 -150 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -300 -160 0 0 {name=VS value=0}
C {devices/lab_wire.sym} -360 -230 0 0 {name=p1 sig_type=std_logic lab=vg}
C {devices/lab_wire.sym} -260 -350 0 0 {name=p2 sig_type=std_logic lab=vd}
C {devices/lab_wire.sym} -330 -190 0 0 {name=p3 sig_type=std_logic lab=vs
}
C {devices/lab_wire.sym} -230 -250 0 0 {name=p4 sig_type=std_logic lab=vb
}
C {/home/gmaranhao/Desktop/gf180_work/ACM/nmos_acm.sym} -310 -230 0 0 {name=N1 
model=NMOS_ACM 
w=5u 
l=0.30u 
n=1.383 
is=1.076u 
vt0=0.6493
sigma=26m 
zeta=22m
}
C {symbols/nfet_03v3.sym} -630 -240 0 0 {name=M1
L=0.30u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/vsource.sym} -510 -330 0 0 {name=VD2 value=3.3}
C {devices/vsource.sym} -520 -170 0 0 {name=VB2 value=0}
C {devices/gnd.sym} -610 -120 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -520 -130 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} -510 -290 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} -610 -170 0 0 {name=VS2 value=0}
C {devices/lab_wire.sym} -700 -240 0 0 {name=p5 sig_type=std_logic lab=vg
}
C {devices/lab_wire.sym} -570 -360 0 0 {name=p6 sig_type=std_logic lab=vd2}
C {devices/lab_wire.sym} -640 -200 0 0 {name=p7 sig_type=std_logic lab=vs2
}
C {devices/lab_wire.sym} -540 -260 0 0 {name=p8 sig_type=std_logic lab=vb2
}
C {devices/launcher.sym} -5 -775 0 0 {name=h4 
descr="Ctrl-Left-Click to load/unload" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
