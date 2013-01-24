/* Télescope Quint Fonsegrives */

precision = 200;

module tube(){
  color("BurlyWood") difference(){
  // Tube du télescope (un cylindre évidé)
	cylinder(h=1.80, r=0.26, center=true, $fn=precision);
	cylinder(h=2, r=0.24, center=true, $fn=precision);
	}
}
//Miroir primaire
translate ([0,0,-0.85]) color("cyan") cylinder(h=0.10, r=0.23, center=true,$fn=precision);

module ReceptacleMiroir(){
 color("red") difference(){
  // Comme une boite de chapeau à fond plat
  translate([0,0,-0.91]) cylinder(h=0.22, r=0.27, center=true, $fn=precision);
  translate([0,0,-0.865]) cylinder(h=0.22, r=0.265, center=true, $fn=precision);
 }
}

module vis_support_mirror(){
	union(){
    // Pas de vis
	 cylinder(h=0.13,r=0.02,center=true, $fn=precision);
	  translate([0,0,-0.13/2]) {
		difference(){
			// Tete de la vis
			cylinder(h=0.02,r=0.05,center=true, $fn=precision);
			// Gorge de la tete de vis
			translate([0,0,-0.01]) cube(size=[0.15,0.01,0.01],center=true);
		}
	 }
	}
};

// Utiliser % devant un de ces objets pour le rendre 
// transparent
// Exemple : 
// %tube();
ReceptacleMiroir();
tube();
translate([0.1,0.1,-0.97]) vis_support_mirror();
translate([-0.1,-0.1,-0.97]) vis_support_mirror();
translate([0.1,-0.1,-0.97]) vis_support_mirror();
translate([-0.1,0.1,-0.97]) vis_support_mirror();
