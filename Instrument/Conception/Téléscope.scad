/* Télescope Quint Fonsegrives */
// En mm
precision = 200;
diametre_miroir = 230;
epaisseur_tubes=5;
hauteur_telescope = 1100;

hauteur_araignee = 450;

module tube(hole_pos){
  color("BurlyWood") difference(){
  // Tube du télescope (un cylindre évidé)
	cylinder(h=hauteur_telescope, r=(diametre_miroir/2)+2+epaisseur_tubes, center=true, $fn=precision);
	union(){
		cylinder(h=hauteur_telescope+2, r=(diametre_miroir/2)+2, center=true, $fn=precision);
	     translate([diametre_miroir/2,0,hole_pos]) rotate([0,90,0]) 
                              cylinder(h=epaisseur_tubes*10+2,r=25,center=true,$fn=precision);
		}
	}
}
//Miroir primaire
module miroir(){
translate ([0,0,-hauteur_telescope/2]) color("cyan") cylinder(h=100, 
										           	r=diametre_miroir/2,
												center=true,$fn=precision);
}

module ReceptacleMiroir(){
 color("green") difference(){
  // Comme une boite de chapeau à fond plat
  translate([0,0,-hauteur_telescope/2]) cylinder(h=220, 
							r=(diametre_miroir/2)+2+(epaisseur_tubes*2), 
							center=true, $fn=precision);
  translate([0,0,-hauteur_telescope/2+epaisseur_tubes]) cylinder(h=220, r=(diametre_miroir/2)+2+epaisseur_tubes, center=true, $fn=precision);
 }
}

module vis_support_mirror(){
	union(){
    // Pas de vis
	 cylinder(h=120,r=2,center=true, $fn=precision);
	  translate([0,0,-120/2]) {
		difference(){
			// Tete de la vis
			cylinder(h=2,r=5,center=true, $fn=precision);
			// Gorge de la tete de vis
			translate([0,0,-1]) cube(size=[15,1,1],center=true);
		}
	 }
	}
};

module miroir_secondaire(mir_pos){
	translate([0,0,mir_pos]) intersection(){
		cylinder(h=200,r=20,center=true,$fn=100);
		rotate([0,-45,0]) cube(size=[100,100,1],center=true);
	}
}

// Concept uniquement
module araignee(ar_pos){
	translate([0,0,ar_pos]) rotate([0,90,0]) color("red") cylinder(h=diametre_miroir, r=1, center=true, $fn=precision);
	translate([0,0,ar_pos]) rotate([90,90,0]) color("red") cylinder(h=diametre_miroir, r=1, center=true, $fn=precision);
}

// Utiliser % devant un de ces objets pour le rendre 
// transparent
// Exemple : 
// %tube();
module telescope(){
ReceptacleMiroir();
miroir();
%tube(hauteur_araignee-50);
dst = 60;
translate([dst,dst,-hauteur_telescope/2-52]) vis_support_mirror();
translate([-dst,-dst,-hauteur_telescope/2-52]) vis_support_mirror();
translate([dst,-dst,-hauteur_telescope/2-52]) vis_support_mirror();
translate([-dst,dst,-hauteur_telescope/2-52]) vis_support_mirror();
araignee(hauteur_araignee);
miroir_secondaire(hauteur_araignee-50);
}

telescope();