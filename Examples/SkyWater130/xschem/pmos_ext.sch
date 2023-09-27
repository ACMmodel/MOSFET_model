v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 640 -800 1090 -400 {flags=graph


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


node=i(gm_id)




y2=29
y1=-3.5
x1=0.05
x2=1.8}
B 2 640 -400 1090 0 {flags=graph


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
















linewidth_mult=3.0




color=4
node=i(vd)

x1=0.05
x2=1.8

y1=-14
y2=-5.8}
N 350 -500 430 -500 {
lab=vg}
N 470 -610 470 -530 {
lab=#net1}
N 470 -610 550 -610 {
lab=#net1}
N 470 -470 470 -420 {
lab=#net2}
N 550 -550 550 -540 {
lab=GND}
N 570 -440 570 -420 {
lab=GND}
N 470 -360 470 -340 {
lab=GND}
N 350 -440 350 -420 {
lab=GND}
N 470 -500 570 -500 {
lab=#net3}
C {sky130_fd_pr/corner.sym} 510 -770 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/vsource.sym} 350 -470 0 0 {name=Vgb value=0}
C {devices/vsource.sym} 550 -580 0 0 {name=Vsd value=1.8}
C {devices/vsource.sym} 570 -470 0 0 {name=V3 value=1.8}
C {devices/vsource.sym} 470 -390 0 0 {name=Vd value=1.787}
C {devices/gnd.sym} 350 -420 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 470 -340 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 570 -420 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 550 -540 0 0 {name=l4 lab=GND}
C {devices/launcher.sym} 685 -835 0 0 {name=h4 
descr="Ctrl-Left-Click to load/unload waveforms" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
C {sky130_fd_pr/pfet_01v8.sym} 450 -500 0 0 {name=M1
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 420 -500 0 0 {name=p1 sig_type=std_logic lab=vg}
C {devices/code.sym} 360 -770 0 0 {name=NGSPICE1
only_toplevel=true
value="

.control
save all
dc Vgb 0.05 1.75 10m

let gm_id = -deriv(ln(i(Vd)))
save gm_id

meas dc gm_id_max MAX gm_id
let gm_id_vt = 0.531*gm_id_max
save gm_id_vt

meas dc vt FIND V(vg) WHEN gm_id=gm_id_vt
let vt0=vt-1.8
meas dc is0_ FIND i(Vd) WHEN V(vg)=vt

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
write pmos_ext.raw

.endc

"}
