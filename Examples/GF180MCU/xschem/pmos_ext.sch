v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 240 -650 750 -260 {flags=graph


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
x2=3.15
node=i(gm_id)



y1=0.26
y2=27}
B 2 240 -260 750 140 {flags=graph


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




node=i(vd)

y1=-13
y2=-4.8
x2=3.15
x1=0.05}
N -120 -80 -40 -80 {
lab=vg}
N 0 -190 0 -110 {
lab=#net1}
N 0 -190 80 -190 {
lab=#net1}
N 0 -50 0 0 {
lab=#net2}
N 80 -130 80 -120 {
lab=GND}
N 100 -20 100 0 {
lab=GND}
N 0 60 0 80 {
lab=GND}
N -120 -20 -120 0 {
lab=GND}
N 0 -80 100 -80 {
lab=#net3}
C {devices/vsource.sym} -120 -50 0 0 {name=Vgb value=0}
C {devices/vsource.sym} 80 -160 0 0 {name=Vsd value=3.3}
C {devices/vsource.sym} 100 -50 0 0 {name=V3 value=3.3}
C {devices/vsource.sym} 0 30 0 0 {name=Vd value=3.287}
C {devices/gnd.sym} -120 0 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 0 80 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 100 0 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 80 -120 0 0 {name=l4 lab=GND}
C {devices/code_shown.sym} -240 -590 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {symbols/pfet_03v3.sym} -20 -80 0 0 {name=M7
L=0.3u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/code.sym} -250 -480 0 0 {name=NGSPICE1
only_toplevel=true
value="

.control
save all
dc Vgb 0.05 3.15 10m

let gm_id = -deriv(ln(i(Vd)))
save gm_id

meas dc gm_id_max MAX gm_id
let gm_id_vt = 0.531*gm_id_max
save gm_id_vt

meas dc vt FIND V(vg) WHEN gm_id=gm_id_vt
let vt0=vt-3.3
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

" }
C {devices/lab_wire.sym} -70 -80 0 0 {name=p1 sig_type=std_logic lab=vg}
C {devices/launcher.sym} -175 -265 0 0 {name=h1 
descr="Ctrl-Left-Click to load/unload" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw dc
"
}
