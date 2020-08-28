# Simulation-of-the-Snake-locomotion-mechanisms
(Implementation of Snake locomotion mechanisms on the derived Simplified Kinematical Model of discrete Snake Robot in MATLAB.)


## Introduction

Snakes use at least five unique modes of terrestrial locomotion. The kind of locomotion a snake uses in any particular instance depends on several factors such as the kind of surface it is crawling on and its speed. 

An elegant way to express gaits for a snake robot is the gait equation, which expresses joint angles as a function of the joint index and the phase of the gait cycle. The general gait equation of snake movements can be expressed as,

<img src="/Media/general_Gait_equation.PNG" height="70" />

Where, *n* is the joint index. *A*<sub>*x*</sub>, *A*<sub>*y*</sub> represent the amplitudes; *δ*<sub>*x*</sub> *δ*<sub>*y*</sub> represents the spatial frequency; *ω*<sub>*x*</sub>, *ω*<sub>*y*</sub> represent the temporal frequency and *ϕ* represents the phase difference between the sine waves in horizontal and vertical plane.

## Lateral Undulation (Serpentine Movement) 

Lateral Undulation is the common serpentine locomotion of snakes. In lateral undulation, as in simple undulation, waves of lateral bending are propagated along the body from head to tail.

<img src="https://latex.codecogs.com/gif.latex?%5Ctextbf%7BGait%7Eequation%3A%7D%7E%7E%5Ctheta%28t%29%3D%20%5Cfrac%7Ba%5Cpi%7D%7B40%7D%5Ctimes%5Csin%5Cleft%20%5C%28%5Cfrac%7B4%5Cpi%7D%7B41%7D%5Ctimes%20t%5Cright%5C%29&plus;%5Cphi" />

(a = 3.5,*ϕ* = 0<sup>*r*</sup>),(a = 4.5,*ϕ* = 0<sup>*r*</sup>),(a = 5.5,*ϕ* = 0<sup>*r*</sup>)

<img src="/Media/LU_A_3_5_PH_0.gif" height="150"/> 
<img src="/Media/LU_A_4_5_PH_0.gif" height="150"/> 
<img src="/Media/LU_A_5_5_PH_0.gif" height="150"/> 

(a = 3.5,*ϕ* = 0.05<sup>*r*</sup>),(a = 4.5,*ϕ* = 0.05<sup>*r*</sup>),(a = 5.5,*ϕ* = 0.05<sup>*r*</sup>)

<img src="/Media/LU_A_3_5_PH_0_05.gif" height="220" align="left"/> 
<img src="/Media/LU_A_4_5_PH_0_05.gif" height="220" align="left"/> 
<img src="/Media/LU_A_5_5_PH_0_05.gif" height="220"/> 

(a = 3.5,*ϕ* = 0.06<sup>*r*</sup>),(a = 4.5,*ϕ* = 0.06<sup>*r*</sup>),(a = 5.5,*ϕ* = 0.06<sup>*r*</sup>)

<img src="/Media/LU_A_3_5_PH_0_06.gif" height="220" align="left"/> 
<img src="/Media/LU_A_4_5_PH_0_06.gif" height="220" align="left"/> 
<img src="/Media/LU_A_5_5_PH_0_06.gif" height="220"/>

(a = 3.5,*ϕ* = 0.07<sup>*r*</sup>),(a = 4.5,*ϕ* = 0.07<sup>*r*</sup>),(a = 5.5,*ϕ* = 0.07<sup>*r*</sup>)

<img src="/Media/LU_A_3_5_PH_0_07.gif" height="220" align="left"/> 
<img src="/Media/LU_A_4_5_PH_0_07.gif" height="220" align="left"/> 
<img src="/Media/LU_A_5_5_PH_0_07.gif" height="220"/> 

## Sidewinding 

Sidewinding is used by many snakes crawling on smooth or slippery surfaces, but is best known in the sidewinder rattlesnake (Crotalus cerastes) and a few desert vipers of Africa and Asia. 

<img src="/Media/SideWindingMovement.PNG" height="500"/>

Diagram illustrating the relationship of side-winding to serpentine motion.(Source [:link:][Source1])

[Source1]: https://jeb.biologists.org/content/jexbio/23/2/101.full.pdf

<img src="https://latex.codecogs.com/gif.latex?%5Ctextbf%7BGait%7Eequation%3A%7D%7E%7E%5Ctheta%28t%29%3D%20%5Cbegin%7Bcases%7D%20%5Cfrac%7Ba%5Cpi%7D%7B30%7D%5Csin%28%5Cfrac%7B3%5Cpi%7D%7B62%7D%5Ctimes%20t%29%20%26%20%5Ctext%7B%20if%20%7D%20t%3C%5Cfrac%7B93%7D%7B4%7D%20%5C%5C%200%26%20%5Ctext%7B%20if%20%7D%20Otherwise%20%5Cend%7Bcases%7D" />

(a = 3.5),(a = 4.5),(a = 5)

<img src="/Media/SWDG_A_3_5.gif" height="300"/>
<img src="/Media/SWDG_A_4_5.gif" height="300"/>
<img src="/Media/SWDG_A_5.gif" height="300"/>

## Concertina

Concertina locomotion involves alternately pulling up the body into bends and then straightening out the body forward from the bends. The front part of the body then comes to rest on the surface and the back part of the body is pulled up into bends again, and so forth. 

<img src="/Media/CrotalineMovement.PNG" height="400"/>

Successive phases (1-7) in the concertina movement of a snake not subjected to any lateral restraint, but in which curvature of the body is restricted to the central region of the body.(Source [:link:][Source1])

<img src="https://latex.codecogs.com/gif.latex?%5Ctextbf%7BGait%7Eequation%3A%7D%7E%7E%5Ctheta%28t%29%3D%20%5Cfrac%7Ba%5Cpi%7D%7Bn%7D%5Csin%28%5Cfrac%7B%5Comega%5Cpi%7D%7B41%7D%5Ctimes%20t%29%5Ctimes%20e%5E%7B-0.005*%28t-20.5%29%5E2%7D" />

(a = 7,*ω*=4),(a = 8,*ω*=6),(a = 10,*ω*=8)

<img src="/Media/CONT_A7_W4.gif" height="150"/>
<img src="/Media/CONT_A8_W6.gif" height="150"/>
<img src="/Media/CONT_A10_W8.gif" height="150"/>

## References

[1] https://userweb.ucs.louisiana.edu/~brm2286/locomotn.htm

[2] Prautsch, Pavel, Tsutomu Mita, and Tetsuya Iwasaki. "Analysis and control of a gait of snake robot." IEEJ Transactions on Industry Applications 120.3 (2000): 372-381.

[3] Gray, James. "The mechanism of locomotion in snakes." Journal of experimental biology 23.2 (1946): 101-120.

[4] Thakker, Rohan, et al. "Rebis-reconfigurable bipedal snake robot." 2014 IEEE/RSJ International Conference on Intelligent Robots and Systems. IEEE, 2014.


