v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 580 -650 1040 -250 {flags=graph


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
x1=0.1
x2=1.8
node=i(gm_id)



y1=0.55
y2=28
digital=0
rainbow=0}
B 2 580 -250 1040 150 {flags=graph


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












y1=-13
y2=-5.4

x1=0.1
x2=1.8
color=4
node=i(vs)}
N 230 -370 310 -370 {
lab=vg}
N 350 -480 350 -400 {
lab=#net1}
N 350 -480 430 -480 {
lab=#net1}
N 350 -340 350 -290 {
lab=#net2}
N 430 -420 430 -410 {
lab=GND}
N 450 -310 450 -290 {
lab=GND}
N 350 -230 350 -210 {
lab=GND}
N 230 -310 230 -290 {
lab=GND}
N 350 -370 450 -370 {
lab=#net3}
C {sky130_fd_pr/corner.sym} 390 -630 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/vsource.sym} 230 -340 0 0 {name=Vgb value=0}
C {devices/vsource.sym} 430 -450 0 0 {name=Vds value=13m}
C {devices/vsource.sym} 450 -340 0 0 {name=V3 value=0}
C {devices/vsource.sym} 350 -260 0 0 {name=Vs value=0}
C {devices/gnd.sym} 230 -290 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 350 -210 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 450 -290 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 430 -410 0 0 {name=l4 lab=GND}
C {devices/launcher.sym} 605 -685 0 0 {name=h4 
descr="Ctrl-Left-Click to load/unload waveforms" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
C {sky130_fd_pr/nfet_01v8.sym} 330 -370 0 0 {name=M1
L=10
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 290 -370 0 0 {name=p1 sig_type=std_logic lab=vg}
C {devices/code.sym} 220 -630 0 0 {name=NGSPICE1
only_toplevel=true
value="

.control
save all
dc Vgb 0.05 1.8 1m

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

"}
