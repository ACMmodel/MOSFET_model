v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 70 -440 580 -50 {flags=graph


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





















linewidth_mult=4.0
subdivx=3

color=5
x1=0.05
x2=3.3
node=i(gm_id)



y1=0.17
y2=29}
B 2 70 -50 580 350 {flags=graph


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





color=4




node=i(vs)

y1=-14
y2=-5.3
x2=3.3
x1=0.05}
N -420 20 -340 20 {
lab=vg}
N -300 -90 -300 -10 {
lab=#net1}
N -300 -90 -220 -90 {
lab=#net1}
N -300 50 -300 100 {
lab=#net2}
N -220 -30 -220 -20 {
lab=GND}
N -200 80 -200 100 {
lab=GND}
N -300 160 -300 180 {
lab=GND}
N -420 80 -420 100 {
lab=GND}
N -300 20 -200 20 {
lab=#net3}
C {devices/vsource.sym} -220 -60 0 0 {name=Vds value=13m}
C {devices/vsource.sym} -200 50 0 0 {name=V3 value=0}
C {devices/vsource.sym} -300 130 0 0 {name=Vs value=0}
C {devices/gnd.sym} -420 100 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -300 180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -200 100 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -220 -20 0 0 {name=l4 lab=GND}
C {devices/launcher.sym} -375 -155 0 0 {name=h4 
descr="Ctrl-Left-Click to load/unload" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
C {devices/code_shown.sym} -440 -420 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {symbols/nfet_03v3.sym} -320 20 0 0 {name=M1
L=10u
W=10u
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
C {devices/vsource.sym} -420 50 0 0 {name=Vgb value=0}
C {devices/code.sym} -450 -310 0 0 {name=NGSPICE
only_toplevel=true
value="

.control
save all
dc Vgb 0.05 3.3 1m

let gm_id = deriv(ln(i(Vs)))
save gm_id

meas dc gm_id_max MAX gm_id
let gm_id_vt = 0.531*gm_id_max
save gm_id_vt

meas dc vt0 FIND V(vg) WHEN gm_id=gm_id_vt
meas dc is0_ FIND i(Vs) WHEN V(vg)=vt0

let is0 = is0_/0.88
let VT_val=0.026
let n = 1/(gm_id_max*VT_val)
save is0 vt0 n
echo
echo
echo

echo Extracted parameters:
print is0 vt0 n


echo
echo
echo

remzerovec
write nmos_ext.raw

.endc

" }
C {devices/lab_wire.sym} -370 20 0 0 {name=p1 sig_type=std_logic lab=vg}
